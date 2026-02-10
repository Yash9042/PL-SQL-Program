SET SERVEROUTPUT ON;

BEGIN
    FOR emp_rec IN (
        SELECT empno,
               ename,
               sal,
               MONTHS_BETWEEN(SYSDATE, hiredate) AS exp
        FROM emp
        WHERE mgr = 7369
    ) LOOP
        DBMS_OUTPUT.PUT_LINE(
            emp_rec.empno || '  ' ||
            emp_rec.ename || '  ' ||
            emp_rec.sal || '  ' ||
            ROUND(emp_rec.exp,2)
        );
    END LOOP;
END;
/
