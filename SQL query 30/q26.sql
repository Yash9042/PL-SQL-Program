DECLARE
    -- Step 1: Declare an explicit cursor
    CURSOR a_name_cursor IS
        SELECT *
        FROM emp
        WHERE ename LIKE '%A%';

    -- Step 2: Record variable to hold each row
    a_name_record a_name_cursor%ROWTYPE;
BEGIN
    -- Step 3: Open the cursor
    OPEN a_name_cursor;

    -- Step 4: Loop through each row
    LOOP
        FETCH a_name_cursor INTO a_name_record;
        EXIT WHEN a_name_cursor%NOTFOUND;

        -- Step 5: Display employee details
        DBMS_OUTPUT.PUT_LINE('EmpNo: ' || a_name_record.empno ||
                             ', Name: ' || a_name_record.ename ||
                             ', Job: ' || a_name_record.job ||
                             ', DeptNo: ' || a_name_record.deptno ||
                             ', HireDate: ' || TO_CHAR(a_name_record.hiredate, 'DD-MON-YYYY') ||
                             ', Salary: ' || a_name_record.sal);
    END LOOP;

    -- Step 6: Close the cursor
    CLOSE a_name_cursor;
END;
/
