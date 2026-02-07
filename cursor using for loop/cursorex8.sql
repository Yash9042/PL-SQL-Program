--cursor using for loop exercise 8--
DECLARE
  CURSOR cEMP(v_low  NUMBER,
              v_high NUMBER) IS
    SELECT *
    FROM EMP
    WHERE 12 * SAL BETWEEN v_low AND v_high;

BEGIN
  FOR i IN cEMP(&v_low, &v_high)
  LOOP
    DBMS_OUTPUT.PUT_LINE(
      i.empno || '   ' ||
      i.ename || '   ' ||
      i.job   || '   ' ||
      i.sal
    );
  END LOOP;
END;
/
