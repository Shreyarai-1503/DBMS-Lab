DECLARE
   v_roll_no    Borrower.Rollno%TYPE;
   v_book_name  Borrower.NameofBook%TYPE;
   v_issue_date Borrower.DateofIssue%TYPE;
   v_status     Borrower.Status%TYPE;
   v_days_late  NUMBER;
   v_fine       NUMBER := 0;
   
BEGIN
   v_roll_no := &roll_no;
   v_book_name := &name_of_book;

   SELECT DateofIssue, Status
   INTO v_issue_date, v_status
   FROM Borrower
   WHERE Rollno = v_roll_no
   AND NameofBook = v_book_name;

   IF v_status = 'I' THEN
      v_days_late := SYSDATE - v_issue_date;

      IF v_days_late BETWEEN 15 AND 30 THEN
         v_fine := v_days_late * 5;
      ELSIF v_days_late > 30 THEN
         v_fine := v_days_late * 50;
      ELSE
         v_fine := 0;
      END IF;

      UPDATE Borrower SET Status = 'R' WHERE Rollno = v_roll_no AND NameofBook = v_book_name;

      IF v_fine > 0 THEN
         INSERT INTO Fine VALUES (v_roll_no, SYSDATE, v_fine);
      END IF;
      
      DBMS_OUTPUT.PUT_LINE('Book returned successfully. Fine: ' || v_fine);
   
   ELSE
      DBMS_OUTPUT.PUT_LINE('Error: The book is not issued.');
   END IF;

EXCEPTION
   WHEN NO_DATA_FOUND THEN
      DBMS_OUTPUT.PUT_LINE('Error: No such book issued to the given roll number.');
   WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('An unexpected error occurred.');
END;
