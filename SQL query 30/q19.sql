DECLARE
    -- Step 1: Declare an explicit cursor
    CURSOR clerk_cursor IS
        SELECT *
        FROM emp
        WHERE job = 'CLERK' AND deptno = 20;

    -- Step 2: Declare a record variable to hold each row
    clerk_record clerk_cursor%ROWTYPE;
BEGIN
    -- Step 3: Open the cursor
    OPEN clerk_cursor;

    -- Step 4: Loop through each row
    LOOP
        FETCH clerk_cursor INTO clerk_record;
        EXIT WHEN clerk_cursor%NOTFOUND;

        -- Step 5: Display employee details
        DBMS_OUTPUT.PUT_LINE('EmpNo: ' || clerk_record.empno ||
                             ', Name: ' || clerk_record.ename ||
                             ', Job: ' || clerk_record.job ||
                             ', DeptNo: ' || clerk_record.deptno ||
                             ', HireDate: ' || TO_CHAR(clerk_record.hiredate, 'DD-MON-YYYY'));
    END LOOP;

    -- Step 6: Close the cursor
    CLOSE clerk_cursor;
END;
/
