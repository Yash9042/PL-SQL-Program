-- cursor using for loop exercise 9--
DECLARE
  CURSOR cEMP(v_dept EMP.DEPTNO%TYPE) IS
    SELECT MAX(SAL) AS max_sal
    FROM EMP
    WHERE DEPTNO = v_dept;

BEGIN
  FOR i IN cEMP(&v_dept)
  LOOP
    DBMS_OUTPUT.PUT_LINE('Maximum Salary: ' || i.max_sal);
  END LOOP;
END;
/
