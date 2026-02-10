DECLARE
    -- Step 1: Declare an explicit cursor
    CURSOR loc_cursor IS
        SELECT d.loc
        FROM emp e, dept d
        WHERE e.ename = 'SMITH' AND e.deptno = d.deptno;

    -- Step 2: Record variable to hold cursor row
    loc_record loc_cursor%ROWTYPE;
BEGIN
    -- Step 3: Open the cursor
    OPEN loc_cursor;

    -- Step 4: Loop through each row
    LOOP
        FETCH loc_cursor INTO loc_record;
        EXIT WHEN loc_cursor%NOTFOUND;

        -- Step 5: Display the location
        DBMS_OUTPUT.PUT_LINE('Location of SMITH: ' || loc_record.loc);
    END LOOP;

    -- Step 6: Close the cursor
    CLOSE loc_cursor;
END;
/
