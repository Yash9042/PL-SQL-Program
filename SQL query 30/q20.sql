DECLARE
    -- Step 1: Declare an explicit cursor
    CURSOR smith_cursor IS
        SELECT *
        FROM emp
        WHERE ename = 'SMITH';

    -- Step 2: Declare a record variable to hold each row
    smith_record smith_cursor%ROWTYPE;
BEGIN
    -- Step 3: Open the cursor
    OPEN smith_cursor;

    -- Step 4: Loop through each row
    LOOP
        FETCH smith_cursor INTO smith_record;
        EXIT WHEN smith_cursor%NOTFOUND;

        -- Step 5: Display employee details
        DBMS_OUTPUT.PUT_LINE('EmpNo: ' || smith_record.empno ||
                             ', Name: ' || smith_record.ename ||
                             ', Job: ' || smith_record.job ||
                             ', Manager: ' || smith_record.mgr ||
                             ', HireDate: ' || TO_CHAR(smith_record.hiredate, 'DD-MON-YYYY') ||
                             ', Salary: ' || smith_record.sal ||
                             ', Commission: ' || NVL(TO_CHAR(smith_record.comm), 'N/A') ||
                             ', DeptNo: ' || smith_record.deptno);
    END LOOP;

    -- Step 6: Close the cursor
    CLOSE smith_cursor;
END;
/
