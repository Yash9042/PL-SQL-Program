SET SERVEROUTPUT ON;

BEGIN
    FOR emp_rec IN (
        SELECT *,
               MONTHS_BETWEEN(SYSDATE, hiredate) AS exp,
               (sal/30) AS daily_sal
        FROM emp
        WHERE (sal/30) > 100
    ) LOOP
        DBMS_OUTPUT.PUT_LINE(
            emp_rec.empno || '  ' ||
            emp_rec.ename || '  ' ||
            emp_rec.job || '  ' ||
            emp_rec.sal || '  ' ||
            ROUND(emp_rec.daily_sal,2) || '  ' ||
            ROUND(emp_rec.exp,2)
        );
    END LOOP;
END;
/
