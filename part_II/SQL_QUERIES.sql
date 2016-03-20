SELECT  I.item_name
FROM    ITEM AS I, AUTHOR_ARTIST AS A, BOOK AS B, WRITTEN_BY AS WB
WHERE   I.barcode=B.barcode
AND     B.ISBN=WB.ISBN
AND     A.a_ID=WB.a_ID
AND     A.last_name='Pratchett'
AND     I.price<10;

SELECT  I.item_name, T.time
FROM    TRANSACTIONS AS T, CONTAINED_IN AS C, ITEM AS I
WHERE   T.transaction_ID = C.transaction_ID
AND     C.barcode = I.barcode
AND     T.customer_ID = 7938024839;

SELECT  I.item_name, B.ISBN
FROM    ITEM AS I, BOOK AS B, STORES AS STS
WHERE   I.barcode=B.barcode
AND     I.barcode=STS.barcode
AND     STS.inventory < 5;

SELECT  C.customer_ID, C.first_name, C.last_name, I.item_name
FROM    TRANSACTIONS AS T, CONTAINED_IN AS CI, ITEM AS I, BOOK AS B, AUTHOR_ARTIST AS AA, WRITTEN_BY AS WB, CUSTOMER AS C
WHERE   T.transaction_ID = CI.transaction_ID
AND     T.customer_ID = C.customer_ID
AND     CI.barcode = I.barcode
AND     I.barcode = B.barcode
AND     AA. a_ID = WB.a_ID
AND     WB.ISBN = B.ISBN
AND     AA.last_name = 'Pratchett';

SELECT  SUM(CI.quantity)
FROM    TRANSACTIONS AS TR, CONTAINED_IN AS CI, ITEM AS I, BOOK AS B, CUSTOMER AS C
WHERE   TR.transaction_ID = CI.transaction_ID	
AND     CI.barcode = I.barcode
AND     I.barcode = B.barcode
AND     C.customer_ID = TR.customer_ID
AND     C.customer_ID= 7938024839;

SELECT  MAX(sum_Quantity), customer_ID
FROM (
    SELECT SUM(quantity) AS sum_Quantity, customer_ID
    FROM   TRANSACTIONS AS TR, CONTAINED_IN AS CI, ITEM AS I, BOOK AS B
    WHERE  TR.transaction_ID = CI.transaction_ID
    AND    CI.barcode = I.barcode
    AND    I.barcode = B.barcode
    AND    TR.transaction_ID = '23452354234545242355'
    GROUP BY TR.customer_ID);

SELECT  fname, lname, MAX(ISBN_count)
FROM (
    SELECT  AA.first_name AS fname, AA.last_name AS lname, COUNT(B.ISBN) AS ISBN_count
    FROM    AUTHOR_ARTIST AS AA, WRITTEN_BY AS WB, BOOK AS B
    WHERE   AA.a_ID = WB.a_ID AND WB.ISBN = B.ISBN);

SELECT  STORES.inventory, CD_DVD.disk_ID
FROM    STORES, STORE, ITEM, CD_DVD
WHERE   STORES.store_ID = STORE.store_ID
AND     STORES.barcode = ITEM.barcode
AND     ITEM.barcode = CD_DVD.barcode
AND     STORE.store_name = 'Buckeye';

SELECT  fname, lname, MAX(quantity_sum)
FROM (
    SELECT  AA.first_name AS fname, AA.last_name AS lname, SUM(CI.quantity) AS quantity_sum
    FROM    AUTHOR_ARTIST AS AA, COMPOSED_BY AS CB, CD_DVD AS CD, ITEM AS IT, CONTAINED_IN AS CI
    WHERE   AA.a_ID = CB.a_ID
    AND     CB.disk_ID = CD.disk_ID
    AND     CD.barcode = IT.barcode
    AND     IT.barcode = CI.barcode
    GROUP BY AA.a_ID);

SELECT  C.last_name,C.first_name, sum(quantity*price)
FROM    TRANSACTIONS AS T, CUSTOMER AS C, CONTAINED_IN AS CI, ITEM AS I
WHERE   T.transaction_ID = CI.transaction_ID
AND     C.customer_ID = T.customer_ID
AND     CI.barcode = I.barcode
GROUP BY C.customer_ID;

