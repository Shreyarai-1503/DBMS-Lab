CREATE OR REPLACE TRIGGER trg_library_audit
AFTER UPDATE OR DELETE ON Library
FOR EACH ROW
DECLARE
    action  Library_Audit.ActionType%TYPE
BEGIN
   IF UPDATING THEN
        action := 'UPDATE';
   END IF;
   IF DELETING THEN
        action := 'DELETE';
   END IF;
 
   INSERT INTO Library_Audit VALUES (:OLD.BookID, :OLD.Title, :OLD.Author, :OLD.PublishedYear, action);
END;