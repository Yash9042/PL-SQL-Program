DECLARE
    -- Step 1: Declare an explicit cursor
    CURSOR dept_in_sal_cursor IS
        SELECT *
        FROM emp
        WHERE INSTR(TO_CHAR(sal), TO_CHAR(deptno)) > 0;

    -- Step 2: Record variable to hold each row
    dept_in_sal_record dept_in_sal_cursor%ROWTYPE;
BEGIN
    -- Step 3: Open the cursor
    OPEN dept_in_sal_cursor;

    -- Step 4: Loop through each row
    LOOP
        FETCH dept_in_sal_cursor INTO dept_in_sal_record;
        EXIT WHEN dept_in_sal_cursor%NOTFOUND;

        -- Step 5: Display employee details
        DBMS_OUTPUT.PUT_LINE('EmpNo: ' || dept_in_sal_record.empno ||
                             ', Name: ' || dept_in_sal_record.ename ||
                             ', Job: ' || dept_in_sal_record.job ||
                             ', DeptNo: ' || dept_in_sal_record.deptno ||
                             ', Salary: ' || dept_in_sal_record.sal);
    END LOOP;

    -- Step 6: Close the cursor
    CLOSE dept_in_sal_cursor;
END;
/
