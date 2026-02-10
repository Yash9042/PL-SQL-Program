BEGIN
    FOR emp_rec IN (
        SELECT empno,
               ename,
               sal,
               sal/30 AS daily_sal,
               12*sal AS annusal
        FROM emp
        ORDER BY annusal ASC
    ) LOOP
        DBMS_OUTPUT.PUT_LINE(
            emp_rec.empno || '  ' ||
            emp_rec.ename || '  ' ||
            emp_rec.sal || '  ' ||
            emp_rec.daily_sal || '  ' ||
            emp_rec.annusal
        );
    END LOOP;
END;
/
