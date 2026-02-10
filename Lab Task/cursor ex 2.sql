
DECLARE
    v_rno   NUMBER(5) := &v_rno; 
    v_name  VARCHAR2(50);
    v_course  VARCHAR2(50);
BEGIN
    SELECT sname, course_name
    INTO v_name, v_course
    FROM student
    WHERE rno = v_rno;

    DBMS_OUTPUT.PUT_LINE('Roll No   : ' || v_rno);
    DBMS_OUTPUT.PUT_LINE('Name      : ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Course    : ' || v_course);
   END;
/
