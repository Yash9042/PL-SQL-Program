DECLARE
    -- Step 1: Declare an explicit cursor
    CURSOR sal_cursor IS
        SELECT MAX(sal) AS max_sal
        FROM emp;

    -- Step 2: Record variable to hold the cursor result
    sal_record sal_cursor%ROWTYPE;
BEGIN
    -- Step 3: Open the cursor
    OPEN sal_cursor;

    -- Step 4: Fetch the result into the record
    FETCH sal_cursor INTO sal_record;

    -- Step 5: Display the highest salary
    DBMS_OUTPUT.PUT_LINE('Highest Salary in EMP table: ' || sal_record.max_sal);

    -- Step 6: Close the cursor
    CLOSE sal_cursor;
END;
/
