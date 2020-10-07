--
-- Dumping data for table `Phone`
--

INSERT INTO `Phone`(id, Area, Number, Prefix) VALUES (5,111,1111,111),(10,111,1111,111),(15,111,1111,111);

--
-- Dumping data for table `ZipCode`
--

INSERT INTO `ZipCode`(id, Basic_Code, Plus_four) VALUES (3,52557,0),(8,52557,0),(13,52557,0);

--
-- Dumping data for table `address`
--

INSERT INTO `address`(id, City, State, Street, Door, ZipCode_Id) VALUES (2,'Fairfield','IO','1000 N 4th',30,3),(7,'Fairfield','IO','1000 N 4th',20,8),(12,'Fairfield','IO','1000 N 4th',20,13);

--
-- Dumping data for table `IdDocument`
--

INSERT INTO `IdDocument`(Id_Document_Id, Document_No, Document_Type, Valid_Through) VALUES (4,'as233444445','STATE_ID','2222-11-11'),(9,'12345678','STATE_ID','2222-11-11'),(14,'as233444445','STATE_ID','2222-11-11');

--
-- Dumping data for table `User`
-- three users are created:
-- ADMIN: un: admin123 / pw: admin!23
-- RIDER: un: aserahmad / pw: admin!23
-- NONE: un: ahmadibrahim / pw: admin!23
--

INSERT INTO `User`(id, Average_Rating, Birthdate, Email, enabled, First_Name, Last_Name, No_of_Ratings, Password, User_Role, Username, Address_Id, IDDocument_Id, Phone_Id) VALUES (1,0,'1980-11-11','aaahmad@mum.edu',true,'Aser','Ahmad',0,'$2a$10$GXHQroYIvo.s4J2nYUFuc.TpuOcrNgdmO4AfbBzI4fmqVBHsyeNEW','ROLE_ADMIN','admin123',2,4,5),(6,0,'1978-11-11','a@b.com',true,'Aser','Ahmad',0,'$2a$10$TxHVUaYg1o3Fofuc1U1kxOmsnt.j.IjxlBSDlSzhRaze1BgSW.xnG','ROLE_RIDER','aserahmad',7,9,10),(11,0,'1978-11-11','',true,'Ahmad','Ibrahim',0,'$2a$10$3c/UHMRmNb9czRlgnvsNEOag0NVQJaRMdUvAi8E.VyRXQpU6OhaUy','ROLE_NONE','ahmadibrahim',12,14,15);

--
-- Dumping data for table `Car`
--

INSERT INTO `car`(id, color, makeYear, manufacturer, maxNoOfPassengers, model, plateNo) VALUES (1,'Red',2008,'Toyota',4,'Camry','TX12345');

--
-- Dumping data for table `Driver`
--

INSERT INTO `driver`(id, driverApprovalDate, drivingExpirationDate, drivingLicenseNo, isDriverApproved, car_id, user_id) VALUES (1,NULL,'2022-01-01','6543AR123',false,1,6);

--
-- Dumping data for table `Trip`
--

--
-- Dumping data for table `passenter_trip`
--

--
-- Dumping data for table `Review`
--

-- # INSERT INTO users(username,password,enabled) VALUES ('guest','$2a$10$0.ESlGysrPaiW5HaapKwoehzWt5AibgbPPOvMhDv8D6H26QQ/CwhS', TRUE);
-- # INSERT INTO users(username,password,enabled) VALUES ('admin','$2a$10$S/wlXEo/APzf.Sn1cO2p4.V12EJmaw.uzrHelMvkpuahjmHWnSafe', TRUE);
-- INSERT INTO User(id, Fisrt_Name, Last_Name, User_Role, User_name, Password, Birthdate, email, enabled, Address_Id, IdDocument_Id, Phone_Id)
-- VALUES (1, 'Aser', 'Ahmad', 'USER_ADMIN', 'admin123', '$2a$10$gBOH0K/81KbdNsSZNSTgHeTMkjcNfsaoSCPsWDJPHg/VeAUthMNBO', '11-25-1977', 'a@mum.edu', 1, 1, 1, 1);
--
-- # INSERT INTO authorities (ID,username, authority) VALUES (1,'guest', 'ROLE_USER');
-- # INSERT INTO authorities (ID,username, authority) VALUES (2,'admin', 'ROLE_ADMIN');
-- # INSERT INTO authorities (ID,username, authority) VALUES (3,'admin', 'ROLE_USER');
-- #
-- #
-- # INSERT INTO `address` VALUES (1,'442 Glenwood Avenue','Culver City','CA', '87547');
-- # INSERT INTO `address` VALUES (2,'1 Yellow Brook Road','Emerald City','OZ', '12345');



					