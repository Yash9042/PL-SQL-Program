DECLARE
   -- Cursor for employees joined in January
   CURSOR jan_emp_cur IS
      SELECT empno, ename, hiredate, sal
      FROM emp
      WHERE TO_CHAR(hiredate,'MM') = '01';  -- safer than 'mon'

   -- Variables to store cursor data
   v_empno emp.empno%TYPE;
   v_ename emp.ename%TYPE;
   v_hire  emp.hiredate%TYPE;
   v_sal   emp.sal%TYPE;
BEGIN
   -- Open the cursor
   OPEN jan_emp_cur;

   -- Loop through each row
   LOOP
      FETCH jan_emp_cur INTO v_empno, v_ename, v_hire, v_sal;
      EXIT WHEN jan_emp_cur%NOTFOUND;

      -- Display employee details
      DBMS_OUTPUT.PUT_LINE('EmpNo: ' || v_empno ||
                           ', Name: ' || v_ename ||
                           ', HireDate: ' || TO_CHAR(v_hire,'DD-MON-YYYY') ||
                           ', Salary: ' || v_sal);
   END LOOP;

   -- Close the cursor
   CLOSE jan_emp_cur;
END;
/
