/*The MySQL Procedure VisitParents was developed to recursively find all ancestors for a given descendant */

DROP PROCEDURE IF EXISTS VisitParents;
DELIMITER try
CREATE PROCEDURE VisitParents( IN root VarCHAR(10) )
BEGIN
  DECLARE rows SMALLINT DEFAULT 0;
  DROP TABLE IF EXISTS visited;
  CREATE TABLE visited (
    gene VarCHAR(10) PRIMARY KEY
  ) ENGINE=innoDB;
  INSERT INTO visited VALUES (root );
  SET rows = ROW_COUNT();
  WHILE rows > 0 DO

 INSERT IGNORE INTO visited
      SELECT DISTINCT parent
      FROM term2term AS E
      INNER JOIN visited AS V ON E.child = V.gene;
    SET rows = ROW_COUNT();   
  END WHILE;
  SELECT * FROM visited;
  DROP TABLE visited;
END;
try
DELIMITER ;

