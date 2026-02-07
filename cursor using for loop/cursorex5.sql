-- cursor exercise 5--
DECLARE
  CURSOR cEMP(v_name EMP.ENAME%TYPE) IS
    SELECT *
    FROM EMP
    WHERE ENAME = UPPER(v_name);

BEGIN
  FOR i IN cEMP('&v_name')
  LOOP
    DBMS_OUTPUT.PUT_LINE(
      i.empno || '   ' ||
      i.ename || '   ' ||
      i.job   || '   ' ||
      i.deptno|| '   ' ||
      i.sal
    );
  END LOOP;
END;
/
