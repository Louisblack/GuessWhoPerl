SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `guesswho` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `guesswho`;

CREATE  TABLE IF NOT EXISTS `guesswho`.`player` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(100) NULL DEFAULT NULL ,
  `fb_id` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 2590
DEFAULT CHARACTER SET = utf8;

CREATE  TABLE IF NOT EXISTS `guesswho`.`game` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `player1` INT(11) NOT NULL ,
  `player2` INT(11) NOT NULL ,
  `fb_id` INT(11) NOT NULL ,
  PRIMARY KEY (`id`), 
  CONSTRAINT `game_fk_1`
    FOREIGN KEY (`player1` )
    REFERENCES `guesswho`.`player` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `game_fk_2`
    FOREIGN KEY (`player2` )
    REFERENCES `guesswho`.`player` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION  )
ENGINE = InnoDB
AUTO_INCREMENT = 2590
DEFAULT CHARACTER SET = utf8;

CREATE  TABLE IF NOT EXISTS `guesswho`.`face` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(100) NULL DEFAULT NULL ,
  `big_url` VARCHAR(255) NOT NULL ,
  `small_url` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 2590
DEFAULT CHARACTER SET = utf8;

CREATE  TABLE IF NOT EXISTS `guesswho`.`game_face` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `game_id` INT(11) NOT NULL ,
  `face_id` INT(11) NOT NULL ,
  PRIMARY KEY (`id`), 
  CONSTRAINT `game_face_fk_1`
    FOREIGN KEY (`game_id` )
    REFERENCES `guesswho`.`game` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `game_face_fk_2`
    FOREIGN KEY (`face_id` )
    REFERENCES `guesswho`.`face` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION  )
ENGINE = InnoDB
AUTO_INCREMENT = 2590
DEFAULT CHARACTER SET = utf8;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;