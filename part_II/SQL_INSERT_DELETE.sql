INSERT INTO BOOK (barcode, book_category, ISBN)
VALUES ('602978009201', 'Reference', '743222001');

INSERT INTO WRITTEN_BY (ISBN, a_ID)
VALUES ('743222001', 'A23542521');

INSERT INTO STORES (store_ID, barcode, inventory, sold)
VALUES ('6611445639', '602978009201', '14', 1);

INSERT INTO ITEM (barcode, item_name, aisle, bin, price, publisher_name)
VALUES ('602978009201', 'special', 11, 11, 51.11, 'Sybex');

INSERT INTO AUTHOR_ARTIST (a_ID, first_name, last_name)
VALUES ('A23542521', 'Jackson', 'Wilshereman');

INSERT INTO BOOK (barcode, book_category, ISBN)
VALUES ('602978009201', 'Reference', '743222001');

INSERT INTO WRITTEN_BY (ISBN, a_ID)
VALUES ('743222001', 'A23542521');

INSERT INTO STORES (store_ID, barcode, inventory, sold)
VALUES ('6611445639', '602978009201', '14', 1);

INSERT INTO ITEM (barcode, item_name, aisle, bin, price, publisher_name)
VALUES ('602978009201', 'special', 11, 11, 51.11, 'Sybex');

INSERT INTO AUTHOR_ARTIST (a_ID, first_name, last_name)
VALUES ('A23542521', 'Jackson', 'Wilshereman');

INSERT INTO PUBLISHER (publisher_name)
VALUES ('strange');	

INSERT INTO CUSTOMER (customer_ID, first_name, last_name, email)
VALUES ('7938024831', 'An', 'Allen', 'allen@gmail.com');

--

DELETE FROM BOOK
WHERE barcode = '602978009201'
AND book_category = 'Reference'
AND ISBN = '743222001';

DELETE FROM WRITTEN_BY
WHERE ISBN = '743222001'
AND a_ID = 'A23542521';

DELETE FROM STORES
WHERE store_ID = '6611445639'
AND inventory = '14'
AND sold = 1;

DELETE FROM ITEM
WHERE barcode = '602978009201'
AND item_name = 'special'
AND aisle = 11
AND bin = 11
AND price = 51.11
AND publisher_name = 'Sybex';

DELETE FROM AUTHOR_ARTIST
WHERE a_ID = 'A23542521'
AND first_name = 'Jackson'
AND last_name = 'Wilshereman';

DELETE FROM BOOK
WHERE barcode = '602978009201'
AND book_category = 'Reference'
AND ISBN = '743222001';

DELETE FROM WRITTEN_BY
WHERE ISBN = '743222001'
AND a_ID = 'A23542521';

DELETE FROM STORES
WHERE store_ID = '6611445639'
AND barcode = '602978009201'
AND inventory = 14
AND sold = 1;

DELETE FROM ITEM
WHERE barcode = '602978009201'
AND item_name = 'special'
AND aisle = 11
AND bin = 11
AND price = 51.11
AND publisher_name = 'Sybex';

DELETE FROM AUTHOR_ARTIST
WHERE a_ID = 'A23542521'
AND first_name = 'Jackson'
AND last_name = 'Wilshereman';

DELETE FROM PUBLISHER
WHERE publisher_name = 'strange';

DELETE FROM CUSTOMER
WHERE customer_ID = '7938024831'
AND first_name = 'An'
AND last_name = 'Allen'
AND email = 'allen@gmail.com';
