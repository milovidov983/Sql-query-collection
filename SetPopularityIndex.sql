WITH t AS (
  SELECT *
  FROM "Makes" AS m
  JOIN
    (SELECT cast(ads->>'makeId' AS int) AS make_id, count(*) AS count
    FROM (
        SELECT *
        FROM dblink('host=localhost user=postgres password=*** dbname=vehicleappraisal', 'SELECT "Data" FROM "Ads" ' ) AS t1(ads jsonb)
      ) AS t
    WHERE cast(ads->>'dateAt' as timestamp) > '2019-04-08T00:00'
    GROUP BY ads->>'makeId') as a
  ON
    a.make_id = m."Id"
)
UPDATE "Makes"
SET "Popularity" = t.count
FROM t
WHERE "Makes"."Id" = t."Id";
