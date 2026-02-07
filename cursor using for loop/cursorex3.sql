--cursor using for loop exercise 3--
DECLARE
  CURSOR cEMP(v_date DATE) IS
    SELECT *
    FROM EMP
    WHERE hiredate < v_date;

BEGIN
  FOR i IN cEMP(TO_DATE('&v_date','DD-MON-YY'))
  LOOP
    DBMS_OUTPUT.PUT_LINE(
      i.empno   || '   ' ||
      i.ename   || '   ' ||
      i.job     || '   ' ||
      i.hiredate|| '   ' ||
      i.sal
    );
  END LOOP;
END;
/
