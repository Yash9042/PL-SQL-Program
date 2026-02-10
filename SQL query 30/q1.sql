SET SERVEROUTPUT ON;

DECLARE
    emp_rec emp%ROWTYPE;
BEGIN
    FOR emp_rec IN (SELECT * FROM emp ORDER BY deptno ASC, job DESC) LOOP
        DBMS_OUTPUT.PUT_LINE(
            emp_rec.empno || '  ' ||
            emp_rec.ename || '  ' ||
            emp_rec.job   || '  ' ||
            emp_rec.sal   || '  ' ||
            emp_rec.deptno
        );
    END LOOP;
END;
/
