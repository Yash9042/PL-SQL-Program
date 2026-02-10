DECLARE
    v_name    VARCHAR2(50) := '&name';
    v_course  VARCHAR2(50) := '&course';

    v_marks1  NUMBER := &marks1;
    v_marks2  NUMBER := &marks2;
    v_marks3  NUMBER := &marks3;

    v_total   NUMBER;
    v_per     NUMBER;
BEGIN
    -- Calculate total and percentage (out of 300)
    v_total := v_marks1 + v_marks2 + v_marks3;
    v_per   := (v_total / 300) * 100;

    -- Display Marksheet
    DBMS_OUTPUT.PUT_LINE('--- Student Marksheet ---');
    DBMS_OUTPUT.PUT_LINE('Name        : ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Course      : ' || v_course);
    DBMS_OUTPUT.PUT_LINE('Sub1 Marks  : ' || v_marks1);
    DBMS_OUTPUT.PUT_LINE('Sub2 Marks  : ' || v_marks2);
    DBMS_OUTPUT.PUT_LINE('Sub3 Marks  : ' || v_marks3);
    DBMS_OUTPUT.PUT_LINE('Total Marks : ' || v_total);
    DBMS_OUTPUT.PUT_LINE('Percentage  : ' || v_per || '%');
END;
/
