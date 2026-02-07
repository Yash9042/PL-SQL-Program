--cursor using for loop exercise 6--
DECLARE
  CURSOR cEMP(v_char EMP.ENAME%TYPE) IS
    SELECT *
    FROM EMP
    WHERE ENAME LIKE '%' || UPPER(v_char);

BEGIN
  FOR i IN cEMP('&v_char')
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
