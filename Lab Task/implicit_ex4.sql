--SELECT INTO VARIABLE(implicit cursor)

DECLARE
	v_name student.NAME%TYPE;
BEGIN
	SELECT name INTO v_name FROM student WHERE rollno = 1;
	DBMS_OUTPUT.PUT_LINE('Name:  '|| v_name);
END;
/