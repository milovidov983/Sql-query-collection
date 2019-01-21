-
-
- Очистка базы данных Fias от невалидных данных.
- Удаляет адреса с двумя активными и актуальными предками.
- В нашем случае помогло. Используйте на свой страх и риск.
-
-

UPDATE "Addresses"
SET "IsActual"=false, "IsActive"=false
WHERE "ObjectId" IN (
  SELECT "ObjectId"
  FROM "Addresses"
  WHERE "PrevId" isnull AND "ObjectId" IN (
    SELECT "ObjectId"
    FROM "Addresses"
    WHERE "IsActual" OR "IsActive"
    GROUP BY
        "ObjectId"
    HAVING
        COUNT(*) > 1)
);
