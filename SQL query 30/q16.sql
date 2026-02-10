SET SERVEROUTPUT ON;

BEGIN
    FOR emp_rec IN (
        SELECT *,
               12*sal AS annual_sal
        FROM emp
        WHERE 12*sal BETWEEN 22000 AND 45000
    ) LOOP
        DBMS_OUTPUT.PUT_LINE(
            emp_rec.empno || '  ' ||
            emp_rec.ename || '  ' ||
            emp_rec.job || '  ' ||
            emp_rec.sal || '  ' ||
            ROUND(emp_rec.annual_sal,2) || '  ' ||
            emp_rec.deptno
        );
    END LOOP;
END;
/
