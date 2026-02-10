BEGIN
    FOR emp_rec IN (
        SELECT * 
        FROM emp 
        WHERE empno IN (SELECT mgr FROM emp)
    ) LOOP
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
