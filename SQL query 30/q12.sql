SET SERVEROUTPUT ON;

DECLARE
    -- Explicit cursor declaration
    CURSOR emp_cur IS
        SELECT * 
        FROM emp
        WHERE hiredate > TO_DATE('30-JUN-1981','DD-MON-YYYY')
          AND TO_CHAR(hiredate,'YYYY') = '1981'
        ORDER BY job ASC;

    emp_rec emp_cur%ROWTYPE;  -- Record variable to hold one row

BEGIN
    OPEN emp_cur;  -- Open the cursor

    LOOP
        FETCH emp_cur INTO emp_rec;  -- Fetch one row
        EXIT WHEN emp_cur%NOTFOUND;  -- Exit loop when no more rows

        DBMS_OUTPUT.PUT_LINE(
            emp_rec.empno || '  ' ||
            emp_rec.ename || '  ' ||
            emp_rec.job || '  ' ||
            emp_rec.mgr || '  ' ||
            TO_CHAR(emp_rec.hiredate, 'DD-MON-YYYY') || '  ' ||
            emp_rec.sal || '  ' ||
            emp_rec.comm || '  ' ||
            emp_rec.deptno
        );
    END LOOP;

    CLOSE emp_cur;  -- Close the cursor
END;
/
