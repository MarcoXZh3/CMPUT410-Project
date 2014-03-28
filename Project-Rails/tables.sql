USE `Project-Rails_development`;

-- Staffs (members and volunteers), receivers
INSERT INTO `people` (`user_id`, `user_type`, `name`, `gender`, `age`, `phone`, `e_mail`, `address`,
                      `city`, `province`, `postal_code`, `education`, `Occupation`, `income`, `special_skills`)
              VALUES ('js-11', 'MEMBER', 'John Smith', 'FEMALE', 20, '(780)1000011', 'js-11@b.com', '10011 100 St.',
                      'Edmonton', 'Alberta', 'T1A1A1', 'College', '', NULL, 'Health care');
INSERT INTO `people` (`user_id`, `user_type`, `name`, `gender`, `age`, `phone`, `e_mail`, `address`,
                      `city`, `province`, `postal_code`, `education`, `Occupation`, `income`, `special_skills`)
              VALUES ('js-12', 'VOLUNTEER', 'John Smith', 'MALE', 20, '(780)1000012', 'js-12@b.com', '10012 100 St.',
                      'Edmonton', 'Alberta', 'T1A1A1', 'High school', 'School teacher', 30000, '');
INSERT INTO `people` (`user_id`, `user_type`, `name`, `gender`, `age`, `phone`, `e_mail`, `address`,
                      `city`, `province`, `postal_code`, `education`, `Occupation`, `income`, `special_skills`)
              VALUES ('js-21', 'MEMBER', 'John Smith', 'MALE', 20, '(780)1000021', 'js-21@b.com', '10021 100 St.',
                      'Edmonton', 'Alberta', 'T1A1A1', 'College', '', NULL, 'Computer');
INSERT INTO `people` (`user_id`, `user_type`, `name`, `gender`, `age`, `phone`, `e_mail`, `address`,
                      `city`, `province`, `postal_code`, `education`, `Occupation`, `income`, `special_skills`)
              VALUES ('js-22', 'VOLUNTEER', 'John Smith', 'MALE', 20, '(780)1000022', 'js-22@b.com', '10022 100 St.',
                      'Edmonton', 'Alberta', 'T1A1A1', 'High school', 'School teacher', 50000, '');
INSERT INTO `people` (`user_id`, `user_type`, `name`, `gender`, `age`, `phone`, `e_mail`, `address`,
                      `city`, `province`, `postal_code`, `education`, `Occupation`, `income`, `special_skills`)
              VALUES ('js-31', 'MEMBER', 'John Smith', 'FEMALE', 20, '(780)1000031', 'js-31@b.com', '10031 100 St.',
                      'Edmonton', 'Alberta', 'T1A1A1', 'College', '', NULL, 'Health care');
INSERT INTO `people` (`user_id`, `user_type`, `name`, `gender`, `age`, `phone`, `e_mail`, `address`,
                      `city`, `province`, `postal_code`, `education`, `Occupation`, `income`, `special_skills`)
              VALUES ('js-32', 'VOLUNTEER', 'John Smith', 'FEMALE', 20, '(780)1000032', 'js-32@b.com', '10032 100 St.',
                      'Edmonton', 'Alberta', 'T1A1A1', 'College', '', NULL, 'Health care');
-- Adopters
INSERT INTO `people` (`user_id`, `user_type`, `name`, `gender`, `age`, `phone`, `e_mail`, `address`,
                      `city`, `province`, `postal_code`, `education`, `Occupation`, `income`, `special_skills`)
              VALUES ('js-a01', 'USER', 'John Smith', 'MALE', 20, '(780)1000101', 'js-a01@b.com', '10041 100 St.',
                      'Edmonton', 'Alberta', 'T1A1A1', 'College', '', 10000, '');
INSERT INTO `people` (`user_id`, `user_type`, `name`, `gender`, `age`, `phone`, `e_mail`, `address`,
                      `city`, `province`, `postal_code`, `education`, `Occupation`, `income`, `special_skills`)
              VALUES ('js-a02', 'USER', 'John Smith', 'FEMALE', 20, '(780)1000102', 'js-a02@b.com', '10042 100 St.',
                      'Edmonton', 'Alberta', 'T1A1A1', 'College', '', 20000, '');
