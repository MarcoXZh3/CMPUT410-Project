USE Project-Django;

-- "python manage.py syncdb" can do the following for you:
-- =============================================================================
-- DROP TABLE IF EXISTS `PetShelter_people`;
-- CREATE TABLE `PetShelter_people` (
--   `user_id` VARCHAR(20) PRIMARY KEY,
--   `user_type` VARCHAR(11) NOT NULL,           -- ENUM('MEMBER', 'VOLUNTEER', 'USER')
--   `name` VARCHAR(50) NOT NULL,
--   `gender` VARCHAR(6) NOT NULL,               -- ENUM('MALE', 'FEMALE')
--   `age` INTEGER NOT NULL,                     -- Age in YEARS
--   `phone` VARCHAR(15) NOT NULL,
--   `email` VARCHAR(75) NOT NULL,
--   `address` VARCHAR(100) NOT NULL,
--   `city` VARCHAR(20) NOT NULL,
--   `province` VARCHAR(15) NOT NULL,
--   `postal_code` VARCHAR(6) NOT NULL,
--   `education` VARCHAR(10) NOT NULL,
--   `occupation` VARCHAR(20) NOT NULL,          -- Not applicable for members
--   `income` NUMERIC(12, 2),                    -- Yearly income; not applicable for members
--   `special_skills` VARCHAR(50) NOT NULL
-- ); -- CREATE TABLE `PetShelter_people`
-- 
-- DROP TABLE IF EXISTS `PetShelter_shelter`;
-- CREATE TABLE `PetShelter_shelter` (
--   `shelter_id` INTEGER AUTO_INCREMENT PRIMARY KEY,
--   `name` VARCHAR(50) NOT NULL,
--   `shelter_type` VARCHAR(8) NOT NULL,         -- ENUM('SHELTER', 'VET')
--   `address` VARCHAR(100) NOT NULL,
--   `city` VARCHAR(20) NOT NULL,
--   `province` VARCHAR(15) NOT NULL,
--   `postal_code` VARCHAR(6) NOT NULL,
--   `phone` VARCHAR(15) NOT NULL,
--   `email` VARCHAR(75) NOT NULL,
--   `open_hour` LONGTEXT NOT NULL,
-- ); -- CREATE TABLE `PetShelter_shelter`
-- 
-- DROP TABLE IF EXISTS `PetShelter_shelterstaff`;
-- CREATE TABLE `PetShelter_shelterstaff` (
--   `staff_id` VARCHAR(20) PRIMARY KEY,         -- ID of a staff
--   `staff_type` VARCHAR(11) NOT NULL,          -- ENUM('MEMBER', 'VOLUNTEER')
--   `shelter_id` INTEGER NOT NULL,              -- ID of a shelter
--   `start_date` DATE,                          -- NULL mean it's a volunteer application and is not replied
--   `accepted` BOOL NOT NULL,                   -- Member's value is always TRUE(1)
--   FOREIGN KEY (`shelter_id`) REFERENCES `PetShelter_shelter` (`shelter_id`),
--   FOREIGN KEY (`staff_id`) REFERENCES `PetShelter_people` (`user_id`)
-- ); -- CREATE TABLE `PetShelter_shelterstaff`
-- 
-- DROP TABLE IF EXISTS `PetShelter_animal`;
-- CREATE TABLE `PetShelter_animal` (
--   `animal_id` VARCHAR(10) PRIMARY KEY,
--   `name` VARCHAR(50) NOT NULL,
--   `species` VARCHAR(10) NOT NULL,
--   `breed` VARCHAR(50) NOT NULL,
--   `birthday` DATE,                            -- NULL means unknown birthday
--   `deathday` DATE,                            -- NULL means still alive
--   `gender` VARCHAR(6) NOT NULL,               -- ENUM('MALE', 'FEMALE')
--   `size` VARCHAR(10) NOT NULL,
--   `color` VARCHAR(10) NOT NULL,
--   `spayed_or_neutered` BOOL NOT NULL,
--   `adopted_price` NUMERIC(7, 2) NOT NULL,
--   `stage` BOOL NOT NULL,                      -- True(1) for available; False(0) for not available
--   `shelter_id` INTEGER NOT NULL,              -- ID of the shelter
--   FOREIGN KEY (`shelter_id`) REFERENCES `PetShelter_shelter` (`shelter_id`)
-- ); -- CREATE TABLE `PetShelter_animal`
-- 
-- DROP TABLE IF EXISTS `PetShelter_animalfile`;
-- CREATE TABLE `PetShelter_animalfile` (
--   `id` INTEGER AUTO_INCREMENT PRIMARY KEY,
--   `animal_id` VARCHAR(10) NOT NULL,           -- ID of the animal
--   `file_type` VARCHAR(5) NOT NULL,
--   `path` VARCHAR(100) NOT NULL,
--   FOREIGN KEY (`animal_id`) REFERENCES `PetShelter_animal` (`animal_id`)
-- ); -- CREATE TABLE `PetShelter_animalfile`
-- 
-- DROP TABLE IF EXISTS `PetShelter_receipt`;
-- CREATE TABLE `PetShelter_receipt` (
--   `id` INTEGER AUTO_INCREMENT PRIMARY KEY,
--   `receiver_id` VARCHAR(20) NOT NULL,         -- ID of the receiver
--   `animal_id` VARCHAR(10) NOT NULL,           -- ID of the animal
--   `received_date` DATE NOT NULL,
--   FOREIGN KEY (`animal_id`) REFERENCES `PetShelter_animal` (`animal_id`),
--   FOREIGN KEY (`receiver_id`) REFERENCES `PetShelter_people` (`user_id`)
-- ); -- CREATE TABLE `PetShelter_receipt`
-- 
-- DROP TABLE IF EXISTS `PetShelter_adoption`;
-- CREATE TABLE `PetShelter_adoption` (
--   `id` INTEGER AUTO_INCREMENT PRIMARY KEY,
--   `application_date` DATE NOT NULL,
--   `adopter_id` VARCHAR(20) NOT NULL,          -- ID of the adopter
--   `animal_id` VARCHAR(10) NOT NULL,           -- ID of the animal
--   `adoption_date` DATE,
--   `accepted` BOOL NOT NULL,
--   FOREIGN KEY (`animal_id`) REFERENCES `PetShelter_animal` (`animal_id`),
--   FOREIGN KEY (`adopter_id`) REFERENCES `PetShelter_people` (`user_id`)
-- ); -- CREATE TABLE `PetShelter_adoption`
-- 
-- DROP TABLE IF EXISTS `PetShelter_surrender`;
-- CREATE TABLE `PetShelter_surrender` (
--   `id` INTEGER AUTO_INCREMENT PRIMARY KEY,
--   `application_date` DATE NOT NULL,
--   `surrenderer_id` VARCHAR(20) NOT NULL,      -- ID of the surrenderer
--   `animal_id` VARCHAR(10) NOT NULL,           -- ID of the animal
--   `surrender_date` DATE,
--   `accepted` BOOL NOT NULL,
--   `reason` LONGTEXT NOT NULL,
--   FOREIGN KEY (`surrenderer_id`) REFERENCES `PetShelter_people` (`user_id`),
--   FOREIGN KEY (`animal_id`) REFERENCES `PetShelter_animal` (`animal_id`)
-- ); -- CREATE TABLE `PetShelter_surrender`
-- 
-- DROP TABLE IF EXISTS `PetShelter_donation`;
-- CREATE TABLE `PetShelter_donation` (
--   `id` INTEGER AUTO_INCREMENT PRIMARY KEY,
--   `application_date` DATE NOT NULL,
--   `donator_id` VARCHAR(20) NOT NULL,          -- ID of the donator
--   `donation_type` VARCHAR(7) NOT NULL,        -- ENUM('MONEY', 'VETCARE', 'ITEM')
--   `content` LONGTEXT NOT NULL,
--   `animal_id` VARCHAR(10),                    -- ID of the animal (if any)
--   `donate_date` DATE,
--   `accepted` BOOL NOT NULL,
--   FOREIGN KEY (`donator_id`) REFERENCES `PetShelter_people` (`user_id`),
--   FOREIGN KEY (`animal_id`) REFERENCES `PetShelter_animal` (`animal_id`)
-- ); -- CREATE TABLE `PetShelter_donation`
-- =============================================================================



