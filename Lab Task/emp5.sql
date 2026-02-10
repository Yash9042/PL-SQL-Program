-- write a PL/SQL block to display department name, No.of employee and total amount of all departments.-- 
SET SERVEROUTPUT ON SIZE 1000000;

DECLARE
    v_dept_no dept.deptno%TYPE := &dept_no;
    v_found   BOOLEAN := FALSE;
BEGIN
    FOR rec IN (
        SELECT 
            d.dname AS department_name,
            COUNT(e.emp_id) AS no_of_employees,
            NVL(SUM(e.salary), 0) AS total_amount
        FROM dept d
        LEFT JOIN employee e
            ON d.deptno = e.deptno
        WHERE d.deptno = v_dept_no
        GROUP BY d.dname
    )
    LOOP
        v_found := TRUE;
        DBMS_OUTPUT.PUT_LINE(
            'Department Name: ' || rec.department_name ||
            ' | No. of Employees: ' || rec.no_of_employees ||
            ' | Total Salary: ' || rec.total_amount
        );
    END LOOP;

    IF NOT v_found THEN
        DBMS_OUTPUT.PUT_LINE('No department found with deptno = ' || v_dept_no);
    END IF;
END;
/
