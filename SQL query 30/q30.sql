DECLARE
    -- Step 1: Declare an explicit cursor
    CURSOR emp_cursor IS
        SELECT empno, sal, comm
        FROM emp;

    -- Step 2: Record variable to hold each row
    emp_record emp_cursor%ROWTYPE;
BEGIN
    -- Step 3: Open the cursor
    OPEN emp_cursor;

    -- Step 4: Loop through each row
    LOOP
        FETCH emp_cursor INTO emp_record;
        EXIT WHEN emp_cursor%NOTFOUND;

        -- Step 5: Display employee details
        DBMS_OUTPUT.PUT_LINE('EmpNo: ' || emp_record.empno ||
                             ', Salary: ' || emp_record.sal ||
                             ', Commission: ' || NVL(TO_CHAR(emp_record.comm), 'N/A'));
    END LOOP;

    -- Step 6: Close the cursor
    CLOSE emp_cursor;
END;
/