INSERT INTO `people` (`user_id`, `user_type`, `name`, `gender`, `age`, `phone`, `e_mail`, `address`,
                      `city`, `province`, `postal_code`, `education`, `Occupation`, `income`, `special_skills`)
              VALUES ('js-a03', 'USER', 'John Smith', 'MALE', 20, '(780)1000103', 'js-a03@b.com', '10043 100 St.',
                      'Edmonton', 'Alberta', 'T1A1A1', 'College', '', 30000, '');
-- Surrenderers
INSERT INTO `people` (`user_id`, `user_type`, `name`, `gender`, `age`, `phone`, `e_mail`, `address`,
                      `city`, `province`, `postal_code`, `education`, `Occupation`, `income`, `special_skills`)
              VALUES ('js-s01', 'USER', 'John Smith', 'MALE', 20, '(780)1000201', 'js-s01@b.com', '10051 100 St.',
                      'Edmonton', 'Alberta', 'T1A1A1', 'College', '', 10000, '');
INSERT INTO `people` (`user_id`, `user_type`, `name`, `gender`, `age`, `phone`, `e_mail`, `address`,
                      `city`, `province`, `postal_code`, `education`, `Occupation`, `income`, `special_skills`)
              VALUES ('js-s02', 'USER', 'John Smith', 'FEMALE', 20, '(780)1000202', 'js-s02@b.com', '10052 100 St.',
                      'Edmonton', 'Alberta', 'T1A1A1', 'College', '', 20000, '');
INSERT INTO `people` (`user_id`, `user_type`, `name`, `gender`, `age`, `phone`, `e_mail`, `address`,
                      `city`, `province`, `postal_code`, `education`, `Occupation`, `income`, `special_skills`)
              VALUES ('js-s03', 'USER', 'John Smith', 'MALE', 20, '(780)1000203', 'js-s03@b.com', '10053 100 St.',
                      'Edmonton', 'Alberta', 'T1A1A1', 'College', '', 30000, '');
-- Donators
INSERT INTO `people` (`user_id`, `user_type`, `name`, `gender`, `age`, `phone`, `e_mail`, `address`,
                      `city`, `province`, `postal_code`, `education`, `Occupation`, `income`, `special_skills`)
              VALUES ('js-d01', 'USER', 'John Smith', 'MALE', 20, '(780)1000301', 'js-d01@b.com', '10061 100 St.',
                      'Edmonton', 'Alberta', 'T1A1A1', 'College', '', 10000, '');
INSERT INTO `people` (`user_id`, `user_type`, `name`, `gender`, `age`, `phone`, `e_mail`, `address`,
                      `city`, `province`, `postal_code`, `education`, `Occupation`, `income`, `special_skills`)
              VALUES ('js-d02', 'USER', 'John Smith', 'FEMALE', 20, '(780)1000302', 'js-d02@b.com', '10062 100 St.',
                      'Edmonton', 'Alberta', 'T1A1A1', 'College', '', 20000, '');
INSERT INTO `people` (`user_id`, `user_type`, `name`, `gender`, `age`, `phone`, `e_mail`, `address`,
                      `city`, `province`, `postal_code`, `education`, `Occupation`, `income`, `special_skills`)
              VALUES ('js-d03', 'USER', 'John Smith', 'MALE', 20, '(780)1000303', 'js-d03@b.com', '10063 100 St.',
                      'Edmonton', 'Alberta', 'T1A1A1', 'College', '', 30000, '');
SELECT * FROM `people`;

INSERT INTO `shelters` (`name`, `shelter_type`, `address`, `city`, `province`,
                        `postal_code`, `phone`, `e_mail`, `open_hour`)
                VALUES ('Shelter1', 'SHELTER', '10001 100 St.', 'Edmonton', 'Alberta',
                        'T1A1A1', '(780)1000001', 'shelter1@a.com',
                        'Weekdays: 08:00 AM - 06:00 PM;\nWeekends: 10:00 AM - 02:00 PM.');
