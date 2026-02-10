DECLARE
    -- Step 1: Declare an explicit cursor
    CURSOR no_emp_dept_cursor IS
        SELECT d.deptno, d.dname
        FROM dept d
        LEFT JOIN emp e ON d.deptno = e.deptno
        WHERE e.deptno IS NULL;

    -- Step 2: Record variable to hold each row
    no_emp_dept_record no_emp_dept_cursor%ROWTYPE;
BEGIN
    -- Step 3: Open the cursor
    OPEN no_emp_dept_cursor;

    -- Step 4: Loop through each row
    LOOP
        FETCH no_emp_dept_cursor INTO no_emp_dept_record;
        EXIT WHEN no_emp_dept_cursor%NOTFOUND;

        -- Step 5: Display department details
        DBMS_OUTPUT.PUT_LINE('DeptNo: ' || no_emp_dept_record.deptno ||
                             ', DeptName: ' || no_emp_dept_record.dname);
    END LOOP;

    -- Step 6: Close the cursor
    CLOSE no_emp_dept_cursor;
END;
/
