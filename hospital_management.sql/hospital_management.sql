-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: hospital_management
-- ------------------------------------------------------
-- Server version	8.0.43

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `hospital_management`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `hospital_management` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `hospital_management`;

--
-- Table structure for table `diagnostictest`
--

DROP TABLE IF EXISTS `diagnostictest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diagnostictest` (
  `test_id` int NOT NULL AUTO_INCREMENT,
  `encounter_id` int DEFAULT NULL,
  `test_type` varchar(100) DEFAULT NULL,
  `test_date` date DEFAULT NULL,
  `result` text,
  PRIMARY KEY (`test_id`),
  KEY `encounter_id` (`encounter_id`),
  CONSTRAINT `diagnostictest_ibfk_1` FOREIGN KEY (`encounter_id`) REFERENCES `encounter` (`encounter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnostictest`
--

LOCK TABLES `diagnostictest` WRITE;
/*!40000 ALTER TABLE `diagnostictest` DISABLE KEYS */;
INSERT INTO `diagnostictest` VALUES (1,1,'Blood Test','2023-01-11','Normal'),(2,2,'X-Ray','2023-01-13','Fracture detected'),(3,3,'MRI','2023-01-16','Normal'),(4,4,'CT Scan','2023-01-21','Minor swelling'),(5,5,'Urine Test','2023-01-26','Infection'),(6,6,'ECG','2023-02-02','Irregular heartbeat'),(7,7,'Blood Test','2023-02-06','Normal'),(8,8,'X-Ray','2023-02-11','Fracture detected'),(9,9,'MRI','2023-02-13','Normal'),(10,10,'CT Scan','2023-02-17','Swelling'),(11,11,'Urine Test','2023-02-22','Infection'),(12,12,'ECG','2023-02-25','Normal'),(13,13,'Blood Test','2023-03-02','Normal'),(14,14,'X-Ray','2023-03-06','Fracture'),(15,15,'MRI','2023-03-11','Normal'),(16,16,'CT Scan','2023-03-16','Swelling'),(17,17,'Urine Test','2023-03-20','Infection'),(18,18,'ECG','2023-03-25','Normal'),(19,19,'Blood Test','2023-04-02','Abnormal'),(20,20,'X-Ray','2023-04-06','Fracture detected');
/*!40000 ALTER TABLE `diagnostictest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `doctor_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `specialization` varchar(100) DEFAULT NULL,
  `contact_no` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`doctor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (1,'Dr. Anil Mehra','Cardiology','9876543210','anil@hospital.com'),(2,'Dr. Kavita Sharma','Pediatrics','9876543211','kavita@hospital.com'),(3,'Dr. Rajesh Khanna','Neurology','9876543212','rajesh@hospital.com'),(4,'Dr. Sneha Patil','Orthopedics','9876543213','sneha@hospital.com'),(5,'Dr. Arjun Reddy','General Medicine','9876543214','arjun@hospital.com'),(6,'Dr. Isha Roy','ENT','9876543215','isha@hospital.com'),(7,'Dr. Manish Taneja','Dermatology','9876543216','manish@hospital.com'),(8,'Dr. Jyoti Nanda','Psychiatry','9876543217','jyoti@hospital.com'),(9,'Dr. Suresh Pillai','Oncology','9876543218','suresh@hospital.com'),(10,'Dr. Leena Dsouza','Ophthalmology','9876543219','leena@hospital.com'),(11,'Dr. Ajay Chauhan','Cardiology','9876543220','ajay@hospital.com'),(12,'Dr. Rina Shah','Pediatrics','9876543221','rina@hospital.com'),(13,'Dr. Vipin Tomar','Neurology','9876543222','vipin@hospital.com'),(14,'Dr. Shweta Rao','Orthopedics','9876543223','shweta@hospital.com'),(15,'Dr. Mohit Agarwal','General Medicine','9876543224','mohit@hospital.com'),(16,'Dr. Rachna Verma','ENT','9876543225','rachna@hospital.com'),(17,'Dr. Kunal Das','Dermatology','9876543226','kunal@hospital.com'),(18,'Dr. Parul Joshi','Psychiatry','9876543227','parul@hospital.com'),(19,'Dr. Deepika Yadav','Ophthalmology','9876543228','deepika@hospital.com'),(20,'Dr. Naveen Batra','Oncology','9876543229','naveen@hospital.com');
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encounter`
--

DROP TABLE IF EXISTS `encounter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `encounter` (
  `encounter_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int DEFAULT NULL,
  `doctor_id` int DEFAULT NULL,
  `encounter_date` date DEFAULT NULL,
  `encounter_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`encounter_id`),
  KEY `patient_id` (`patient_id`),
  KEY `doctor_id` (`doctor_id`),
  CONSTRAINT `encounter_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`),
  CONSTRAINT `encounter_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`doctor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encounter`
--

LOCK TABLES `encounter` WRITE;
/*!40000 ALTER TABLE `encounter` DISABLE KEYS */;
INSERT INTO `encounter` VALUES (1,1,1,'2023-01-10','Consultation'),(2,2,2,'2023-01-12','Follow-up'),(3,3,3,'2023-01-15','Emergency'),(4,4,4,'2023-01-20','Consultation'),(5,5,5,'2023-01-25','Routine Checkup'),(6,6,6,'2023-02-01','Consultation'),(7,7,7,'2023-02-05','Follow-up'),(8,8,8,'2023-02-10','Emergency'),(9,9,9,'2023-02-12','Consultation'),(10,10,10,'2023-02-15','Routine Checkup'),(11,11,11,'2023-02-18','Consultation'),(12,12,12,'2023-02-20','Emergency'),(13,13,13,'2023-03-01','Follow-up'),(14,14,14,'2023-03-05','Routine Checkup'),(15,15,15,'2023-03-10','Consultation'),(16,16,16,'2023-03-15','Emergency'),(17,17,17,'2023-03-20','Consultation'),(18,18,18,'2023-03-25','Routine Checkup'),(19,19,19,'2023-04-01','Consultation'),(20,20,20,'2023-04-05','Follow-up');
/*!40000 ALTER TABLE `encounter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicalhistory`
--

DROP TABLE IF EXISTS `medicalhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicalhistory` (
  `history_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int DEFAULT NULL,
  `diagnosis` varchar(200) DEFAULT NULL,
  `allergies` varchar(200) DEFAULT NULL,
  `medications` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `patient_id` (`patient_id`),
  CONSTRAINT `medicalhistory_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicalhistory`
--

LOCK TABLES `medicalhistory` WRITE;
/*!40000 ALTER TABLE `medicalhistory` DISABLE KEYS */;
INSERT INTO `medicalhistory` VALUES (1,1,'Diabetes Type 2','Peanuts','Metformin'),(2,2,'Hypertension','Pollen','Amlodipine'),(3,3,'Asthma','Dust','Salbutamol'),(4,4,'Migraine','None','Paracetamol'),(5,5,'Thyroid Disorder','Seafood','Levothyroxine'),(6,6,'Arthritis','Penicillin','Ibuprofen'),(7,7,'Gastritis','None','Omeprazole'),(8,8,'Allergy Skin Rash','Cats','Antihistamine'),(9,9,'High Cholesterol','None','Statins'),(10,10,'Back Pain','Latex','Muscle Relaxants'),(11,11,'Depression','None','SSRIs'),(12,12,'Anxiety','None','Benzodiazepines'),(13,13,'Bronchitis','Dust','Bronchodilators'),(14,14,'Eczema','None','Steroid Cream'),(15,15,'Seasonal Allergy','Pollen','Loratadine'),(16,16,'UTI','None','Antibiotics'),(17,17,'Obesity','None','Diet Plan'),(18,18,'Sleep Disorder','None','Melatonin'),(19,19,'Anemia','Iron','Iron Supplements'),(20,20,'Kidney Stone','Shellfish','Painkillers');
/*!40000 ALTER TABLE `medicalhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `patient_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `contact_no` varchar(15) DEFAULT NULL,
  `insurance` varchar(10) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,'Ravi Kumar','9123456780','Yes','1990-05-15','Male','Delhi'),(2,'Priya Singh','9123456781','No','1995-08-20','Female','Mumbai'),(3,'Amit Verma','9123456782','Yes','1988-03-10','Male','Bangalore'),(4,'Neha Gupta','9123456783','No','1992-12-01','Female','Chennai'),(5,'Rahul Yadav','9123456784','Yes','1985-07-07','Male','Lucknow'),(6,'Anjali Nair','9123456785','No','1997-11-25','Female','Kochi'),(7,'Sunil Rao','9123456786','Yes','1993-04-18','Male','Hyderabad'),(8,'Meena Joshi','9123456787','No','1998-09-12','Female','Pune'),(9,'Vikram Das','9123456788','Yes','1989-01-22','Male','Kolkata'),(10,'Sneha Reddy','9123456789','No','1991-06-30','Female','Jaipur'),(11,'Karan Mehta','9123456790','Yes','1987-04-11','Male','Ahmedabad'),(12,'Pooja Sharma','9123456791','No','1996-03-08','Female','Nagpur'),(13,'Arjun Patel','9123456792','Yes','1994-07-21','Male','Surat'),(14,'Divya Kapoor','9123456793','No','1993-10-05','Female','Indore'),(15,'Nikhil Jain','9123456794','Yes','1986-12-15','Male','Patna'),(16,'Ritu Agarwal','9123456795','No','1990-02-18','Female','Bhopal'),(17,'Harshita Bansal','9123456796','Yes','1992-09-19','Female','Ranchi'),(18,'Manoj Tiwari','9123456797','No','1984-08-01','Male','Kanpur'),(19,'Simran Kaur','9123456798','Yes','1999-01-09','Female','Amritsar'),(20,'Deepak Sinha','9123456799','No','1983-05-20','Male','Guwahati');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescription`
--

DROP TABLE IF EXISTS `prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescription` (
  `prescription_id` int NOT NULL AUTO_INCREMENT,
  `encounter_id` int DEFAULT NULL,
  `frequency` int DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `medicine_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`prescription_id`),
  KEY `encounter_id` (`encounter_id`),
  CONSTRAINT `prescription_ibfk_1` FOREIGN KEY (`encounter_id`) REFERENCES `encounter` (`encounter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescription`
--

LOCK TABLES `prescription` WRITE;
/*!40000 ALTER TABLE `prescription` DISABLE KEYS */;
INSERT INTO `prescription` VALUES (1,1,1,'2025-09-01','2025-09-07','Paracetamol'),(2,2,2,'2025-09-02','2025-09-08','Amoxicillin'),(3,3,1,'2025-09-03','2025-09-09','Cetrizine'),(4,4,1,'2025-09-04','2025-09-10','Rantac'),(5,5,3,'2025-09-05','2025-09-11','Azithromycin'),(6,6,1,'2025-09-06','2025-09-12','Dolo 650'),(7,7,2,'2025-09-07','2025-09-13','Crocin'),(8,8,1,'2025-09-08','2025-09-14','Metformin'),(9,9,1,'2025-09-09','2025-09-15','Ecosprin'),(10,10,1,'2025-09-10','2025-09-16','Zincovit'),(11,11,2,'2025-09-11','2025-09-17','Augmentin'),(12,12,1,'2025-09-12','2025-09-18','Pantop D'),(13,13,3,'2025-09-13','2025-09-19','Spasmo Proxyvon'),(14,14,1,'2025-09-14','2025-09-20','Calpol'),(15,15,2,'2025-09-15','2025-09-21','Levocet'),(16,16,1,'2025-09-16','2025-09-22','Lupizyme'),(17,17,1,'2025-09-17','2025-09-23','Rablet D'),(18,18,2,'2025-09-18','2025-09-24','Betadine'),(19,19,1,'2025-09-19','2025-09-25','Flexon'),(20,20,1,'2025-09-20','2025-09-26','Becosules');
/*!40000 ALTER TABLE `prescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proceduree`
--

DROP TABLE IF EXISTS `proceduree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proceduree` (
  `procedure_id` int NOT NULL AUTO_INCREMENT,
  `encounter_id` int DEFAULT NULL,
  `procedure_name` varchar(100) DEFAULT NULL,
  `procedure_date` date DEFAULT NULL,
  `procedure_outcome` text,
  PRIMARY KEY (`procedure_id`),
  KEY `encounter_id` (`encounter_id`),
  CONSTRAINT `proceduree_ibfk_1` FOREIGN KEY (`encounter_id`) REFERENCES `encounter` (`encounter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proceduree`
--

LOCK TABLES `proceduree` WRITE;
/*!40000 ALTER TABLE `proceduree` DISABLE KEYS */;
INSERT INTO `proceduree` VALUES (1,1,'Fracture Fix','2023-01-14','Successful'),(2,2,'Brain Scan','2023-01-17','No issues found'),(3,3,'General Checkup','2023-01-27','Healthy'),(4,4,'Cardiac Monitoring','2023-02-03','Requires further testing'),(5,5,'Fracture Fix','2023-02-08','Successful'),(6,6,'Brain Scan','2023-02-11','No issues'),(7,7,'General Checkup','2023-02-15','Healthy'),(8,8,'Cardiac Monitoring','2023-02-20','Further tests'),(9,9,'Fracture Fix','2023-03-01','Successful'),(10,10,'Brain Scan','2023-03-05','Normal'),(11,11,'General Checkup','2023-03-10','Healthy'),(12,12,'Cardiac Monitoring','2023-03-14','Requires follow up'),(13,13,'Fracture Fix','2023-03-20','Successful'),(14,14,'Brain Scan','2023-03-25','Normal'),(15,15,'General Checkup','2023-04-01','Healthy'),(16,16,'Cardiac Monitoring','2023-04-05','Further tests'),(17,17,'Fracture Fix','2023-04-10','Successful'),(18,18,'Brain Scan','2023-04-14','Normal'),(19,19,'General Checkup','2023-04-18','Healthy'),(20,20,'Cardiac Monitoring','2023-04-22','Requires tests');
/*!40000 ALTER TABLE `proceduree` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-12 18:18:22