INSERT INTO `shelters` (`name`, `shelter_type`, `address`, `city`, `province`,
                        `postal_code`, `phone`, `e_mail`, `open_hour`)
                VALUES ('Shelter2', 'SHELTER', '10002 100 St.', 'Edmonton', 'Alberta',
                        'T1A1A1', '(780)1000002', 'shelter2@a.com',
                        'Weekdays: 08:00 AM - 06:00 PM;\nSaturdays: 10:00 AM - 02:00 PM;\nSundays: Closed.');
INSERT INTO `shelters` (`name`, `shelter_type`, `address`, `city`, `province`,
                        `postal_code`, `phone`, `e_mail`, `open_hour`)
                VALUES ('Vet1', 'VET', '10003 100 St.', 'Edmonton', 'Alberta',
                        'T1A1A1', '(780)1000003', 'Vet1@a.com', '24 X 7');
SELECT * FROM `shelters`;

-- `shelter_id` of Shelter1 is 1
INSERT INTO `shelter_staffs` (`people_id`, `staff_type`, `shelter_id`, `start_date`, `accepted`)
                      VALUES ('1', 'MEMBER', 1, '2000-01-01', TRUE);
INSERT INTO `shelter_staffs` (`people_id`, `staff_type`, `shelter_id`, `start_date`, `accepted`)
                      VALUES ('2', 'VOLUNTEER', 1, '2000-01-01', TRUE);
-- `shelter_id` of Shelter2 is 2
INSERT INTO `shelter_staffs` (`people_id`, `staff_type`, `shelter_id`, `start_date`, `accepted`)
                      VALUES ('3', 'MEMBER', 2, '2000-01-01', TRUE);
-- Rejected volunteer
INSERT INTO `shelter_staffs` (`people_id`, `staff_type`, `shelter_id`, `start_date`, `accepted`)
                      VALUES ('4', 'VOLUNTEER', 2, '2001-12-31', FALSE);
-- `shelter_id` of Shelter3 is 3
INSERT INTO `shelter_staffs` (`people_id`, `staff_type`, `shelter_id`, `start_date`, `accepted`)
                      VALUES ('5', 'MEMBER', 3, '2000-01-01', TRUE);
-- Not replied yet
INSERT INTO `shelter_staffs` (`people_id`, `staff_type`, `shelter_id`, `start_date`, `accepted`)
                      VALUES ('6', 'VOLUNTEER', 3, NULL, FALSE);
SELECT * FROM `shelter_staffs`;

INSERT INTO `animals` (`animal_id`, `name`, `species`, `breed`, `birthday`, `deathday`, `gender`, 
                       `size`, `color`, `sn`, `price`, `stage`, `shelter_id`)
               VALUES ('AD01', 'dog01', 'dog', 'breed01', '2005-05-05', NULL, 'MALE',
                       'Medium', 'black', TRUE, 100.00, TRUE, 1);
INSERT INTO `animals` (`animal_id`, `name`, `species`, `breed`, `birthday`, `deathday`, `gender`, 
                       `size`, `color`, `sn`, `price`, `stage`, `shelter_id`)
               VALUES ('AD02', 'dog02', 'dog', 'breed02', NULL, NULL, 'FEMALE',
                       'Medium', 'yellow', TRUE, 100.00, FALSE, 1);
INSERT INTO `animals` (`animal_id`, `name`, `species`, `breed`, `birthday`, `deathday`, `gender`, 
                       `size`, `color`, `sn`, `price`, `stage`, `shelter_id`)
               VALUES ('AC01', 'cat01', 'cat', 'breed03', NULL, '2013-05-05', 'MALE',
                       'Large', 'black', TRUE, 100.00, FALSE, 1);
INSERT INTO `animals` (`animal_id`, `name`, `species`, `breed`, `birthday`, `deathday`, `gender`, 
                       `size`, `color`, `sn`, `price`, `stage`, `shelter_id`)
               VALUES ('AB01', 'bird01', 'bird', 'breed04', '2011-07-24', NULL, 'FEMALE',
                       'Medium', 'black', TRUE, 100.00, TRUE, 2);