-- Staffs (members and volunteers), receivers
INSERT INTO `PetShelter_people`
              (`user_id`, `user_type`, `name`, `gender`, `age`, `phone`, `email`, `address`,
               `city`, `province`, `postal_code`, `education`, `Occupation`, `income`, `special_skills`)
       VALUES ('js-11', 'MEMBER', 'John Smith', 'FEMALE', 20, '(780)1000011', 'js-11@b.com', '10011 100 St.',
               'Edmonton', 'Alberta', 'T1A1A1', 'College', '', NULL, 'Health care');
INSERT INTO `PetShelter_people`
              (`user_id`, `user_type`, `name`, `gender`, `age`, `phone`, `email`, `address`,
               `city`, `province`, `postal_code`, `education`, `Occupation`, `income`, `special_skills`)
       VALUES ('js-12', 'VOLUNTEER', 'John Smith', 'MALE', 20, '(780)1000012', 'js-12@b.com', '10012 100 St.',
               'Edmonton', 'Alberta', 'T1A1A1', 'High school', 'School teacher', 30000, '');
INSERT INTO `PetShelter_people`
              (`user_id`, `user_type`, `name`, `gender`, `age`, `phone`, `email`, `address`,
               `city`, `province`, `postal_code`, `education`, `Occupation`, `income`, `special_skills`)
       VALUES ('js-21', 'MEMBER', 'John Smith', 'MALE', 20, '(780)1000021', 'js-21@b.com', '10021 100 St.',
               'Edmonton', 'Alberta', 'T1A1A1', 'College', '', NULL, 'Computer');
