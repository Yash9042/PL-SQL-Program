DECLARE
    v_roll_no  NUMBER := &roll_no;
    v_name     VARCHAR2(50);
    v_class    VARCHAR2(20);
    v_amount   NUMBER(10,2);
    v_fee_date DATE;
BEGIN
    SELECT name, class
    INTO v_name, v_class
    FROM student
    WHERE roll_no = v_roll_no;

    SELECT amount, fee_date
    INTO v_amount, v_fee_date
    FROM fee
    WHERE roll_no = v_roll_no;

    DBMS_OUTPUT.PUT_LINE('------------------------------');
    DBMS_OUTPUT.PUT_LINE('        FEE RECEIPT           ');
    DBMS_OUTPUT.PUT_LINE('------------------------------');
    DBMS_OUTPUT.PUT_LINE('Roll No     : ' || v_roll_no);
    DBMS_OUTPUT.PUT_LINE('Student Name: ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Class       : ' || v_class);
    DBMS_OUTPUT.PUT_LINE('Amount Paid : ' || v_amount);
    DBMS_OUTPUT.PUT_LINE('Payment Date: ' || TO_CHAR(v_fee_date, 'DD-MON-YYYY'));
    DBMS_OUTPUT.PUT_LINE('------------------------------');

END;
/
