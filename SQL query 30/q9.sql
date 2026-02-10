

BEGIN
    FOR emp_rec IN (
        SELECT empno,
               ename,
               job,
               hiredate,
               months_between(sysdate, hiredate) AS exp
        FROM emp
        WHERE empno IN (SELECT mgr FROM emp)
    ) LOOP
        DBMS_OUTPUT.PUT_LINE(
            emp_rec.empno || '  ' ||
            emp_rec.ename || '  ' ||
            emp_rec.job || '  ' ||
            TO_CHAR(emp_rec.hiredate, 'DD-MON-YYYY') || '  ' ||
            ROUND(emp_rec.exp,2)
        );
    END LOOP;
END;
/
