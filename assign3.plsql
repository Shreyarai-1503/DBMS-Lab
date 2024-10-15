DECLARE
   v_roll_no   Stud.Roll%TYPE;
   v_att       Stud.Att%TYPE;
   v_status    Stud.Status%TYPE;

BEGIN
   v_roll_no := &roll_no;

   SELECT Att, Status INTO v_att, v_status FROM Stud WHERE Roll = v_roll_no;

   IF v_att < 75 THEN
      UPDATE Stud SET Status = 'D' WHERE Roll = v_roll_no;
      DBMS_OUTPUT.PUT_LINE('Term not granted');
   ELSE
      UPDATE Stud SET Status = 'ND' WHERE Roll = v_roll_no;
      DBMS_OUTPUT.PUT_LINE('Term granted');
   END IF;

EXCEPTION
   WHEN NO_DATA_FOUND THEN
      DBMS_OUTPUT.PUT_LINE('Error: No student found with the entered roll number.');
   WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('An unexpected error occurred.');
END;
