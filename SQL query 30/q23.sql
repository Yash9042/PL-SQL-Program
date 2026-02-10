DECLARE
    -- Step 1: Declare an explicit cursor
    CURSOR highpaid_cursor IS
        SELECT *
        FROM emp
        WHERE sal IN (SELECT MAX(sal) FROM emp);

    -- Step 2: Record variable to hold each row
    highpaid_record highpaid_cursor%ROWTYPE;
BEGIN
    -- Step 3: Open the cursor
    OPEN highpaid_cursor;

    -- Step 4: Loop through each row
    LOOP
        FETCH highpaid_cursor INTO highpaid_record;
        EXIT WHEN highpaid_cursor%NOTFOUND;

        -- Step 5: Display employee details
        DBMS_OUTPUT.PUT_LINE('EmpNo: ' || highpaid_record.empno ||
                             ', Name: ' || highpaid_record.ename ||
                             ', Job: ' || highpaid_record.job ||
                             ', Manager: ' || highpaid_record.mgr ||
                             ', HireDate: ' || TO_CHAR(highpaid_record.hiredate, 'DD-MON-YYYY') ||
                             ', Salary: ' || highpaid_record.sal ||
                             ', Commission: ' || NVL(TO_CHAR(highpaid_record.comm), 'N/A') ||
                             ', DeptNo: ' || highpaid_record.deptno);
    END LOOP;

    -- Step 6: Close the cursor
    CLOSE highpaid_cursor;
END;
/
