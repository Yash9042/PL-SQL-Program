DECLARE
    vEMPNO     EMP.EMPNO%TYPE;
    vENAME     EMP.ENAME%TYPE;
    vJOB       EMP.JOB%TYPE;
    vMGR       EMP.MGR%TYPE;
    vHIREDATE  EMP.HIREDATE%TYPE;
    vSAL       EMP.SAL%TYPE;
    vCOMM      EMP.COMM%TYPE;
    vDEPTNO    DEPT.DEPTNO%TYPE;
    vDNAME     DEPT.DNAME%TYPE;
    vLOC       DEPT.LOC%TYPE;
    vGRADE     SALGRADE.GRADE%TYPE;

BEGIN
    SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE,
           E.SAL, E.COMM, E.DEPTNO, D.DNAME, D.LOC, S.GRADE
    INTO   vEMPNO, vENAME, vJOB, vMGR, vHIREDATE,
           vSAL, vCOMM, vDEPTNO, vDNAME, vLOC, vGRADE
    FROM   EMP E, DEPT D, SALGRADE S
    WHERE  E.DEPTNO = D.DEPTNO
    AND    E.SAL BETWEEN S.LOSAL AND S.HISAL
    AND    E.EMPNO = &NO;

    DBMS_OUTPUT.PUT_LINE('-------------------- EMPLOYEE SALARY SLIP --------------------');
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('Employee No     : ' || vEMPNO);
    DBMS_OUTPUT.PUT_LINE('Employee Name   : ' || vENAME);
    DBMS_OUTPUT.PUT_LINE('Job             : ' || vJOB);
    DBMS_OUTPUT.PUT_LINE('Manager ID      : ' || vMGR);
    DBMS_OUTPUT.PUT_LINE('Hire Date       : ' || vHIREDATE);
    DBMS_OUTPUT.PUT_LINE('Salary          : ' || vSAL);
    DBMS_OUTPUT.PUT_LINE('Commission      : ' || NVL(vCOMM, 0));
    DBMS_OUTPUT.PUT_LINE('Department No   : ' || vDEPTNO);
    DBMS_OUTPUT.PUT_LINE('Department Name : ' || vDNAME);
    DBMS_OUTPUT.PUT_LINE('Location        : ' || vLOC);
    DBMS_OUTPUT.PUT_LINE('Grade           : ' || vGRADE);
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------');

END;
/
