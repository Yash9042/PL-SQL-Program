DECLARE
    -- Step 1: Declare a cursor to find maximum average salary per job
    CURSOR max_avg_sal_cursor IS
        SELECT MAX(avg_sal) AS max_avg_sal
        FROM (
            SELECT AVG(sal) AS avg_sal
            FROM emp
            WHERE job != 'PRESIDENT'
            GROUP BY job
        );

    -- Step 2: Record variable to hold the result
    max_avg_sal_record max_avg_sal_cursor%ROWTYPE;
BEGIN
    -- Step 3: Open the cursor
    OPEN max_avg_sal_cursor;

    -- Step 4: Fetch the result
    FETCH max_avg_sal_cursor INTO max_avg_sal_record;

    -- Step 5: Display maximum average salary
    DBMS_OUTPUT.PUT_LINE('Maximum Average Salary (excluding PRESIDENT): ' || max_avg_sal_record.max_avg_sal);

    -- Step 6: Close the cursor
    CLOSE max_avg_sal_cursor;
END;
/