INSERT INTO `PetShelter_people`
              (`user_id`, `user_type`, `name`, `gender`, `age`, `phone`, `email`, `address`,
               `city`, `province`, `postal_code`, `education`, `Occupation`, `income`, `special_skills`)
       VALUES ('js-22', 'VOLUNTEER', 'John Smith', 'MALE', 20, '(780)1000022', 'js-22@b.com', '10022 100 St.',
               'Edmonton', 'Alberta', 'T1A1A1', 'High school', 'School teacher', 50000, '');
INSERT INTO `PetShelter_people`
              (`user_id`, `user_type`, `name`, `gender`, `age`, `phone`, `email`, `address`,
               `city`, `province`, `postal_code`, `education`, `Occupation`, `income`, `special_skills`)
       VALUES ('js-31', 'MEMBER', 'John Smith', 'FEMALE', 20, '(780)1000031', 'js-31@b.com', '10031 100 St.',
               'Edmonton', 'Alberta', 'T1A1A1', 'College', '', NULL, 'Health care');
INSERT INTO `PetShelter_people`
              (`user_id`, `user_type`, `name`, `gender`, `age`, `phone`, `email`, `address`,
               `city`, `province`, `postal_code`, `education`, `Occupation`, `income`, `special_skills`)
       VALUES ('js-32', 'VOLUNTEER', 'John Smith', 'FEMALE', 20, '(780)1000032', 'js-32@b.com', '10032 100 St.',
               'Edmonton', 'Alberta', 'T1A1A1', 'College', '', NULL, 'Health care');
-- Adopters
INSERT INTO `PetShelter_people`
              (`user_id`, `user_type`, `name`, `gender`, `age`, `phone`, `email`, `address`,
               `city`, `province`, `postal_code`, `education`, `Occupation`, `income`, `special_skills`)
       VALUES ('js-a01', 'USER', 'John Smith', 'MALE', 20, '(780)1000101', 'js-a01@b.com', '10041 100 St.',
               'Edmonton', 'Alberta', 'T1A1A1', 'College', '', 10000, '');
INSERT INTO `PetShelter_people`
              (`user_id`, `user_type`, `name`, `gender`, `age`, `phone`, `email`, `address`,
               `city`, `province`, `postal_code`, `education`, `Occupation`, `income`, `special_skills`)
       VALUES ('js-a02', 'USER', 'John Smith', 'FEMALE', 20, '(780)1000102', 'js-a02@b.com', '10042 100 St.',
               'Edmonton', 'Alberta', 'T1A1A1', 'College', '', 20000, '');
