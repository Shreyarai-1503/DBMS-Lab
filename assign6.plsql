CREATE OR REPLACE PROCEDURE proc_Grade(
   p_roll        IN Stud_Marks.RollNo%TYPE,
   p_name        IN Stud_Marks.name%TYPE,
   p_total_marks IN Stud_Marks.total_marks%TYPE
) IS
   v_category VARCHAR2(30);

BEGIN
   IF p_total_marks >= 990 AND p_total_marks <= 1500 THEN
      v_category := 'Distinction';
   ELSIF p_total_marks >= 900 AND p_total_marks <= 989 THEN
      v_category := 'First Class';
   ELSIF p_total_marks >= 825 AND p_total_marks <= 899 THEN
      v_category := 'Higher Second Class';
   ELSE
      v_category := 'Fail';
   END IF;

   INSERT INTO Result VALUES (p_roll, p_name, v_category);

   DBMS_OUTPUT.PUT_LINE('Result inserted for ' || p_name || ' with category: ' || v_category);

EXCEPTION
   WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;

--------------------------------------------------------------------------

DECLARE
   v_roll        Stud_Marks.RollNo%TYPE;
   v_name        Stud_Marks.name%TYPE;
   v_total_marks Stud_Marks.total_marks%TYPE;

BEGIN
    v_name := &Name;
    v_total_marks := &Total_marks;
    
    proc_Grade(v_roll, v_name, v_total_marks);
END;