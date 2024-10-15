DECLARE
   v_rollno   N_RollCall.RollNo%TYPE;
   v_name     N_RollCall.Name%TYPE;
   v_att      N_RollCall.Attendance%TYPE;

   CURSOR cursor_new IS SELECT RollNo, Name, Attendance FROM N_RollCall;

BEGIN
   OPEN cursor_new;
   LOOP
      FETCH cursor_new INTO v_rollno, v_name, v_att;
      EXIT WHEN cursor_new%NOTFOUND;

      BEGIN
         SELECT RollNo FROM O_RollCall WHERE RollNo = v_rollno;
         DBMS_OUTPUT.PUT_LINE('Record for RollNo ' || v_rollno || ' already exists.');

      EXCEPTION
         WHEN NO_DATA_FOUND THEN
            INSERT INTO O_RollCall VALUES (v_rollno, v_name, v_att);
            DBMS_OUTPUT.PUT_LINE('Inserted RollNo ' || v_rollno || ' into O_RollCall.');
      END;
   END LOOP;

   CLOSE cursor_new;
END;