INSERT INTO `PetShelter_people`
              (`user_id`, `user_type`, `name`, `gender`, `age`, `phone`, `email`, `address`,
               `city`, `province`, `postal_code`, `education`, `Occupation`, `income`, `special_skills`)
       VALUES ('js-a03', 'USER', 'John Smith', 'MALE', 20, '(780)1000103', 'js-a03@b.com', '10043 100 St.',
               'Edmonton', 'Alberta', 'T1A1A1', 'College', '', 30000, '');
-- Surrenderers
INSERT INTO `PetShelter_people`
              (`user_id`, `user_type`, `name`, `gender`, `age`, `phone`, `email`, `address`,
               `city`, `province`, `postal_code`, `education`, `Occupation`, `income`, `special_skills`)
      VALUES  ('js-s01', 'USER', 'John Smith', 'MALE', 20, '(780)1000201', 'js-s01@b.com', '10051 100 St.',
               'Edmonton', 'Alberta', 'T1A1A1', 'College', '', 10000, '');
INSERT INTO `PetShelter_people`
              (`user_id`, `user_type`, `name`, `gender`, `age`, `phone`, `email`, `address`,
               `city`, `province`, `postal_code`, `education`, `Occupation`, `income`, `special_skills`)
       VALUES ('js-s02', 'USER', 'John Smith', 'FEMALE', 20, '(780)1000202', 'js-s02@b.com', '10052 100 St.',
               'Edmonton', 'Alberta', 'T1A1A1', 'College', '', 20000, '');
INSERT INTO `PetShelter_people`
              (`user_id`, `user_type`, `name`, `gender`, `age`, `phone`, `email`, `address`,
               `city`, `province`, `postal_code`, `education`, `Occupation`, `income`, `special_skills`)
       VALUES ('js-s03', 'USER', 'John Smith', 'MALE', 20, '(780)1000203', 'js-s03@b.com', '10053 100 St.',
               'Edmonton', 'Alberta', 'T1A1A1', 'College', '', 30000, '');
-- Donators
INSERT INTO `PetShelter_people`
              (`user_id`, `user_type`, `name`, `gender`, `age`, `phone`, `email`, `address`,
               `city`, `province`, `postal_code`, `education`, `Occupation`, `income`, `special_skills`)
       VALUES ('js-d01', 'USER', 'John Smith', 'MALE', 20, '(780)1000301', 'js-d01@b.com', '10061 100 St.',
               'Edmonton', 'Alberta', 'T1A1A1', 'College', '', 10000, '');
INSERT INTO `PetShelter_people`
              (`user_id`, `user_type`, `name`, `gender`, `age`, `phone`, `email`, `address`,
               `city`, `province`, `postal_code`, `education`, `Occupation`, `income`, `special_skills`)
       VALUES ('js-d02', 'USER', 'John Smith', 'FEMALE', 20, '(780)1000302', 'js-d02@b.com', '10062 100 St.',
               'Edmonton', 'Alberta', 'T1A1A1', 'College', '', 20000, '');
INSERT INTO `PetShelter_people`
              (`user_id`, `user_type`, `name`, `gender`, `age`, `phone`, `email`, `address`,
               `city`, `province`, `postal_code`, `education`, `Occupation`, `income`, `special_skills`)
       VALUES ('js-d03', 'USER', 'John Smith', 'MALE', 20, '(780)1000303', 'js-d03@b.com', '10063 100 St.',
               'Edmonton', 'Alberta', 'T1A1A1', 'College', '', 30000, '');
SELECT * FROM `PetShelter_people`;

INSERT INTO `PetShelter_shelter` (`name`, `shelter_type`, `address`, `city`, `province`,
                                  `postal_code`, `phone`, `email`, `open_hour`)
                          VALUES ('Shelter1', 'SHELTER', '10001 100 St.', 'Edmonton', 'Alberta',
                                  'T1A1A1', '(780)1000001', 'shelter1@a.com',
                                  'Weekdays: 08:00 AM - 06:00 PM;\nWeekends: 10:00 AM - 02:00 PM.');
