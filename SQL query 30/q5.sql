
BEGIN
    FOR job_rec IN (SELECT DISTINCT job FROM emp ORDER BY job DESC) LOOP
        DBMS_OUTPUT.PUT_LINE(job_rec.job);
    END LOOP;
END;
/

