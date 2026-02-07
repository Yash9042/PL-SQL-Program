-- cursor using for loop exercise 2--
DECLARE
  CURSOR cEMP(v_dept EMP.DEPTNO%TYPE) IS
    SELECT *
    FROM EMP
    WHERE DEPTNO = v_dept
    ORDER BY DEPTNO ASC, JOB DESC;

BEGIN
  FOR i IN cEMP(&v_dept)
  LOOP
    DBMS_OUTPUT.PUT_LINE(
      i.empno  || '   ' ||
      i.ename  || '   ' ||
      i.job    || '   ' ||
      i.deptno || '   ' ||
      i.sal
    );
  END LOOP;
END;
/