INSERT INTO `PetShelter_shelter` (`name`, `shelter_type`, `address`, `city`, `province`,
                                  `postal_code`, `phone`, `email`, `open_hour`)
                          VALUES ('Shelter2', 'SHELTER', '10002 100 St.', 'Edmonton', 'Alberta',
                                  'T1A1A1', '(780)1000002', 'shelter2@a.com',
                                  'Weekdays: 08:00 AM - 06:00 PM;\nSaturdays: 10:00 AM - 02:00 PM;\nSundays: Closed.');
INSERT INTO `PetShelter_shelter` (`name`, `shelter_type`, `address`, `city`, `province`,
                                  `postal_code`, `phone`, `email`, `open_hour`)
                          VALUES ('Vet1', 'VET', '10003 100 St.', 'Edmonton', 'Alberta',
                                  'T1A1A1', '(780)1000003', 'Vet1@a.com', '24 X 7');
SELECT * FROM `PetShelter_shelter`;

-- `shelter_id` of Shelter1 is 1
INSERT INTO `PetShelter_shelterstaff` (`staff_id`, `staff_type`, `shelter_id`, `start_date`, `accepted`)
                               VALUES ('js-11', 'MEMBER', 1, '2000-01-01', TRUE);
INSERT INTO `PetShelter_shelterstaff` (`staff_id`, `staff_type`, `shelter_id`, `start_date`, `accepted`)
                               VALUES ('js-12', 'VOLUNTEER', 1, '2000-01-01', TRUE);
-- `shelter_id` of Shelter2 is 2
INSERT INTO `PetShelter_shelterstaff` (`staff_id`, `staff_type`, `shelter_id`, `start_date`, `accepted`)
                               VALUES ('js-21', 'MEMBER', 2, '2000-01-01', TRUE);
-- Rejected volunteer
INSERT INTO `PetShelter_shelterstaff` (`staff_id`, `staff_type`, `shelter_id`, `start_date`, `accepted`)
                               VALUES ('js-22', 'VOLUNTEER', 2, '2001-12-31', FALSE);
-- `shelter_id` of Shelter3 is 3
INSERT INTO `PetShelter_shelterstaff` (`staff_id`, `staff_type`, `shelter_id`, `start_date`, `accepted`)
                               VALUES ('js-31', 'MEMBER', 3, '2000-01-01', TRUE);
-- Not replied yet
INSERT INTO `PetShelter_shelterstaff` (`staff_id`, `staff_type`, `shelter_id`, `start_date`, `accepted`)
                               VALUES ('js-32', 'VOLUNTEER', 3, NULL, FALSE);
SELECT * FROM `PetShelter_shelterstaff`;

INSERT INTO `PetShelter_animal` (`animal_id`, `name`, `species`, `breed`, `birthday`, `deathday`, `gender`, 
                                 `size`, `color`, `spayed_or_neutered`, `adopted_price`, `stage`, `shelter_id`)
                         VALUES ('AD01', 'dog01', 'dog', 'breed01', '2005-05-05', NULL, 'MALE',
                                 'Medium', 'black', TRUE, 100.00, TRUE, 1);
INSERT INTO `PetShelter_animal` (`animal_id`, `name`, `species`, `breed`, `birthday`, `deathday`, `gender`, 
                                 `size`, `color`, `spayed_or_neutered`, `adopted_price`, `stage`, `shelter_id`)
                         VALUES ('AD02', 'dog02', 'dog', 'breed02', NULL, NULL, 'FEMALE',
                                 'Medium', 'yellow', TRUE, 100.00, FALSE, 1);
INSERT INTO `PetShelter_animal` (`animal_id`, `name`, `species`, `breed`, `birthday`, `deathday`, `gender`, 
                                 `size`, `color`, `spayed_or_neutered`, `adopted_price`, `stage`, `shelter_id`)
                         VALUES ('AC01', 'cat01', 'cat', 'breed03', NULL, '2013-05-05', 'MALE',
                                 'Large', 'black', TRUE, 100.00, FALSE, 1);
