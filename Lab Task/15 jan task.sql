DECLARE
	vEMPNO	EMP.EMPNO%TYPE;
	vENAME	EMP.ENAME%TYPE;
	vSAL	EMP.SAL%TYPE;
	vDEPTNO	EMP.DEPTNO%TYPE;
	CURSOR	cEMP IS SELECT EMPNO,ENAME,SAL,DEPTNO FROM EMP;
BEGIN
	OPEN cEMP;
	LOOP
	FETCH cEMP INTO vEMPNO,vENAME,vSAL,vDEPTNO;
	EXIT WHEN cEMP%NOTFOUND;
	
	DBMS_OUTPUT.PUT_LINE('EMPLOYEE NO	:-'||vEMPNO);
	DBMS_OUTPUT.PUT_LINE('NAME		:-'||vENAME);
	DBMS_OUTPUT.PUT_LINE('SAL		:-'||vSAL);
	DBMS_OUTPUT.PUT_LINE('DEPARTMENT	:-'||vDEPTNO);

	END LOOP;
END;


Q.2	WRITE A PL/SQL BLOCK DISPLAY EMPLOYEE NAME,JOB,SAL OF ALL EMPLOYEES 	GIVE TITLE TO THE REPORT AS A EMPLOYEE REPORT ALSO SHOW DETAIL 	DEPARTMENT WISE.

DECLARE
    CURSOR emp_cur IS
        SELECT deptno, ename, job, sal
        FROM emp
        ORDER BY deptno, ename;

    v_prev_dept emp.deptno%TYPE := NULL;
BEGIN
    DBMS_OUTPUT.PUT_LINE('==============================');
    DBMS_OUTPUT.PUT_LINE('        EMPLOYEE REPORT       ');
    DBMS_OUTPUT.PUT_LINE('==============================');

    FOR rec IN emp_cur LOOP

        -- Print department header when department changes
        IF v_prev_dept IS NULL OR v_prev_dept <> rec.deptno THEN
            DBMS_OUTPUT.PUT_LINE(' ');
            DBMS_OUTPUT.PUT_LINE('Department No: ' || rec.deptno);
            DBMS_OUTPUT.PUT_LINE('-----------------------------------------');
            DBMS_OUTPUT.PUT_LINE(
                RPAD('NAME', 15) ||
                RPAD('JOB', 15) ||
                'SALARY'
            );
            DBMS_OUTPUT.PUT_LINE('-----------------------------------------');
            v_prev_dept := rec.deptno;
        END IF;

        -- Print employee details
        DBMS_OUTPUT.PUT_LINE(
            RPAD(rec.ename, 15) ||
            RPAD(rec.job, 15) ||
            rec.sal
        );

    END LOOP;
END;