-- 8.
-- COUNTING THE TOTAL QUANTITY OF PRODUCT NAMES ACCORDING TO THE AVAILABLE PRODNR
SELECT P.PRODNR, P.PRODNAME,
SUM(P.prodquantity) as totalquantity
FROM PRODUCT P, supplier s
WHERE P.PRODNR = s.PRODNR
GROUP BY P.PRODNR