INSERT INTO `animals` (`animal_id`, `name`, `species`, `breed`, `birthday`, `deathday`, `gender`, 
                       `size`, `color`, `sn`, `price`, `stage`, `shelter_id`)
               VALUES ('AB02', 'bird02', 'bird', 'breed05', '2000-01-09', '2010-09-08', 'MALE',
                       'Large', 'green', TRUE, 100.00, FALSE, 2);
INSERT INTO `animals` (`animal_id`, `name`, `species`, `breed`, `birthday`, `deathday`, `gender`, 
                       `size`, `color`, `sn`, `price`, `stage`, `shelter_id`)
               VALUES ('AC02', 'cat02', 'cat', 'breed06', '2001-06-24', NULL, 'MALE',
                       'Large', 'black', TRUE, 100.00, FALSE, 2);
INSERT INTO `animals` (`animal_id`, `name`, `species`, `breed`, `birthday`, `deathday`, `gender`, 
                       `size`, `color`, `sn`, `price`, `stage`, `shelter_id`)
               VALUES ('AC03', 'cat03', 'cat', 'breed07', NULL, NULL, 'MALE',
                       'small', 'yellow', FALSE, 100.00, TRUE, 3);
INSERT INTO `animals` (`animal_id`, `name`, `species`, `breed`, `birthday`, `deathday`, `gender`, 
                       `size`, `color`, `sn`, `price`, `stage`, `shelter_id`)
               VALUES ('AB03', 'bird03', 'bird', 'breed08', NULL, NULL, 'FEMALE',
                       'small', 'yellow', FALSE, 100.00, FALSE, 3);
INSERT INTO `animals` (`animal_id`, `name`, `species`, `breed`, `birthday`, `deathday`, `gender`, 
                       `size`, `color`, `sn`, `price`, `stage`, `shelter_id`)
               VALUES ('AD03', 'dog03', 'dog', 'breed09', NULL, '2009-09-09', 'MALE',
                       'small', 'yellow', FALSE, 100.00, FALSE, 3);
-- This animal was not permited to be surrendered into shelters
INSERT INTO `animals` (`animal_id`, `name`, `species`, `breed`, `birthday`, `deathday`, `gender`, 
                       `size`, `color`, `sn`, `price`, `stage`, `shelter_id`)
               VALUES ('AS01', 'snake01', 'snake', 'breed10', NULL, NULL, 'MALE',
                       'Huge', 'black', FALSE, 0.00, FALSE, NULL);
INSERT INTO `animals` (`animal_id`, `name`, `species`, `breed`, `birthday`, `deathday`, `gender`, 
                       `size`, `color`, `sn`, `price`, `stage`, `shelter_id`)
               VALUES ('AS02', 'snake02', 'snake', 'breed11', NULL, NULL, 'MALE',
                       'Huge', 'yellow', FALSE, 0.00, FALSE, NULL);
SELECT * FROM `animals`;

INSERT INTO `animal_files` (`animal_id`, `file_type`, `path`)
                    VALUES ('4', 'PHOTO', 'AnimalFiles/AB01-01.jpg');
INSERT INTO `animal_files` (`animal_id`, `file_type`, `path`)
                    VALUES ('4', 'PHOTO', 'AnimalFiles/AB01-02.jpg');
INSERT INTO `animal_files` (`animal_id`, `file_type`, `path`)
                    VALUES ('5', 'PHOTO', 'AnimalFiles/AB02-01.jpg');
INSERT INTO `animal_files` (`animal_id`, `file_type`, `path`)
                    VALUES ('8', 'PHOTO', 'AnimalFiles/AB03-01.jpg');
INSERT INTO `animal_files` (`animal_id`, `file_type`, `path`)
                    VALUES ('3', 'PHOTO', 'AnimalFiles/AC01-01.jpg');
INSERT INTO `animal_files` (`animal_id`, `file_type`, `path`)
                    VALUES ('6', 'PHOTO', 'AnimalFiles/AC02-01.jpg');
INSERT INTO `animal_files` (`animal_id`, `file_type`, `path`)
                    VALUES ('6', 'PHOTO', 'AnimalFiles/AC02-02.jpg');
INSERT INTO `animal_files` (`animal_id`, `file_type`, `path`)
                    VALUES ('7', 'PHOTO', 'AnimalFiles/AC03-01.jpg');
