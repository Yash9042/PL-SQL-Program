--cursor using for loop exercise 4--
DECLARE
  CURSOR cEMP(v_dept1 EMP.DEPTNO%TYPE,
              v_dept2 EMP.DEPTNO%TYPE) IS
    SELECT *
    FROM EMP
    WHERE DEPTNO = v_dept1
       OR DEPTNO = v_dept2;

BEGIN
  FOR i IN cEMP(&v_dept1, &v_dept2)
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
