DECLARE
    -- Step 1: Declare an explicit cursor
    CURSOR emp_cursor IS
        SELECT *
        FROM emp
        WHERE TO_CHAR(hiredate, 'YYYY') LIKE '198%';  -- filter for 1980s

    -- Step 2: Declare a record variable to hold each row
    emp_record emp_cursor%ROWTYPE;
BEGIN
    -- Step 3: Open the cursor
    OPEN emp_cursor;

    -- Step 4: Loop through each row
    LOOP
        FETCH emp_cursor INTO emp_record;
        EXIT WHEN emp_cursor%NOTFOUND;

        -- Step 5: Display the employee details (example: empno, ename, hiredate)
        DBMS_OUTPUT.PUT_LINE('EmpNo: ' || emp_record.empno || 
                             ', Name: ' || emp_record.ename || 
                             ', Hire Date: ' || TO_CHAR(emp_record.hiredate, 'DD-MON-YYYY'));
    END LOOP;

    -- Step 6: Close the cursor
    CLOSE emp_cursor;
END;
/
