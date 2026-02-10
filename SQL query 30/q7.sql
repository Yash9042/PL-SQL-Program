BEGIN
    FOR emp_rec IN (
        SELECT * 
        FROM emp 
        WHERE hiredate < TO_DATE('01-JAN-1981','DD-MON-YYYY')
    ) LOOP
        DBMS_OUTPUT.PUT_LINE(
            emp_rec.empno || '  ' ||
            emp_rec.ename || '  ' ||
            emp_rec.job   || '  ' ||
            emp_rec.hiredate || '  ' ||
            emp_rec.sal   || '  ' ||
            emp_rec.deptno
        );
    END LOOP;
END;
/
