--cursor using for loop exercise 7--
DECLARE
  CURSOR cEMP(v_job1 EMP.JOB%TYPE,
              v_job2 EMP.JOB%TYPE) IS
    SELECT *
    FROM EMP
    WHERE JOB = UPPER(v_job1)
       OR JOB = UPPER(v_job2)
    ORDER BY JOB DESC;

BEGIN
  FOR i IN cEMP('&v_job1', '&v_job2')
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
