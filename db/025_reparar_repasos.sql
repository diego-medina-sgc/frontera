-- ============================================================
-- Frontera - reparar los repasos que se perdieron
-- ============================================================
-- El control 16 nuevo encontró cuatro lecciones marcadas como hechas
-- sin un solo repaso agendado: f02, f03, f04 y f05, las cuatro
-- contestadas el 21/11 con comprensión 8. La lección de radar del
-- mismo día sí tiene sus tres, así que no fue un problema de código
-- de ese momento: les pasó algo después, probablemente el borrado a
-- mano de los repasos basura que se habían agendado sobre lecciones
-- marcadas como ya sabidas.
--
-- Sin esto, el motor de repaso espaciado queda apagado para esas
-- cuatro y no vuelven nunca. Que es justo lo que la app promete que
-- no pasa.
--
-- Se agendan desde hoy con la escalera normal (3, 10 y 30 días,
-- porque la comprensión fue mayor a 6), pero escalonadas un día por
-- lección: si no, las cuatro primeras caen el mismo día y la persona
-- se come cuatro repasos seguidos antes de ver lo de hoy. Uno por día
-- es lo mismo medido y no se siente como una deuda.
-- ============================================================

with faltantes as (
  select
    e.profile_id,
    e.lesson_id,
    coalesce(e.comprension, 10) as comprension,
    -- El cast no es decorativo: row_number() devuelve bigint y en
    -- Postgres no existe date + bigint.
    (row_number() over (order by e.profile_id, e.lesson_id) - 1)::int as orden
  from lesson_state e
  where e.status = 'hecha'
    and e.answered_at is not null
    and not exists (
      select 1 from reviews r
      where r.profile_id = e.profile_id
        and r.lesson_id = e.lesson_id
    )
)
insert into reviews (profile_id, lesson_id, stage, due_on)
select
  f.profile_id,
  f.lesson_id,
  v.stage,
  current_date + (case when f.comprension <= 6 then v.dias_corto else v.dias_largo end) + f.orden
from faltantes f
cross join (values
  (0, 3, 2),
  (1, 10, 7),
  (2, 30, 21)
) as v(stage, dias_largo, dias_corto)
on conflict (profile_id, lesson_id, stage) do nothing;
