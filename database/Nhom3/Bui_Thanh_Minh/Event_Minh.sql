use qlht;

delimiter |

delimiter $$
CREATE EVENT BousnSalary
    ON SCHEDULE
      EVERY 1 year
    COMMENT 'A sample comment.'
    DO
      UPDATE employees SET salary = salary + 10000;
     
      $$

CREATE EVENT demo
    ON SCHEDULE
      EVERY 5 SECOND
    DO
      BEGIN
        DECLARE v INTEGER;
        DECLARE CONTINUE HANDLER FOR SQLEXCEPTION BEGIN END;

        SET v = 0;

        WHILE v < 5 DO
          INSERT INTO t1 VALUES (0);
          UPDATE t2 SET s1 = s1 + 1;
          SET v = v + 1;
        END WHILE;
    END |

delimiter ;