INSERT INTO `PetShelter_animal` (`animal_id`, `name`, `species`, `breed`, `birthday`, `deathday`, `gender`, 
                                 `size`, `color`, `spayed_or_neutered`, `adopted_price`, `stage`, `shelter_id`)
                         VALUES ('AB01', 'bird01', 'bird', 'breed04', '2011-07-24', NULL, 'FEMALE',
                                 'Medium', 'black', TRUE, 100.00, TRUE, 2);
INSERT INTO `PetShelter_animal` (`animal_id`, `name`, `species`, `breed`, `birthday`, `deathday`, `gender`, 
                                 `size`, `color`, `spayed_or_neutered`, `adopted_price`, `stage`, `shelter_id`)
                         VALUES ('AB02', 'bird02', 'bird', 'breed05', '2000-01-09', '2010-09-08', 'MALE',
                                 'Large', 'green', TRUE, 100.00, FALSE, 2);
INSERT INTO `PetShelter_animal` (`animal_id`, `name`, `species`, `breed`, `birthday`, `deathday`, `gender`, 
                                 `size`, `color`, `spayed_or_neutered`, `adopted_price`, `stage`, `shelter_id`)
                         VALUES ('AC02', 'cat02', 'cat', 'breed06', '2001-06-24', NULL, 'MALE',
                                 'Large', 'black', TRUE, 100.00, FALSE, 2);
INSERT INTO `PetShelter_animal` (`animal_id`, `name`, `species`, `breed`, `birthday`, `deathday`, `gender`, 
                                 `size`, `color`, `spayed_or_neutered`, `adopted_price`, `stage`, `shelter_id`)
                         VALUES ('AC03', 'cat03', 'cat', 'breed07', NULL, NULL, 'MALE',
                                 'small', 'yellow', FALSE, 100.00, TRUE, 3);
INSERT INTO `PetShelter_animal` (`animal_id`, `name`, `species`, `breed`, `birthday`, `deathday`, `gender`, 
                                 `size`, `color`, `spayed_or_neutered`, `adopted_price`, `stage`, `shelter_id`)
                         VALUES ('AB03', 'bird03', 'bird', 'breed08', NULL, NULL, 'FEMALE',
                                 'small', 'yellow', FALSE, 100.00, FALSE, 3);
INSERT INTO `PetShelter_animal` (`animal_id`, `name`, `species`, `breed`, `birthday`, `deathday`, `gender`, 
                                 `size`, `color`, `spayed_or_neutered`, `adopted_price`, `stage`, `shelter_id`)
                         VALUES ('AD03', 'dog03', 'dog', 'breed09', NULL, '2009-09-09', 'MALE',
                                 'small', 'yellow', FALSE, 100.00, FALSE, 3);
-- This animal was not permited to be surrendered into shelters
INSERT INTO `PetShelter_animal` (`animal_id`, `name`, `species`, `breed`, `birthday`, `deathday`, `gender`, 
                                 `size`, `color`, `spayed_or_neutered`, `adopted_price`, `stage`, `shelter_id`)
                         VALUES ('AS01', 'snake01', 'snake', 'breed10', NULL, NULL, 'MALE',
                                 'Huge', 'black', FALSE, 0.00, FALSE, NULL);
INSERT INTO `PetShelter_animal` (`animal_id`, `name`, `species`, `breed`, `birthday`, `deathday`, `gender`, 
                                 `size`, `color`, `spayed_or_neutered`, `adopted_price`, `stage`, `shelter_id`)
                         VALUES ('AS02', 'snake02', 'snake', 'breed11', NULL, NULL, 'MALE',
                                 'Huge', 'yellow', FALSE, 0.00, FALSE, NULL);
SELECT * FROM `PetShelter_animal`;

INSERT INTO `PetShelter_animalfile` (`animal_id`, `file_type`, `path`)
                             VALUES ('AB01', 'PHOTO', 'PetShelter/AnimalFiles/AB01-01.jpg');
INSERT INTO `PetShelter_animalfile` (`animal_id`, `file_type`, `path`)
                             VALUES ('AB01', 'PHOTO', 'PetShelter/AnimalFiles/AB01-02.jpg');
INSERT INTO `PetShelter_animalfile` (`animal_id`, `file_type`, `path`)
                             VALUES ('AB02', 'PHOTO', 'PetShelter/AnimalFiles/AB02-01.jpg');