SELECT 	C.first_name, C.last_name, C.email
FROM    TRANSACTIONS AS T, CUSTOMER AS C, ITEM AS I, CONTAINED_IN AS CI
WHERE   T.transaction_ID = CI.transaction_ID
AND     CI.barcode = I.barcode
AND     T.customer_ID = C.customer_ID
GROUP BY T.customer_ID
HAVING  quantity*price > AVG(quantity*price);

SELECT sum(quantity), IT.item_name
FROM    CONTAINED_IN AS CI, ITEM AS IT
WHERE  IT.barcode = CI.barcode
GROUP BY IT.item_name
ORDER BY CI.quantity DESC;

SELECT  a_ID, fname, lname, max(quantity_sum)
FROM    (
    SELECT  A.a_ID AS a_ID, sum(CI.quantity) AS quantity_sum, A.first_name AS fname, A.last_name AS lname
    FROM    AUTHOR_ARTIST AS A, TRANSACTIONS AS T, CONTAINED_IN AS CI, ITEM AS I, BOOK AS B, WRITTEN_BY AS WB
    WHERE   T.transaction_ID=CI.transaction_ID
    AND     CI.barcode=I.barcode
    AND     A.a_ID=WB.a_ID
    AND    WB.ISBN=B.ISBN
    AND    B.barcode=I.barcode
    AND    CI.barcode=I.barcode
    GROUP BY A.a_ID);

SELECT  fname, lname
FROM (
    SELECT  a_ID, max(price_sum) AS price_max, fname, lname
    FROM (
        SELECT  A.a_ID AS a_ID, sum(CI.quantity*I.price) AS price_sum, A.first_name AS fname, A.last_name AS lname
        FROM    AUTHOR_ARTIST AS A, TRANSACTIONS AS T, CONTAINED_IN AS CI, ITEM AS I, BOOK AS B, WRITTEN_BY AS WB
        WHERE   T.transaction_ID=CI.transaction_ID
        AND     CI.barcode=I.barcode
        AND     A.a_ID=WB.a_ID
        AND     WB.ISBN=B.ISBN
        AND     B.barcode=I.barcode
        AND     CI.barcode=I.barcode
        GROUP BY A.a_ID));

SELECT  c_ID,fname, lname, email
FROM (
    SELECT  a_ID, max(price_sum) AS price_max, c_ID, fname, lname, email
    FROM (
        SELECT  A.a_ID AS a_ID, sum(CI.quantity*I.price) AS price_sum, CU.customer_ID as c_ID, A.first_name as fname, A.last_name AS lname, CU.email AS email
        FROM    AUTHOR_ARTIST AS A, TRANSACTIONS AS T, CONTAINED_IN AS CI, ITEM AS I, BOOK AS B, WRITTEN_BY AS WB, CUSTOMER AS CU
        WHERE   T.transaction_ID=CI.transaction_ID
        AND     CI.barcode=I.barcode
        AND     A.a_ID=WB.a_ID
        AND     WB.ISBN=B.ISBN
        AND     B.barcode=I.barcode
        AND     CI.barcode=I.barcode
        AND     CU.customer_ID = T.customer_ID
        GROUP BY A.a_ID));

SELECT  AA.first_name, AA.last_name
FROM    ITEM AS I, CONTAINED_IN AS CI, TRANSACTIONS AS T, BOOK AS B, WRITTEN_BY AS WB, AUTHOR_ARTIST AS AA
WHERE   I.barcode = CI.barcode
AND     B.barcode = I.barcode
AND     WB.ISBN = B.ISBN
AND     AA.a_ID = WB.a_ID
AND     CI.transaction_ID = T.transaction_ID
GROUP BY T.customer_ID
HAVING  sum(I.price * CI.quantity) > (
    SELECT  AVG(I.price * CI.quantity) AS avg_spend
    FROM    ITEM AS I, CONTAINED_IN AS CI, TRANSACTIONS AS T
    WHERE   I.barcode = CI.barcode
    AND     CI.transaction_ID = T.transaction_ID)
