DECLARE
    v_studentno   NUMBER(5) := &rollno;
    v_name        VARCHAR2(10);
    v_course      VARCHAR2(10);
    v_sub1        NUMBER(5);
    v_sub2        NUMBER(5);
    v_sub3        NUMBER(5);

    v_total       NUMBER;
    v_percentage  NUMBER(5,2);
    v_result      VARCHAR2(10);
    v_grade       VARCHAR2(5);

BEGIN
    -- Fetch student data
    SELECT name, course, subject1, subject2, subject3
    INTO v_name, v_course, v_sub1, v_sub2, v_sub3
    FROM student
    WHERE studentno = v_studentno;

    -- Calculate total and percentage
    v_total := v_sub1 + v_sub2 + v_sub3;
    v_percentage := (v_total / 300) * 100;

    -- Result and Grade logic
    IF v_sub1 < 35 OR v_sub2 < 35 OR v_sub3 < 35 THEN
        v_result := 'FAIL';
        v_grade := 'F';
    ELSE
        v_result := 'PASS';

        IF v_percentage >= 75 THEN
            v_grade := 'A';
        ELSIF v_percentage >= 60 THEN
            v_grade := 'B';
        ELSIF v_percentage >= 50 THEN
            v_grade := 'C';
        ELSE
            v_grade := 'D';
        END IF;
    END IF;

    -- Print Marksheet
    DBMS_OUTPUT.PUT_LINE('----- STUDENT MARKSHEET -----');
    DBMS_OUTPUT.PUT_LINE('Roll No    : ' || v_studentno);
    DBMS_OUTPUT.PUT_LINE('Name       : ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Course     : ' || v_course);
    DBMS_OUTPUT.PUT_LINE('-----------------------------');
    DBMS_OUTPUT.PUT_LINE('Subject 1  : ' || v_sub1);
    DBMS_OUTPUT.PUT_LINE('Subject 2  : ' || v_sub2);
    DBMS_OUTPUT.PUT_LINE('Subject 3  : ' || v_sub3);
    DBMS_OUTPUT.PUT_LINE('-----------------------------');
    DBMS_OUTPUT.PUT_LINE('Total      : ' || v_total);
    DBMS_OUTPUT.PUT_LINE('Percentage : ' || v_percentage || '%');
    DBMS_OUTPUT.PUT_LINE('Result     : ' || v_result);
    DBMS_OUTPUT.PUT_LINE('Grade      : ' || v_grade);
    DBMS_OUTPUT.PUT_LINE('-----------------------------');

END;
/
