CREATE SCHEMA IF NOT EXISTS `displayresort` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `displayresort` ;

-- -----------------------------------------------------
-- Table `displayresort`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `displayresort`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(450) NOT NULL,
  `password` VARCHAR(450) NOT NULL,
  `isAdmin` boolean NOT NULL,
  `isEmployee` boolean NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;



-- -----------------------------------------------------
-- Table `displayresort`.`service`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `displayresort`.`service` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(450) NOT NULL,
  `category` VARCHAR(450) NOT NULL,
  `image` VARCHAR(450) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `displayresort`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `displayresort`.`employee` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(450) NOT NULL,
  `lastname` VARCHAR(450) NOT NULL,
  `email` VARCHAR(450) NOT NULL,
  `phonenumber` VARCHAR(450) NOT NULL,
  `gender` INT NOT NULL,
  `position` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 110
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `displayresort`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `displayresort`.`customer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(450) NOT NULL,
  `lastname` VARCHAR(450) NOT NULL,
  `email` VARCHAR(450) NOT NULL,
  `phonenumber` VARCHAR(450) NOT NULL,
  `gender` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 207
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;



-- -----------------------------------------------------
-- Table `displayresort`.`contract`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `displayresort`.`contract` (
  `cid` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `id` INT NOT NULL,
  `falname` VARCHAR(450) NOT NULL,
  `email` VARCHAR(450) NOT NULL,
  `phonenumber` VARCHAR(450) NOT NULL,
  `gender` INT NOT NULL,
  `arrivaldate` DATE NOT NULL,
  `departuredate` DATE NOT NULL, 
  `adults` INT NOT NULL,
  `children` INT NOT NULL,
  `roomtype` VARCHAR(450) NOT NULL,
  `totalprice` VARCHAR(450) NOT NULL,
  `category` VARCHAR(450),
   FOREIGN KEY (`id`) REFERENCES employee(`id`)
  )
ENGINE = InnoDB
AUTO_INCREMENT = 207
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Insert `displayresort`.`user`
-- -----------------------------------------------------
insert into `user` values ('1', 'huy', '123', 1,0),
('2', 'huy1', '123', 1,0),
('3', 'huy2', '123', 1,0),
('4', 'hohuy', '123', 0,1),
('5', 'hohuy1', '123', 0,1),
('6', 'hohuy2', '123', 0,1);

-- -----------------------------------------------------
-- Insert `displayresort`.`service`
-- -----------------------------------------------------
insert into service values ('1', 'Laundry service', 'Inside house', 'laundry.jpg'),
('2', 'Restaurant', 'Serving food', 'restaurant.jpg'),
('3', 'Fitness center', 'Heatlh', 'fitness.jpg'),
('4', 'Spa', 'Make beautiful', 'spa.jpg'),
('5', 'Bar', 'Entertainment', 'bar.jpg'),
('6', 'Tennis', 'Outdoor sports', 'tennis.jpg'),
('7', 'Pool', 'Heatlh and take a shower', 'pool.jpg'),
('8', 'Casino', 'Entertainment', 'casino.jpg');

-- -----------------------------------------------------
-- Insert `displayresort`.`employee`
-- -----------------------------------------------------
insert into employee values (100,'Hồ Trần Quốc','Huy','100@1','123456789',1,1),
(101,'Nguyễn Thị','A','101@1','223456789',0,1),
(102,'Đặng Thị ','B','102@1','323456789',0,1),
(103,'ho','huy','103@1','423456789',1,0),
(104,'nguyen','a','104@1','523456789',0,0),
(105,'dang','b','105@1','623456789',0,0);

-- -----------------------------------------------------
-- Insert `displayresort`.`customer`
-- -----------------------------------------------------
insert into customer values (200,'Hồ Trần Quốc','Huy','100@1','123456789',1),
(201,'Nguyễn Thị','A','101@1','223456789',0),
(202,'Đặng Thị','B','102@1','323456789',0),
(203,'ho','huy','103@1','423456789',1),
(204,'nguyen','a','104@1','523456789',0),
(205,'dang','b','105@1','623456789',0);

-- -----------------------------------------------------
-- Insert `displayresort`.`contract`
-- -----------------------------------------------------
insert into contract values (1,100,'Hồ Trần Quốc Huy','100@1','123456789',1,'2022-10-23','2022-10-24',2,1,'Standard','99','Bị hủy'),
(2,102,'Nguyễn Thị A','101@1','223456789',0,'2022-10-23','2022-10-24',2,1,'VIP','299',''),
(3,102,'Đặng Thị B','102@1','323456789',0,'2022-10-23','2022-10-24',2,1,'DOUBLE','199','');



--------------
SELECT distinct c.cid,e.lastname,c.falname,c.email,c.phonenumber,c.gender,
c.arrivaldate,c.departuredate,c.adults,c.children,c.roomtype,
c.totalprice,c.category FROM displayresort.contract as c join 
displayresort.employee as e on c.id = e.id;

insert into contract (falname,id,email,phonenumber,gender,arrivaldate,
departuredate,adults,children,roomtype,totalprice,category) values  
('Lê Văn A',101,'102@1','323456789',0,'2022-10-23','2022-10-25',2,1,
'DOUBLE','199' * datediff(departuredate,arrivaldate),'');

delete from displayresort.contract where cid = 212;

update displayresort.contract set id = 101,
falname = 'Lê Văn A',
email= '102@1',
phonenumber= '123',
gender = 1, 
arrivaldate = '2022/10/23',
departuredate = '2022/10/26',
adults = 2,
children = 1,
roomtype = 'Standard',
totalprice = '99' * datediff(departuredate,arrivaldate) ,
category = ''
where cid= 207;

select distinct c.cid,e.lastname,c.falname,c.email,c.phonenumber,c.gender,
c.arrivaldate,c.departuredate,c.adults,c.children,c.roomtype,
c.totalprice,c.category from displayresort.contract as c join 
displayresort.employee as e on c.id = e.id where e.lastname like '%thi%'
