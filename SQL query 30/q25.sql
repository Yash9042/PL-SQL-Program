DECLARE
    -- Step 1: Declare an explicit cursor
    CURSOR no_mgr_cursor IS
        SELECT ename, job
        FROM emp
        WHERE mgr IS NULL;

    -- Step 2: Record variable to hold each row
    no_mgr_record no_mgr_cursor%ROWTYPE;
BEGIN
    -- Step 3: Open the cursor
    OPEN no_mgr_cursor;

    -- Step 4: Loop through each row
    LOOP
        FETCH no_mgr_cursor INTO no_mgr_record;
        EXIT WHEN no_mgr_cursor%NOTFOUND;

        -- Step 5: Display employee name and job
        DBMS_OUTPUT.PUT_LINE('Name: ' || no_mgr_record.ename ||
                             ', Job: ' || no_mgr_record.job);
    END LOOP;

    -- Step 6: Close the cursor
    CLOSE no_mgr_cursor;
END;
/