INSERT INTO `PetShelter_animalfile` (`animal_id`, `file_type`, `path`)
                             VALUES ('AB03', 'PHOTO', 'PetShelter/AnimalFiles/AB03-01.jpg');
INSERT INTO `PetShelter_animalfile` (`animal_id`, `file_type`, `path`)
                             VALUES ('AC01', 'PHOTO', 'PetShelter/AnimalFiles/AC01-01.jpg');
INSERT INTO `PetShelter_animalfile` (`animal_id`, `file_type`, `path`)
                             VALUES ('AC02', 'PHOTO', 'PetShelter/AnimalFiles/AC02-01.jpg');
INSERT INTO `PetShelter_animalfile` (`animal_id`, `file_type`, `path`)
                             VALUES ('AC02', 'PHOTO', 'PetShelter/AnimalFiles/AC02-02.jpg');
INSERT INTO `PetShelter_animalfile` (`animal_id`, `file_type`, `path`)
                             VALUES ('AC03', 'PHOTO', 'PetShelter/AnimalFiles/AC03-01.jpg');
INSERT INTO `PetShelter_animalfile` (`animal_id`, `file_type`, `path`)
                             VALUES ('AD01', 'PHOTO', 'PetShelter/AnimalFiles/AD01-01.jpg');
INSERT INTO `PetShelter_animalfile` (`animal_id`, `file_type`, `path`)
                             VALUES ('AD02', 'PHOTO', 'PetShelter/AnimalFiles/AD02-01.jpg');
INSERT INTO `PetShelter_animalfile` (`animal_id`, `file_type`, `path`)
                             VALUES ('AD03', 'PHOTO', 'PetShelter/AnimalFiles/AD03-01.jpg');
INSERT INTO `PetShelter_animalfile` (`animal_id`, `file_type`, `path`)
                             VALUES ('AD03', 'PHOTO', 'PetShelter/AnimalFiles/AD03-02.jpg');
INSERT INTO `PetShelter_animalfile` (`animal_id`, `file_type`, `path`)
                             VALUES ('AD03', 'AUDIO', 'PetShelter/AnimalFiles/AD03-03.wav');
INSERT INTO `PetShelter_animalfile` (`animal_id`, `file_type`, `path`)
                             VALUES ('AD03', 'VIDEO', 'PetShelter/AnimalFiles/AD03-04.webm');
INSERT INTO `PetShelter_animalfile` (`animal_id`, `file_type`, `path`)
                             VALUES ('AS01', 'PHOTO', 'PetShelter/AnimalFiles/AS01-01.jpg');
INSERT INTO `PetShelter_animalfile` (`animal_id`, `file_type`, `path`)
                             VALUES ('AS02', 'PHOTO', 'PetShelter/AnimalFiles/AS02-01.jpg');
SELECT * FROM `PetShelter_animalfile`;

INSERT INTO `PetShelter_receipt` (`receiver_id`, `animal_id`, `received_date`)
                          VALUES ('js-11', 'AD01', '2008-04-04');
INSERT INTO `PetShelter_receipt` (`receiver_id`, `animal_id`, `received_date`)
                          VALUES ('js-12', 'AD02', '2009-08-08');
INSERT INTO `PetShelter_receipt` (`receiver_id`, `animal_id`, `received_date`)
                          VALUES ('js-21', 'AB01', '2012-03-09');
INSERT INTO `PetShelter_receipt` (`receiver_id`, `animal_id`, `received_date`)
                          VALUES ('js-21', 'AC02', '2009-08-08');
INSERT INTO `PetShelter_receipt` (`receiver_id`, `animal_id`, `received_date`)
                          VALUES ('js-31', 'AC03', '2009-08-08');
INSERT INTO `PetShelter_receipt` (`receiver_id`, `animal_id`, `received_date`)
                          VALUES ('js-31', 'AB03', '2009-08-08');
SELECT * FROM `PetShelter_receipt`;

INSERT INTO `PetShelter_adoption` (`application_date`, `adopter_id`, `animal_id`, `adoption_date`, `accepted`)
                           VALUES ('2013-05-09', 'js-a01', 'AD02', '2013-05-09', TRUE);