INSERT INTO `animal_files` (`animal_id`, `file_type`, `path`)
                    VALUES ('1', 'PHOTO', 'AnimalFiles/AD01-01.jpg');
INSERT INTO `animal_files` (`animal_id`, `file_type`, `path`)
                    VALUES ('2', 'PHOTO', 'AnimalFiles/AD02-01.jpg');
INSERT INTO `animal_files` (`animal_id`, `file_type`, `path`)
                    VALUES ('9', 'PHOTO', 'AnimalFiles/AD03-01.jpg');
INSERT INTO `animal_files` (`animal_id`, `file_type`, `path`)
                    VALUES ('9', 'PHOTO', 'AnimalFiles/AD03-02.jpg');
INSERT INTO `animal_files` (`animal_id`, `file_type`, `path`)
                    VALUES ('9', 'AUDIO', 'AnimalFiles/AD03-03.wav');
INSERT INTO `animal_files` (`animal_id`, `file_type`, `path`)
                    VALUES ('9', 'VIDEO', 'AnimalFiles/AD03-04.webm');
INSERT INTO `animal_files` (`animal_id`, `file_type`, `path`)
                    VALUES ('10', 'PHOTO', 'AnimalFiles/AS01-01.jpg');
INSERT INTO `animal_files` (`animal_id`, `file_type`, `path`)
                    VALUES ('11', 'PHOTO', 'AnimalFiles/AS02-01.jpg');
SELECT * FROM `animal_files`;

INSERT INTO `receipts` (`people_id`, `animal_id`, `received_date`) VALUES ('1', '1', '2008-04-04');
INSERT INTO `receipts` (`people_id`, `animal_id`, `received_date`) VALUES ('2', '2', '2009-08-08');
INSERT INTO `receipts` (`people_id`, `animal_id`, `received_date`) VALUES ('3', '4', '2012-03-09');
INSERT INTO `receipts` (`people_id`, `animal_id`, `received_date`) VALUES ('3', '6', '2009-08-08');
INSERT INTO `receipts` (`people_id`, `animal_id`, `received_date`) VALUES ('5', '7', '2009-08-08');
INSERT INTO `receipts` (`people_id`, `animal_id`, `received_date`) VALUES ('5', '8', '2009-08-08');
SELECT * FROM `receipts`;

INSERT INTO `adoptions` (`apply_date`, `people_id`, `animal_id`, `adoption_date`, `accepted`)
                 VALUES ('2013-05-09', '7', '2', '2013-05-09', TRUE);
INSERT INTO `adoptions` (`apply_date`, `people_id`, `animal_id`, `adoption_date`, `accepted`)
                 VALUES ('2003-05-09', '8', '6', '2003-05-19', TRUE);
INSERT INTO `adoptions` (`apply_date`, `people_id`, `animal_id`, `adoption_date`, `accepted`)
                 VALUES ('2003-05-09', '8', '9', '2003-05-19', TRUE);
-- Rejected adoption
INSERT INTO `adoptions` (`apply_date`, `people_id`, `animal_id`, `adoption_date`, `accepted`)
                 VALUES ('2003-06-09', '9', '6', '2003-06-12', FALSE);
-- Not replied yet
INSERT INTO `adoptions` (`apply_date`, `people_id`, `animal_id`, `adoption_date`, `accepted`)
                 VALUES ('2003-06-19', '9', '9', NULL, FALSE);
SELECT * FROM `adoptions`;

INSERT INTO `surrenders` (`apply_date`, `people_id`, `reason`, `surrender_date`, `animal_id`, `accepted`)
                  VALUES ('2010-04-03', '10', 'No Reason', '2010-04-09', '3', TRUE);
INSERT INTO `surrenders` (`apply_date`, `people_id`, `reason`, `surrender_date`, `animal_id`, `accepted`)
                  VALUES ('2008-06-15', '11', 'No Reason', '2008-06-15', '5', TRUE);
INSERT INTO `surrenders` (`apply_date`, `people_id`, `reason`, `surrender_date`, `animal_id`, `accepted`)
                  VALUES ('2010-06-15', '11', 'No Reason', '2010-06-15', '9', TRUE);
