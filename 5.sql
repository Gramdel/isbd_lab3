select "Н_УЧЕНИКИ"."ГРУППА", avg(extract(years from age("Н_ЛЮДИ"."ДАТА_РОЖДЕНИЯ")))
from "Н_УЧЕНИКИ"
         join "Н_ЛЮДИ" on "Н_УЧЕНИКИ"."ЧЛВК_ИД" = "Н_ЛЮДИ"."ИД"
group by "Н_УЧЕНИКИ"."ГРУППА"
having avg(extract(years from age("Н_ЛЮДИ"."ДАТА_РОЖДЕНИЯ"))) >
       (select max(extract(years from age("Н_ЛЮДИ"."ДАТА_РОЖДЕНИЯ")))
        from "Н_УЧЕНИКИ"
                 join "Н_ЛЮДИ" on "Н_УЧЕНИКИ"."ЧЛВК_ИД" = "Н_ЛЮДИ"."ИД"
        where "ГРУППА" = '3100');