INSERT INTO `PetShelter_adoption` (`application_date`, `adopter_id`, `animal_id`, `adoption_date`, `accepted`)
                           VALUES ('2003-05-09', 'js-a02', 'AC02', '2003-05-19', TRUE);
INSERT INTO `PetShelter_adoption` (`application_date`, `adopter_id`, `animal_id`, `adoption_date`, `accepted`)
                           VALUES ('2003-05-09', 'js-a02', 'AD03', '2003-05-19', TRUE);
-- Rejected adoption
INSERT INTO `PetShelter_adoption` (`application_date`, `adopter_id`, `animal_id`, `adoption_date`, `accepted`)
                           VALUES ('2003-06-09', 'js-a03', 'AC02', '2003-06-12', FALSE);
-- Not replied yet
INSERT INTO `PetShelter_adoption` (`application_date`, `adopter_id`, `animal_id`, `adoption_date`, `accepted`)
                           VALUES ('2003-06-19', 'js-a03', 'AD03', NULL, FALSE);
SELECT * FROM `PetShelter_adoption`;

INSERT INTO `PetShelter_surrender` (`application_date`, `surrenderer_id`, `reason`,
                                    `surrender_date`, `animal_id`, `accepted`)
                            VALUES ('2010-04-03', 'js-s01', 'No Reason', '2010-04-09', 'AC01', TRUE);
INSERT INTO `PetShelter_surrender` (`application_date`, `surrenderer_id`, `reason`,
                                    `surrender_date`, `animal_id`, `accepted`)
                            VALUES ('2008-06-15', 'js-s02', 'No Reason', '2008-06-15', 'AB02', TRUE);
INSERT INTO `PetShelter_surrender` (`application_date`, `surrenderer_id`, `reason`,
                                    `surrender_date`, `animal_id`, `accepted`)
                            VALUES ('2010-06-15', 'js-s02', 'No Reason', '2010-06-15', 'AD03', TRUE);
-- Rejected surrender
INSERT INTO `PetShelter_surrender` (`application_date`, `surrenderer_id`, `reason`,
                                    `surrender_date`, `animal_id`, `accepted`)
                            VALUES ('2010-04-19', 'js-s03', 'No Reason', '2010-04-19', 'AS01', FALSE);
-- Not replied yet
INSERT INTO `PetShelter_surrender` (`application_date`, `surrenderer_id`, `reason`,
                                    `surrender_date`, `animal_id`, `accepted`)
                            VALUES ('2010-04-19', 'js-s03', 'No Reason', NULL, 'AS02', FALSE);
SELECT * FROM `PetShelter_surrender`;

INSERT INTO `PetShelter_donation`
              (`application_date`, `donator_id`, `donation_type`, `content`, `animal_id`, `accepted_date`, `accepted`)
       VALUES ('2010-09-03', 'js-d01', 'VETCARE', 'Dental care', 'AD01', '2010-09-03', TRUE);
INSERT INTO `PetShelter_donation`
              (`application_date`, `donator_id`, `donation_type`, `content`, `animal_id`, `accepted_date`, `accepted`)
       VALUES ('2012-05-09', 'js-d02', 'MONEY', '$1000.00', 'AB01', '2012-05-19', TRUE);
INSERT INTO `PetShelter_donation`
              (`application_date`, `donator_id`, `donation_type`, `content`, `animal_id`, `accepted_date`, `accepted`)
       VALUES ('2012-05-09', 'js-d02', 'ITEM', 'Bird house x2', NULL, '2012-05-11', TRUE);
-- Rejected donation
INSERT INTO `PetShelter_donation`
              (`application_date`, `donator_id`, `donation_type`, `content`, `animal_id`, `accepted_date`, `accepted`)
       VALUES ('2004-07-06', 'js-d03', 'MONEY', '$1000.00', 'AC03', '2004-07-07', FALSE);
-- Not replied yet
INSERT INTO `PetShelter_donation`
              (`application_date`, `donator_id`, `donation_type`, `content`, `animal_id`, `accepted_date`, `accepted`)
       VALUES ('2004-07-06', 'js-d03', 'ITEM', 'Cat food', 'AC03', NULL, FALSE);
SELECT * FROM `PetShelter_donation`;

