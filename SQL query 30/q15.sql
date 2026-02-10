SET SERVEROUTPUT ON;

BEGIN
    FOR emp_rec IN (
        SELECT *
        FROM emp
        WHERE deptno = 10 OR deptno = 20
    ) LOOP
        DBMS_OUTPUT.PUT_LINE(
            emp_rec.empno || '  ' ||
            emp_rec.ename || '  ' ||
            emp_rec.job || '  ' ||
            emp_rec.mgr || '  ' ||
            TO_CHAR(emp_rec.hiredate,'DD-MON-YYYY') || '  ' ||
            emp_rec.sal || '  ' ||
            emp_rec.comm || '  ' ||
            emp_rec.deptno
        );
    END LOOP;
END;
/