-- Rejected surrender
INSERT INTO `surrenders` (`apply_date`, `people_id`, `reason`, `surrender_date`, `animal_id`, `accepted`)
                  VALUES ('2010-04-19', '12', 'No Reason', '2010-04-19', '10', FALSE);
-- Not replied yet
INSERT INTO `surrenders` (`apply_date`, `people_id`, `reason`, `surrender_date`, `animal_id`, `accepted`)
                  VALUES ('2010-04-19', '12', 'No Reason', NULL, '11', FALSE);
SELECT * FROM `surrenders`;

INSERT INTO `donations`
              (`apply_date`, `people_id`, `donation_type`, `content`, `animal_id`, `donation_date`, `accepted`)
       VALUES ('2010-09-03', '13js-d01', 'VETCARE', 'Dental care', '1', '2010-09-03', TRUE);
INSERT INTO `donations`
              (`apply_date`, `people_id`, `donation_type`, `content`, `animal_id`, `donation_date`, `accepted`)
       VALUES ('2012-05-09', '14', 'MONEY', '$1000.00', '4', '2012-05-19', TRUE);
INSERT INTO `donations`
              (`apply_date`, `people_id`, `donation_type`, `content`, `animal_id`, `donation_date`, `accepted`)
       VALUES ('2012-05-09', '14', 'ITEM', 'Bird house x2', NULL, '2012-05-11', TRUE);
-- Rejected donation
INSERT INTO `donations`
              (`apply_date`, `people_id`, `donation_type`, `content`, `animal_id`, `donation_date`, `accepted`)
       VALUES ('2004-07-06', '15', 'MONEY', '$1000.00', '7', '2004-07-07', FALSE);
-- Not replied yet
INSERT INTO `donations`
              (`apply_date`, `people_id`, `donation_type`, `content`, `animal_id`, `donation_date`, `accepted`)
       VALUES ('2004-07-06', '15', 'ITEM', 'Cat food', '7', NULL, FALSE);
SELECT * FROM `donations`;

-- All users' passwords are set to '12345678'
INSERT INTO `users` (`email`, `encrypted_password`, `sign_in_count`, `current_sign_in_at`,
                     `last_sign_in_at`, `current_sign_in_ip`, `last_sign_in_ip`)
             VALUES ('js-11@b.com', '$2a$10$DvyrdlXijE/qrdHPqHWWCedjEJSTZ9PMvePhBrx/.CbLMX83.VBzq', '1',
                     '2014-03-28 07:23:53', '2014-03-28 07:23:53', '127.0.0.1', '127.0.0.1');
INSERT INTO `users` (`email`, `encrypted_password`, `sign_in_count`, `current_sign_in_at`,
                     `last_sign_in_at`, `current_sign_in_ip`, `last_sign_in_ip`)
             VALUES ('js-12@b.com', '$2a$10$FkFP9L5kmUZ86Yk1ozYmM.baVneRuFJ4yYv6ofy0zb/Cbrgt66Hbm', '1',
                     '2014-03-28 07:24:23', '2014-03-28 07:24:23', '127.0.0.1', '127.0.0.1');
INSERT INTO `users` (`email`, `encrypted_password`, `sign_in_count`, `current_sign_in_at`,
                     `last_sign_in_at`, `current_sign_in_ip`, `last_sign_in_ip`)
             VALUES ('js-21@b.com', '$2a$10$uIUJ8IkUHE7bZp70JeeZyeoQhmM6qPT66Ax6YNK8VT5EjiuoA0lZi', '1',
                     '2014-03-28 07:25:14', '2014-03-28 07:25:14', '127.0.0.1', '127.0.0.1');
INSERT INTO `users` (`email`, `encrypted_password`, `sign_in_count`, `current_sign_in_at`,
                     `last_sign_in_at`, `current_sign_in_ip`, `last_sign_in_ip`)
             VALUES ('js-31@b.com', '$2a$10$YVALXF0zTBavh6Zwwa5JGebYod7PAltFunm/jREl8Ou0v8VWlKWP6', '1',
                     '2014-03-28 07:25:38', '2014-03-28 07:25:38', '127.0.0.1', '127.0.0.1');
SELECT * FROM `users`;

