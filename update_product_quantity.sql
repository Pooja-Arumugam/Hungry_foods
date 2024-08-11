
-- 12.
-- Update the PRODQUANTITY in PRODUCT based on the total quantity supplied by a specific supplier
UPDATE PRODUCT P
SET PRODQUANTITY = (
    SELECT SUM(p.PRODQUANTITY)
    FROM SUPPLIER S
    WHERE S.PRODNR = P.PRODNR
)
WHERE EXISTS (
    SELECT 1
    FROM SUPPLIER S
    WHERE S.PRODNR = P.PRODNR
);

-- Display the updated results
SELECT * FROM PRODUCT;