DECLARE
    vpno   PRODUCT.pno%TYPE;
    vname  PRODUCT.name%TYPE;
    vprice PRODUCT.price%TYPE;
    vqh    PRODUCT.qh%TYPE;
BEGIN
    SELECT pno, name, price, qh
    INTO vpno, vname, vprice, vqh
    FROM product
    WHERE pno = &PNO;

    DBMS_OUTPUT.PUT_LINE('PRODUCT NO   : ' || vpno);
    DBMS_OUTPUT.PUT_LINE('PRODUCT NAME : ' || vname);
    DBMS_OUTPUT.PUT_LINE('PRODUCT PRICE: ' || vprice);
    DBMS_OUTPUT.PUT_LINE('PRODUCT HAND : ' || vqh);
END;
/	


// product table 
CREATE TABLE PRODUCT (
    PNO   NUMBER PRIMARY KEY,
    NAME  VARCHAR2(30),
    PRICE NUMBER,
    QH    NUMBER
);


INSERT INTO PRODUCT VALUES (1, 'PEN', 10, 100);
INSERT INTO PRODUCT VALUES (2, 'BOOK', 50, 200);
INSERT INTO PRODUCT VALUES (3, 'BAG', 500, 50);


