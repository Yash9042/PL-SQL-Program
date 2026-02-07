--cursor using for loop exercise 10--
DECLARE
  CURSOR cEMP(v_count NUMBER) IS
    SELECT DEPTNO, COUNT(*) AS emp_count
    FROM EMP
    GROUP BY DEPTNO
    HAVING COUNT(*) = v_count;

BEGIN
  FOR i IN cEMP(&v_count)
  LOOP
    DBMS_OUTPUT.PUT_LINE(
      'DeptNo: ' || i.deptno || '   Employee Count: ' || i.emp_count
    );
  END LOOP;
END;
/
