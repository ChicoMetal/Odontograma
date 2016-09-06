DELIMITER $$
CREATE PROCEDURE simple_loop ( ) 
BEGIN
  DECLARE counter BIGINT DEFAULT 0;
  
  my_loop: LOOP
    SET counter=counter+1;

    IF counter=10 THEN
      LEAVE my_loop;
    END IF;

    SELECT counter;

  END LOOP my_loop;
END$$
DELIMITER;