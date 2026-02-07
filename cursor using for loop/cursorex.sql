-- for loop using exercise 1--
DECLARE
  CURSOR cEMP(vjob EMP.JOB%TYPE) IS
    SELECT * FROM EMP
    WHERE JOB = UPPER(vjob);

BEGIN
  FOR i IN cEMP('&vjob')
  LOOP
    DBMS_OUTPUT.PUT_LINE(
      i.ename || '      ' ||
      i.sal   || '        ' ||
      i.job
    );
  END LOOP;
END;
/
 