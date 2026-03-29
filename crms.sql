-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 29, 2026 at 09:50 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `crms`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `active_cases`
-- (See below for the actual view)
--
CREATE TABLE `active_cases` (
`fir_id` int(11)
,`date` date
,`crime_type` varchar(100)
,`location` varchar(200)
,`status` varchar(50)
,`victim_name` varchar(100)
,`officer_name` varchar(100)
,`officer_rank` varchar(50)
);

-- --------------------------------------------------------

--
-- Table structure for table `court_case`
--

CREATE TABLE `court_case` (
  `case_id` int(11) NOT NULL,
  `fir_id` int(11) DEFAULT NULL,
  `judge_name` varchar(100) DEFAULT NULL,
  `lawyer_name` varchar(100) DEFAULT NULL,
  `hearing_date` date DEFAULT NULL,
  `verdict` varchar(50) DEFAULT NULL,
  `sentence` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `court_case`
--

INSERT INTO `court_case` (`case_id`, `fir_id`, `judge_name`, `lawyer_name`, `hearing_date`, `verdict`, `sentence`) VALUES
(1, 1, 'Justice Kulwant Singh Dhaliwal', 'Adv. Tejinder Pal Singh', '2024-03-10', 'Guilty', '5 years rigorous imprisonment'),
(2, 2, 'Justice Amarjit Kaur Sidhu', 'Adv. Ravinder Sharma', '2024-03-20', 'Guilty', '3 years rigorous imprisonment'),
(3, 3, 'Justice Ramnarayan Tripathi', 'Adv. Dinesh Prasad Shukla', '2024-04-05', 'Pending', NULL),
(4, 4, 'Justice Savitri Devi Pathak', 'Adv. Mahesh Kumar Bajpai', '2024-04-15', 'Guilty', '1 year imprisonment and fine'),
(5, 5, 'Justice Shiv Prasad Tripathi', 'Adv. Ramakant Pandey', '2024-05-10', 'Guilty', '4 years rigorous imprisonment'),
(6, 6, 'Justice Meera Devi Shukla', 'Adv. Suresh Babu Tiwari', '2024-06-20', 'Pending', NULL),
(7, 7, 'Justice Anil Kumar Sharma', 'Adv. Deepak Joshi', '2024-05-25', 'Guilty', '3 years and 50000 fine'),
(8, 8, 'Justice Sunita Rani Gupta', 'Adv. Mahesh Soni', '2024-07-15', 'Pending', NULL),
(9, 9, 'Justice Ramesh Chandra Jain', 'Adv. Vikram Singh Tomar', '2024-08-10', 'Pending', NULL),
(10, 10, 'Justice Pushpa Devi Malviya', 'Adv. Naresh Kumar Sharma', '2024-06-05', 'Guilty', '2 years and 5 lakh fine'),
(11, 11, 'Justice Amit Kumar Sinha', 'Adv. Rajesh Prasad', '2024-05-20', 'Guilty', '6 years rigorous imprisonment'),
(12, 12, 'Justice Priya Rani Das', 'Adv. Sunil Kumar Verma', '2024-07-25', 'Pending', NULL),
(13, 13, 'Justice Suresh Narayan Joshi', 'Adv. Prakash Chand', '2024-06-15', 'Guilty', '2 years imprisonment'),
(14, 14, 'Justice Vandana Devi Deshmukh', 'Adv. Ramesh Bhalerao', '2024-08-20', 'Pending', NULL),
(15, 15, 'Justice Rohit Kumar Gupta', 'Adv. Santosh Patel', '2024-07-10', 'Guilty', '3 years and 10 lakh fine'),
(16, 16, 'Justice Kavita Rani Jain', 'Adv. Deepak Malviya', '2024-09-05', 'Pending', NULL),
(17, 17, 'Justice Manoj Kumar Singh', 'Adv. Raju Agarwal', '2024-06-25', 'Guilty', '4 years rigorous imprisonment'),
(18, 18, 'Justice Shashi Bala Tiwari', 'Adv. Vinod Kumar', '2024-09-15', 'Pending', NULL),
(19, 19, 'Justice Ajay Prasad Mishra', 'Adv. Suresh Kanojia', '2024-08-05', 'Pending', NULL),
(20, 20, 'Justice Nirmala Devi Singh', 'Adv. Ramesh Srivastava', '2024-07-20', 'Guilty', '4 years and 8 lakh fine'),
(21, 21, 'Justice Bhupendra Rao', 'Adv. Mohan Tyagi', '2024-08-30', 'Pending', NULL),
(22, 22, 'Justice Kamla Devi Sharma', 'Adv. Pappu Singh', '2024-09-20', 'Pending', NULL),
(23, 23, 'Justice Naresh Chand Pandey', 'Adv. Shyam Babu', '2024-07-30', 'Guilty', '1 year imprisonment'),
(24, 24, 'Justice Pushpa Rani Dwivedi', 'Adv. Hari Shankar', '2024-08-15', 'Guilty', '10 years rigorous imprisonment'),
(25, 25, 'Justice Mahaveer Singh Bhati', 'Adv. Bharat Singh', '2024-09-25', 'Pending', NULL),
(26, 26, 'Justice Rughnath Prasad', 'Adv. Rughnath Vaishnav', '2024-10-05', 'Pending', NULL),
(27, 27, 'Justice Jarnail Singh Walia', 'Adv. Kuldeep Cheema', '2024-09-10', 'Pending', NULL),
(28, 28, 'Justice Kulwinder Kaur', 'Adv. Harjinder Singh', '2024-10-15', 'Pending', NULL),
(29, 29, 'Justice Ramjan Ali', 'Adv. Deepak Sharma', '2024-10-01', 'Pending', NULL),
(30, 30, 'Justice Asha Rani Gupta', 'Adv. Chhote Lal', '2024-09-05', 'Guilty', '6 months and fine'),
(31, 31, 'Justice Chhote Lal Mishra', 'Adv. Mamta Devi', '2024-10-20', 'Pending', NULL),
(32, 32, 'Justice Mamta Singh Yadav', 'Adv. Ghanshyam Das', '2024-10-25', 'Pending', NULL),
(33, 33, 'Justice Ghanshyam Purohit', 'Adv. Usha Rani', '2024-11-01', 'Pending', NULL),
(34, 34, 'Justice Usha Devi Agarwal', 'Adv. Trilok Chand', '2024-10-10', 'Guilty', '7 years rigorous imprisonment'),
(35, 35, 'Justice Trilok Nath Sharma', 'Adv. Vinod Bajpai', '2024-11-05', 'Pending', NULL);

--
-- Triggers `court_case`
--
DELIMITER $$
CREATE TRIGGER `close_fir_on_verdict` AFTER UPDATE ON `court_case` FOR EACH ROW BEGIN
    IF NEW.verdict IS NOT NULL AND NEW.verdict != 'Pending' THEN
        UPDATE FIR 
        SET status = 'Closed'
        WHERE fir_id = NEW.fir_id;
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_criminal_status` AFTER UPDATE ON `court_case` FOR EACH ROW BEGIN
    IF NEW.verdict = 'Guilty' THEN
        UPDATE Criminal 
        SET status = 'Convicted'
        WHERE criminal_id IN (
            SELECT criminal_id FROM Crime 
            WHERE fir_id = NEW.fir_id
        );
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `crime`
--

CREATE TABLE `crime` (
  `crime_id` int(11) NOT NULL,
  `fir_id` int(11) DEFAULT NULL,
  `criminal_id` int(11) DEFAULT NULL,
  `crime_type` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `location` varchar(200) DEFAULT NULL,
  `severity` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `crime`
--

INSERT INTO `crime` (`crime_id`, `fir_id`, `criminal_id`, `crime_type`, `date`, `location`, `severity`) VALUES
(1, 1, 1, 'Robbery', '2024-01-05', 'Hall Bazaar Amritsar', 'High'),
(2, 2, 2, 'Assault', '2024-01-12', 'Sarabha Nagar Ludhiana', 'Medium'),
(3, 3, 3, 'Theft', '2024-01-20', 'Hazratganj Lucknow', 'Low'),
(4, 4, 4, 'Eve Teasing', '2024-01-28', 'Connaught Place Delhi', 'Medium'),
(5, 5, 5, 'Robbery', '2024-02-03', 'Dashashwamedh Ghat Varanasi', 'High'),
(6, 6, 6, 'Drug Trafficking', '2024-02-10', 'Lanka Varanasi', 'High'),
(7, 7, 7, 'Burglary', '2024-02-18', 'Bapu Nagar Jaipur', 'High'),
(8, 8, 8, 'Kidnapping', '2024-02-25', 'Malviya Nagar Jaipur', 'High'),
(9, 9, 9, 'Murder', '2024-03-02', 'Arera Colony Bhopal', 'High'),
(10, 10, 10, 'Fraud', '2024-03-10', 'Govindpura Bhopal', 'Medium'),
(11, 11, 11, 'Robbery', '2024-03-18', 'Boring Road Patna', 'High'),
(12, 12, 12, 'Assault', '2024-03-25', 'Kankarbagh Patna', 'Medium'),
(13, 13, 13, 'Theft', '2024-04-02', 'Dharampeth Nagpur', 'Medium'),
(14, 14, 14, 'Murder', '2024-04-09', 'Sitabuldi Nagpur', 'High'),
(15, 15, 15, 'Fraud', '2024-04-15', 'Vijay Nagar Indore', 'Medium'),
(16, 16, 16, 'Cybercrime', '2024-04-22', 'Palasia Indore', 'Low'),
(17, 17, 17, 'Robbery', '2024-04-28', 'Taj Ganj Agra', 'High'),
(18, 18, 18, 'Murder', '2024-05-05', 'Shahganj Agra', 'High'),
(19, 19, 19, 'Kidnapping', '2024-05-12', 'Harsh Nagar Kanpur', 'High'),
(20, 20, 20, 'Fraud', '2024-05-19', 'Civil Lines Kanpur', 'Medium'),
(21, 21, 21, 'Assault', '2024-05-25', 'Shastri Nagar Meerut', 'Medium'),
(22, 22, 22, 'Robbery', '2024-06-01', 'Brahmpuri Meerut', 'High'),
(23, 23, 23, 'Theft', '2024-06-08', 'Mumfordganj Prayagraj', 'Low'),
(24, 24, 24, 'Drug Trafficking', '2024-06-15', 'Tagore Town Prayagraj', 'High'),
(25, 25, 25, 'Burglary', '2024-06-22', 'Paota Jodhpur', 'Medium'),
(26, 26, 26, 'Assault', '2024-06-29', 'Ratanada Jodhpur', 'Medium'),
(27, 27, 27, 'Drug Trafficking', '2024-07-05', 'Lawrence Road Amritsar', 'High'),
(28, 28, 28, 'Cybercrime', '2024-07-12', 'Model Town Ludhiana', 'Low'),
(29, 29, 29, 'Kidnapping', '2024-07-18', 'Gomti Nagar Lucknow', 'High'),
(30, 30, 30, 'Eve Teasing', '2024-07-25', 'Rohini Delhi', 'Medium'),
(31, 31, 31, 'Theft', '2024-08-02', 'Sigra Varanasi', 'Low'),
(32, 32, 32, 'Fraud', '2024-08-10', 'Nadesar Varanasi', 'Medium'),
(33, 33, 33, 'Murder', '2024-08-18', 'Raja Park Jaipur', 'High'),
(34, 34, 34, 'Robbery', '2024-08-25', 'Mansarovar Jaipur', 'High'),
(35, 35, 35, 'Assault', '2024-09-01', 'Shahpura Bhopal', 'Medium'),
(36, 6, 5, 'Possession', '2024-02-10', 'Lanka Varanasi', 'Medium'),
(37, 9, 3, 'Extortion', '2024-03-02', 'Arera Colony Bhopal', 'High'),
(38, 14, 9, 'Assault', '2024-04-09', 'Sitabuldi Nagpur', 'High'),
(39, 22, 17, 'Assault', '2024-06-01', 'Brahmpuri Meerut', 'High'),
(40, 33, 8, 'Extortion', '2024-08-18', 'Raja Park Jaipur', 'High');

-- --------------------------------------------------------

--
-- Table structure for table `criminal`
--

CREATE TABLE `criminal` (
  `criminal_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `fingerprint_id` varchar(50) DEFAULT NULL,
  `status` varchar(30) DEFAULT 'Under Investigation'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `criminal`
--

INSERT INTO `criminal` (`criminal_id`, `name`, `dob`, `gender`, `address`, `fingerprint_id`, `status`) VALUES
(1, 'Balwinder Singh Dhaliwal', '1988-03-15', 'Male', 'Majitha Road, Amritsar', 'FP20023', 'Convicted'),
(2, 'Ranjit Kumar Verma', '1983-11-20', 'Male', 'Pakhowal Road, Ludhiana', 'FP20045', 'Convicted'),
(3, 'Munna Lal Yadav', '1991-07-12', 'Male', 'Aminabad, Lucknow', 'FP30023', 'Wanted'),
(4, 'Chotu Ram Kashyap', '1986-04-18', 'Male', 'Paharganj, Delhi', 'FP30045', 'Arrested'),
(5, 'Bablu Yadav', '1992-06-14', 'Male', 'Sigra, Varanasi', 'FP50001', 'Arrested'),
(6, 'Chhotu Khan', '1989-09-25', 'Male', 'Madanpura, Varanasi', 'FP50002', 'Wanted'),
(7, 'Pappu Lal Meena', '1994-03-07', 'Male', 'Sanganer, Jaipur', 'FP50003', 'Arrested'),
(8, 'Ramu Kaka Rawat', '1980-12-30', 'Male', 'Chaksu, Jaipur', 'FP50004', 'Convicted'),
(9, 'Shankar Prasad Lodhi', '1987-07-19', 'Male', 'Berasia Road, Bhopal', 'FP50005', 'Wanted'),
(10, 'Guddu Bhaiya Patel', '1995-02-11', 'Male', 'Mandideep, Bhopal', 'FP50006', 'Arrested'),
(11, 'Dharmendra Kumar Sinha', '1990-05-23', 'Male', 'Rajendra Nagar, Patna', 'FP60001', 'Convicted'),
(12, 'Sonu Lal Paswan', '1993-08-17', 'Male', 'Phulwari Sharif, Patna', 'FP60002', 'Wanted'),
(13, 'Ramesh Ganpat Nikam', '1985-01-09', 'Male', 'Nandanvan, Nagpur', 'FP70001', 'Arrested'),
(14, 'Suresh Vitthal Bhalerao', '1988-11-14', 'Male', 'Kamptee, Nagpur', 'FP70002', 'Convicted'),
(15, 'Kailash Narayan Patel', '1991-04-28', 'Male', 'Lasudia, Indore', 'FP80001', 'Wanted'),
(16, 'Mohan Das Malviya', '1984-09-03', 'Male', 'Rajwada, Indore', 'FP80002', 'Arrested'),
(17, 'Pappu Singh Yadav', '1996-07-11', 'Male', 'Nunhai, Agra', 'FP90001', 'Arrested'),
(18, 'Ramveer Singh Tomar', '1982-02-25', 'Male', 'Bodla, Agra', 'FP90002', 'Wanted'),
(19, 'Kallu Prajapati', '1989-12-19', 'Male', 'Kakadeo, Kanpur', 'FP10101', 'Convicted'),
(20, 'Bunty Kumar Rajput', '1994-06-07', 'Male', 'Kidwai Nagar, Kanpur', 'FP10102', 'Arrested'),
(21, 'Gulshan Kumar Tyagi', '1987-03-14', 'Male', 'Mawana Road, Meerut', 'FP10201', 'Wanted'),
(22, 'Babban Singh Chauhan', '1992-10-30', 'Male', 'Hapur Road, Meerut', 'FP10202', 'Arrested'),
(23, 'Tinku Lal Pandey', '1990-08-22', 'Male', 'Atala, Prayagraj', 'FP10301', 'Convicted'),
(24, 'Guddu Yadav', '1986-05-16', 'Male', 'Naini, Prayagraj', 'FP10302', 'Wanted'),
(25, 'Mahaveer Singh Rajput', '1993-01-04', 'Male', 'Sojati Gate, Jodhpur', 'FP10401', 'Arrested'),
(26, 'Rughnath Das Vaishnav', '1981-07-28', 'Male', 'Chopasni Road, Jodhpur', 'FP10402', 'Convicted'),
(27, 'Jarnail Singh Walia', '1988-09-12', 'Male', 'Ranjit Avenue, Amritsar', 'FP20101', 'Wanted'),
(28, 'Kuldeep Singh Cheema', '1995-04-19', 'Male', 'Dugri, Ludhiana', 'FP20102', 'Arrested'),
(29, 'Ramjan Khan', '1983-06-25', 'Male', 'Wazirganj, Lucknow', 'FP30101', 'Convicted'),
(30, 'Deepak Sharma', '1991-11-08', 'Male', 'Trilokpuri, Delhi', 'FP30102', 'Wanted'),
(31, 'Chhote Lal Maurya', '1994-02-14', 'Male', 'Shivpur, Varanasi', 'FP50101', 'Arrested'),
(32, 'Akbar Khan', '1986-08-30', 'Male', 'Jaitpura, Jaipur', 'FP50201', 'Convicted'),
(33, 'Bhola Nath Mishra', '1989-05-17', 'Male', 'Berkhedi, Bhopal', 'FP50301', 'Wanted'),
(34, 'Raju Kumar Das', '1992-12-03', 'Male', 'Danapur, Patna', 'FP60101', 'Arrested'),
(35, 'Vitthal Rao Deshmukh', '1985-03-21', 'Male', 'Hingna, Nagpur', 'FP70101', 'Convicted');

-- --------------------------------------------------------

--
-- Table structure for table `evidence`
--

CREATE TABLE `evidence` (
  `evidence_id` int(11) NOT NULL,
  `crime_id` int(11) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `collected_date` date DEFAULT NULL,
  `officer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `evidence`
--

INSERT INTO `evidence` (`evidence_id`, `crime_id`, `type`, `description`, `collected_date`, `officer_id`) VALUES
(1, 1, 'CCTV Footage', 'Market camera footage showing accused', '2024-01-06', 1),
(2, 2, 'Medical Report', 'Victim injury certificate from Civil Hospital', '2024-01-13', 2),
(3, 3, 'Witness Statement', 'Eyewitness account of theft', '2024-01-21', 5),
(4, 4, 'CCTV Footage', 'Metro station camera footage', '2024-01-29', 17),
(5, 5, 'Witness Statement', 'Tourist guide witnessed robbery', '2024-02-04', 7),
(6, 6, 'Seized Drugs', '500gm heroin seized from accused', '2024-02-11', 8),
(7, 7, 'Fingerprints', 'Fingerprints on broken window pane', '2024-02-19', 9),
(8, 8, 'Phone Records', 'Ransom call recording', '2024-02-26', 10),
(9, 9, 'Forensic Report', 'Post mortem from Hamidia Hospital', '2024-03-03', 11),
(10, 10, 'Bank Records', 'Fake account transaction details', '2024-03-11', 12),
(11, 11, 'CCTV Footage', 'ATM camera footage of robbery', '2024-03-19', 13),
(12, 12, 'Medical Report', 'Victim injury report from PMCH', '2024-03-26', 14),
(13, 13, 'Fingerprints', 'Fingerprints on jewellery box', '2024-04-03', 15),
(14, 14, 'Forensic Report', 'Blood samples from crime scene', '2024-04-10', 16),
(15, 15, 'Digital Evidence', 'Bank transaction logs and emails', '2024-04-16', 29),
(16, 16, 'Digital Evidence', 'IP address and login records', '2024-04-23', 30),
(17, 17, 'Witness Statement', 'Tour guide witnessed robbery', '2024-04-29', 19),
(18, 18, 'Forensic Report', 'Post mortem and DNA report', '2024-05-06', 20),
(19, 19, 'Phone Records', 'Kidnappers phone location tracked', '2024-05-13', 21),
(20, 20, 'Bank Records', 'Loan documents and forged papers', '2024-05-20', 22),
(21, 21, 'Medical Report', 'Victim injury report', '2024-05-26', 23),
(22, 22, 'CCTV Footage', 'Shop camera footage of robbery', '2024-06-02', 24),
(23, 23, 'Fingerprints', 'Laptop bag fingerprints', '2024-06-09', 25),
(24, 24, 'Seized Drugs', '2kg cocaine seized from gang', '2024-06-16', 26),
(25, 25, 'Fingerprints', 'Temple lock fingerprints', '2024-06-23', 27),
(26, 26, 'Medical Report', 'Multiple injury reports', '2024-06-30', 28),
(27, 27, 'Seized Drugs', '5kg heroin from vehicle', '2024-07-06', 1),
(28, 28, 'Digital Evidence', 'Transaction logs and IP records', '2024-07-13', 4),
(29, 29, 'Phone Records', 'Ransom demand call recording', '2024-07-19', 5),
(30, 30, 'CCTV Footage', 'Park camera footage', '2024-07-26', 6),
(31, 31, 'Witness Statement', 'Temple priest witnessed snatching', '2024-08-03', 7),
(32, 32, 'Digital Evidence', 'Fake job website evidence', '2024-08-11', 8),
(33, 33, 'Forensic Report', 'DNA and blood report', '2024-08-19', 9),
(34, 34, 'CCTV Footage', 'Bank camera footage', '2024-08-26', 10),
(35, 35, 'Medical Report', 'Student injury report', '2024-09-02', 11),
(36, 36, 'Seized Drugs', 'Small quantity drugs seized', '2024-02-12', 8),
(37, 37, 'Witness Statement', 'Neighbour witnessed extortion', '2024-03-04', 11),
(38, 38, 'Forensic Report', 'Additional DNA evidence', '2024-04-11', 16),
(39, 39, 'CCTV Footage', 'Additional robbery footage', '2024-06-03', 24),
(40, 40, 'Phone Records', 'Extortion call recordings', '2024-08-20', 9);

-- --------------------------------------------------------

--
-- Table structure for table `fir`
--

CREATE TABLE `fir` (
  `fir_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time DEFAULT NULL,
  `location` varchar(200) DEFAULT NULL,
  `crime_type` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` varchar(50) DEFAULT 'Open',
  `victim_id` int(11) DEFAULT NULL,
  `officer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fir`
--

INSERT INTO `fir` (`fir_id`, `date`, `time`, `location`, `crime_type`, `description`, `status`, `victim_id`, `officer_id`) VALUES
(1, '2024-01-05', '10:30:00', 'Hall Bazaar, Amritsar', 'Robbery', 'Gold chain snatched near Hall Bazaar market', 'Closed', 1, 1),
(2, '2024-01-12', '18:00:00', 'Sarabha Nagar, Ludhiana', 'Assault', 'Physical assault outside dhaba', 'Closed', 2, 2),
(3, '2024-01-20', '08:15:00', 'Hazratganj, Lucknow', 'Theft', 'Mobile phone stolen from pocket', 'Under Investigation', 3, 5),
(4, '2024-01-28', '22:00:00', 'Connaught Place, Delhi', 'Eve Teasing', 'Girl harassed near metro station', 'Closed', 4, 17),
(5, '2024-02-03', '11:30:00', 'Dashashwamedh Ghat, Varanasi', 'Robbery', 'Tourist camera robbed near ghat', 'Closed', 5, 7),
(6, '2024-02-10', '19:45:00', 'Lanka, Varanasi', 'Drug Trafficking', 'Drug peddler caught near BHU', 'Under Investigation', 6, 8),
(7, '2024-02-18', '09:00:00', 'Bapu Nagar, Jaipur', 'Burglary', 'House burgled while family on vacation', 'Closed', 7, 9),
(8, '2024-02-25', '16:30:00', 'Malviya Nagar, Jaipur', 'Kidnapping', 'Businessman kidnapped for ransom', 'Under Investigation', 8, 10),
(9, '2024-03-02', '03:00:00', 'Arera Colony, Bhopal', 'Murder', 'Body found near park late night', 'Under Investigation', 9, 11),
(10, '2024-03-10', '14:00:00', 'Govindpura, Bhopal', 'Fraud', 'Fake property dealer fraud case', 'Closed', 10, 12),
(11, '2024-03-18', '20:00:00', 'Boring Road, Patna', 'Robbery', 'ATM robbery at night', 'Closed', 11, 13),
(12, '2024-03-25', '11:00:00', 'Kankarbagh, Patna', 'Assault', 'Neighbour dispute turned violent', 'Under Investigation', 12, 14),
(13, '2024-04-02', '15:30:00', 'Dharampeth, Nagpur', 'Theft', 'Gold jewellery stolen from house', 'Closed', 13, 15),
(14, '2024-04-09', '21:00:00', 'Sitabuldi, Nagpur', 'Murder', 'Shop owner found dead in shop', 'Under Investigation', 14, 16),
(15, '2024-04-15', '10:00:00', 'Vijay Nagar, Indore', 'Fraud', 'Online investment fraud of 5 lakhs', 'Closed', 15, 29),
(16, '2024-04-22', '17:00:00', 'Palasia, Indore', 'Cybercrime', 'Social media account hacked', 'Open', 16, 30),
(17, '2024-04-28', '08:00:00', 'Taj Ganj, Agra', 'Robbery', 'Tourist robbed near Taj Mahal', 'Closed', 17, 19),
(18, '2024-05-05', '23:00:00', 'Shahganj, Agra', 'Murder', 'Domestic violence murder case', 'Under Investigation', 18, 20),
(19, '2024-05-12', '13:00:00', 'Harsh Nagar, Kanpur', 'Kidnapping', 'Child kidnapped from school gate', 'Under Investigation', 19, 21),
(20, '2024-05-19', '16:00:00', 'Civil Lines, Kanpur', 'Fraud', 'Bank loan fraud case', 'Closed', 20, 22),
(21, '2024-05-25', '09:30:00', 'Shastri Nagar, Meerut', 'Assault', 'Road rage incident turned violent', 'Open', 21, 23),
(22, '2024-06-01', '20:30:00', 'Brahmpuri, Meerut', 'Robbery', 'Jewellery shop robbery at gunpoint', 'Under Investigation', 22, 24),
(23, '2024-06-08', '14:00:00', 'Mumfordganj, Prayagraj', 'Theft', 'Laptop stolen from office', 'Closed', 23, 25),
(24, '2024-06-15', '18:30:00', 'Tagore Town, Prayagraj', 'Drug Trafficking', 'Drug network busted', 'Closed', 24, 26),
(25, '2024-06-22', '11:00:00', 'Paota, Jodhpur', 'Burglary', 'Temple premises burgled', 'Open', 25, 27),
(26, '2024-06-29', '22:30:00', 'Ratanada, Jodhpur', 'Assault', 'Gang fight near bus stand', 'Under Investigation', 26, 28),
(27, '2024-07-05', '07:00:00', 'Lawrence Road, Amritsar', 'Drug Trafficking', 'Heroin seized from vehicle', 'Under Investigation', 27, 1),
(28, '2024-07-12', '15:00:00', 'Model Town, Ludhiana', 'Cybercrime', 'Online banking fraud reported', 'Open', 28, 4),
(29, '2024-07-18', '19:00:00', 'Gomti Nagar, Lucknow', 'Kidnapping', 'Businessmans wife kidnapped', 'Under Investigation', 29, 5),
(30, '2024-07-25', '21:00:00', 'Rohini, Delhi', 'Eve Teasing', 'Minor girl harassed near park', 'Closed', 30, 6),
(31, '2024-08-02', '10:00:00', 'Sigra, Varanasi', 'Theft', 'Purse snatching near temple', 'Open', 31, 7),
(32, '2024-08-10', '16:00:00', 'Nadesar, Varanasi', 'Fraud', 'Fake job offer fraud case', 'Under Investigation', 32, 8),
(33, '2024-08-18', '08:30:00', 'Raja Park, Jaipur', 'Murder', 'Honour killing case reported', 'Under Investigation', 33, 9),
(34, '2024-08-25', '13:30:00', 'Mansarovar, Jaipur', 'Robbery', 'Bank robbery attempted', 'Closed', 34, 10),
(35, '2024-09-01', '20:00:00', 'Shahpura, Bhopal', 'Assault', 'College student beaten by gang', 'Open', 35, 11),
(36, '2024-05-01', '09:00:00', 'CP Delhi', 'Theft', 'Laptop stolen', 'Open', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `officer`
--

CREATE TABLE `officer` (
  `officer_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `rank` varchar(50) DEFAULT NULL,
  `badge_no` varchar(20) DEFAULT NULL,
  `station_id` int(11) DEFAULT NULL,
  `contact` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `officer`
--

INSERT INTO `officer` (`officer_id`, `name`, `rank`, `badge_no`, `station_id`, `contact`) VALUES
(1, 'Gurpreet Singh Sandhu', 'Inspector', 'PB2001', 1, '9815600001'),
(2, 'Sukhwinder Kaur', 'Sub-Inspector', 'PB2002', 1, '9815600002'),
(3, 'Mandeep Singh Gill', 'Constable', 'PB2003', 2, '9815600003'),
(4, 'Harjit Singh Brar', 'Inspector', 'PB2004', 2, '9815600004'),
(5, 'Rajesh Kumar Sharma', 'Inspector', 'UP3001', 3, '9935600001'),
(6, 'Sunita Devi Mishra', 'Sub-Inspector', 'UP3002', 3, '9935600002'),
(7, 'Ramakant Tiwari', 'Inspector', 'UP3003', 5, '9415600001'),
(8, 'Savitri Devi Patel', 'Sub-Inspector', 'UP3004', 5, '9415600002'),
(9, 'Mohan Lal Verma', 'Inspector', 'RJ4001', 6, '9829600001'),
(10, 'Sunita Kumari Joshi', 'Sub-Inspector', 'RJ4002', 6, '9829600002'),
(11, 'Dinesh Prasad Shukla', 'Inspector', 'MP4001', 7, '9826600001'),
(12, 'Rekha Bai Malviya', 'Constable', 'MP4002', 7, '9826600002'),
(13, 'Amit Kumar Singh', 'Inspector', 'BR5001', 8, '9334600001'),
(14, 'Priya Kumari Sinha', 'Sub-Inspector', 'BR5002', 8, '9334600002'),
(15, 'Suresh Rambhau Deshmukh', 'Inspector', 'MH6001', 9, '9823600001'),
(16, 'Vandana Pramod Joshi', 'Sub-Inspector', 'MH6002', 9, '9823600002'),
(17, 'Vikram Singh Chauhan', 'Inspector', 'UP3005', 4, '9935600003'),
(18, 'Geeta Rani Pandey', 'Sub-Inspector', 'UP3006', 4, '9935600004'),
(19, 'Rohit Kumar Yadav', 'Constable', 'UP3007', 11, '9935600005'),
(20, 'Santosh Prasad Gupta', 'Inspector', 'UP3008', 11, '9935600006'),
(21, 'Deepak Narayan Tripathi', 'Inspector', 'UP3009', 12, '9935600007'),
(22, 'Kavita Devi Bajpai', 'Sub-Inspector', 'UP3010', 12, '9935600008'),
(23, 'Manoj Kumar Tomar', 'Inspector', 'UP3011', 13, '9935600009'),
(24, 'Shashi Bala Saxena', 'Constable', 'UP3012', 13, '9935600010'),
(25, 'Ajay Kumar Dubey', 'Inspector', 'UP3013', 14, '9935600011'),
(26, 'Nirmala Devi Shukla', 'Sub-Inspector', 'UP3014', 14, '9935600012'),
(27, 'Bhupendra Singh Rathore', 'Inspector', 'RJ4003', 15, '9829600003'),
(28, 'Kamla Devi Purohit', 'Sub-Inspector', 'RJ4004', 15, '9829600004'),
(29, 'Naresh Kumar Meena', 'Inspector', 'MP4003', 10, '9826600003'),
(30, 'Pushpa Bai Chouhan', 'Constable', 'MP4004', 10, '9826600004');

-- --------------------------------------------------------

--
-- Stand-in structure for view `officer_performance`
-- (See below for the actual view)
--
CREATE TABLE `officer_performance` (
`officer_id` int(11)
,`name` varchar(100)
,`rank` varchar(50)
,`station_name` varchar(100)
,`total_cases` bigint(21)
,`closed_cases` decimal(22,0)
,`active_cases` decimal(22,0)
,`resolution_rate` decimal(28,2)
);

-- --------------------------------------------------------

--
-- Table structure for table `station`
--

CREATE TABLE `station` (
  `station_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `district` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `contact` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `station`
--

INSERT INTO `station` (`station_id`, `name`, `district`, `state`, `contact`) VALUES
(1, 'Amritsar Sadar Thana', 'Amritsar', 'Punjab', '0183-2201234'),
(2, 'Ludhiana City Thana', 'Ludhiana', 'Punjab', '0161-2301234'),
(3, 'Hazratganj Kotwali', 'Lucknow', 'Uttar Pradesh', '0522-2201234'),
(4, 'Connaught Place Thana', 'New Delhi', 'Delhi', '011-2301234'),
(5, 'Varanasi Kotwali', 'Varanasi', 'Uttar Pradesh', '0542-2201234'),
(6, 'Jaipur Sadar Thana', 'Jaipur', 'Rajasthan', '0141-2301234'),
(7, 'Bhopal TT Nagar Thana', 'Bhopal', 'Madhya Pradesh', '0755-2401234'),
(8, 'Patna Sadar Thana', 'Patna', 'Bihar', '0612-2201234'),
(9, 'Nagpur Sitabuldi Thana', 'Nagpur', 'Maharashtra', '0712-2201234'),
(10, 'Indore Vijay Nagar Thana', 'Indore', 'Madhya Pradesh', '0731-2301234'),
(11, 'Agra Taj Ganj Thana', 'Agra', 'Uttar Pradesh', '0562-2201234'),
(12, 'Kanpur Kotwali', 'Kanpur', 'Uttar Pradesh', '0512-2301234'),
(13, 'Meerut Civil Lines Thana', 'Meerut', 'Uttar Pradesh', '0121-2401234'),
(14, 'Allahabad Kotwali', 'Prayagraj', 'Uttar Pradesh', '0532-2201234'),
(15, 'Jodhpur Sadar Thana', 'Jodhpur', 'Rajasthan', '0291-2301234');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role` varchar(20) NOT NULL,
  `officer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `role`, `officer_id`) VALUES
(1, 'admin', 'admin123', 'Admin', NULL),
(2, 'gurpreet', 'officer123', 'Officer', 1),
(3, 'sukhwinder', 'officer123', 'Officer', 2),
(4, 'rajesh', 'officer123', 'Officer', 5),
(5, 'ramakant', 'officer123', 'Officer', 7);

-- --------------------------------------------------------

--
-- Table structure for table `victim`
--

CREATE TABLE `victim` (
  `victim_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `contact` varchar(15) DEFAULT NULL,
  `address` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `victim`
--

INSERT INTO `victim` (`victim_id`, `name`, `age`, `gender`, `contact`, `address`) VALUES
(1, 'Arjun Sharma', 32, 'Male', '9815611111', 'Guru Nanak Nagar, Amritsar'),
(2, 'Simranjit Kaur', 27, 'Female', '9815622222', 'Civil Lines, Ludhiana'),
(3, 'Ramesh Prasad Gupta', 45, 'Male', '9935611111', 'Vikas Nagar, Lucknow'),
(4, 'Kavita Devi Tiwari', 29, 'Female', '9935622222', 'Lajpat Nagar, Delhi'),
(5, 'Suresh Prasad Mishra', 52, 'Male', '9415611111', 'Dashashwamedh Ghat, Varanasi'),
(6, 'Anjali Devi Sharma', 23, 'Female', '9415622222', 'Lanka, Varanasi'),
(7, 'Ramesh Chand Gupta', 38, 'Male', '9829611111', 'Bapu Nagar, Jaipur'),
(8, 'Pooja Rani Agarwal', 19, 'Female', '9829622222', 'Malviya Nagar, Jaipur'),
(9, 'Mahesh Kumar Dubey', 61, 'Male', '9826611111', 'Arera Colony, Bhopal'),
(10, 'Kamla Bai Yadav', 44, 'Female', '9826622222', 'Govindpura, Bhopal'),
(11, 'Rajan Kumar Sinha', 35, 'Male', '9334611111', 'Boring Road, Patna'),
(12, 'Meena Devi Prasad', 41, 'Female', '9334622222', 'Kankarbagh, Patna'),
(13, 'Ganesh Rambhau Kulkarni', 28, 'Male', '9823611111', 'Dharampeth, Nagpur'),
(14, 'Sujata Pramod Deshpande', 33, 'Female', '9823622222', 'Sitabuldi, Nagpur'),
(15, 'Prakash Narayan Joshi', 55, 'Male', '9731611111', 'Vijay Nagar, Indore'),
(16, 'Sunita Bai Patidar', 48, 'Female', '9731622222', 'Palasia, Indore'),
(17, 'Mukesh Kumar Bansal', 42, 'Male', '9562611111', 'Taj Ganj, Agra'),
(18, 'Rekha Devi Agarwal', 31, 'Female', '9562622222', 'Shahganj, Agra'),
(19, 'Shyam Lal Kanojia', 25, 'Male', '9512611111', 'Harsh Nagar, Kanpur'),
(20, 'Radha Rani Srivastava', 36, 'Female', '9512622222', 'Civil Lines, Kanpur'),
(21, 'Prem Chand Tyagi', 58, 'Male', '9121611111', 'Shastri Nagar, Meerut'),
(22, 'Savita Devi Sharma', 22, 'Female', '9121622222', 'Brahmpuri, Meerut'),
(23, 'Hari Shankar Pandey', 47, 'Male', '9532611111', 'Mumfordganj, Prayagraj'),
(24, 'Geeta Devi Dwivedi', 39, 'Female', '9532622222', 'Tagore Town, Prayagraj'),
(25, 'Bharat Singh Bhati', 43, 'Male', '9291611111', 'Paota, Jodhpur'),
(26, 'Sunita Kanwar Rathore', 26, 'Female', '9291622222', 'Ratanada, Jodhpur'),
(27, 'Naresh Kumar Agarwal', 50, 'Male', '9815633333', 'Lawrence Road, Amritsar'),
(28, 'Harpreet Kaur Walia', 34, 'Female', '9815644444', 'Model Town, Ludhiana'),
(29, 'Devendra Nath Mishra', 63, 'Male', '9935633333', 'Gomti Nagar, Lucknow'),
(30, 'Asha Rani Verma', 18, 'Female', '9935644444', 'Rohini, Delhi'),
(31, 'Vinod Kumar Chaurasia', 37, 'Male', '9415633333', 'Sigra, Varanasi'),
(32, 'Mamta Devi Singh', 24, 'Female', '9415644444', 'Nadesar, Varanasi'),
(33, 'Ghanshyam Das Sharma', 56, 'Male', '9829633333', 'Raja Park, Jaipur'),
(34, 'Usha Rani Mehta', 30, 'Female', '9829644444', 'Mansarovar, Jaipur'),
(35, 'Trilok Chand Verma', 49, 'Male', '9826633333', 'Shahpura, Bhopal');

-- --------------------------------------------------------

--
-- Stand-in structure for view `wanted_criminals`
-- (See below for the actual view)
--
CREATE TABLE `wanted_criminals` (
`criminal_id` int(11)
,`name` varchar(100)
,`gender` varchar(10)
,`address` text
,`status` varchar(30)
,`crime_type` varchar(100)
,`crime_date` date
,`crime_location` varchar(200)
);

-- --------------------------------------------------------

--
-- Table structure for table `witness`
--

CREATE TABLE `witness` (
  `witness_id` int(11) NOT NULL,
  `crime_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `contact` varchar(15) DEFAULT NULL,
  `statement` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `witness`
--

INSERT INTO `witness` (`witness_id`, `crime_id`, `name`, `contact`, `statement`) VALUES
(1, 1, 'Harjinder Singh Bhatia', '9815633333', 'Saw accused running towards railway station'),
(2, 2, 'Parminder Kaur Grewal', '9815644444', 'Witnessed assault near dhaba on main road'),
(3, 3, 'Ramesh Babu Srivastava', '9935633333', 'Saw accused pick pocket in market'),
(4, 4, 'Geeta Rani Dubey', '9935644444', 'Witnessed harassment near metro station'),
(5, 5, 'Ramchandra Pandey', '9415633333', 'Tourist guide saw robbery near ghat'),
(6, 6, 'Priyanka Kumari Singh', '9415644444', 'Saw drug exchange near BHU gate'),
(7, 7, 'Shyam Lal Saini', '9829633333', 'Neighbour saw broken lock in morning'),
(8, 8, 'Rajkumar Meena', '9829644444', 'Auto driver saw victim being forced into car'),
(9, 9, 'Santosh Kumar Patel', '9826633333', 'Morning walker found body in park'),
(10, 10, 'Vinod Kumar Nayak', '9826644444', 'Victim introduced accused as property agent'),
(11, 11, 'Suresh Babu Sharma', '9334633333', 'Saw accused at ATM before robbery'),
(12, 12, 'Anita Devi Prasad', '9334644444', 'Heard fight from neighbouring house'),
(13, 13, 'Ganesh Rao Deshmukh', '9823633333', 'Saw accused near victims house'),
(14, 14, 'Sushma Bai Bhalerao', '9823644444', 'Shop neighbour found body in morning'),
(15, 15, 'Naresh Chand Joshi', '9731633333', 'Invested money on victims advice'),
(16, 16, 'Sunita Patidar', '9731644444', 'Saw accused using victims account'),
(17, 17, 'Ramu Lal Sharma', '9562633333', 'Tour guide saw robbery at Taj'),
(18, 18, 'Kamla Devi Singh', '9562644444', 'Neighbour heard screaming at night'),
(19, 19, 'Raju Kumar Prajapati', '9512633333', 'School guard saw unknown person near gate'),
(20, 20, 'Meena Bai Yadav', '9512644444', 'Bank employee noticed forged documents'),
(21, 21, 'Pappu Singh Chauhan', '9121633333', 'Witnessed road rage incident'),
(22, 22, 'Geeta Devi Tomar', '9121644444', 'Shop owner saw robbery from window'),
(23, 23, 'Shyam Babu Pandey', '9532633333', 'Office colleague noticed laptop missing'),
(24, 24, 'Radha Rani Mishra', '9532644444', 'Informer gave drug network details'),
(25, 25, 'Bhola Nath Rajput', '9291633333', 'Priest noticed break in early morning'),
(26, 26, 'Savita Devi Vaishnav', '9291644444', 'Shopkeeper witnessed gang fight'),
(27, 27, 'Jarnail Singh Randhawa', '9815655555', 'Saw suspicious vehicle near border'),
(28, 28, 'Kulwinder Kaur Dhaliwal', '9815666666', 'Bank manager confirmed fraud'),
(29, 29, 'Ramjan Ali Khan', '9935655555', 'Saw victim being forced into car'),
(30, 30, 'Asha Rani Sharma', '9935666666', 'Witnessed harassment in park'),
(31, 31, 'Chhote Lal Dubey', '9415655555', 'Saw accused snatch purse near temple'),
(32, 32, 'Mamta Devi Yadav', '9415666666', 'Victim friend received fake job offer too'),
(33, 33, 'Ghanshyam Das Purohit', '9829655555', 'Neighbour witnessed family dispute'),
(34, 34, 'Usha Rani Agarwal', '9829666666', 'Bank security guard saw robbery attempt'),
(35, 35, 'Trilok Nath Bajpai', '9826655555', 'College professor saw students being beaten');

-- --------------------------------------------------------

--
-- Structure for view `active_cases`
--
DROP TABLE IF EXISTS `active_cases`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `active_cases`  AS SELECT `f`.`fir_id` AS `fir_id`, `f`.`date` AS `date`, `f`.`crime_type` AS `crime_type`, `f`.`location` AS `location`, `f`.`status` AS `status`, `v`.`name` AS `victim_name`, `o`.`name` AS `officer_name`, `o`.`rank` AS `officer_rank` FROM ((`fir` `f` join `victim` `v` on(`f`.`victim_id` = `v`.`victim_id`)) join `officer` `o` on(`f`.`officer_id` = `o`.`officer_id`)) WHERE `f`.`status` <> 'Closed' ;

-- --------------------------------------------------------

--
-- Structure for view `officer_performance`
--
DROP TABLE IF EXISTS `officer_performance`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `officer_performance`  AS SELECT `o`.`officer_id` AS `officer_id`, `o`.`name` AS `name`, `o`.`rank` AS `rank`, `s`.`name` AS `station_name`, count(`f`.`fir_id`) AS `total_cases`, sum(case when `f`.`status` = 'Closed' then 1 else 0 end) AS `closed_cases`, sum(case when `f`.`status` <> 'Closed' then 1 else 0 end) AS `active_cases`, round(sum(case when `f`.`status` = 'Closed' then 1 else 0 end) / count(`f`.`fir_id`) * 100,2) AS `resolution_rate` FROM ((`officer` `o` join `station` `s` on(`o`.`station_id` = `s`.`station_id`)) left join `fir` `f` on(`o`.`officer_id` = `f`.`officer_id`)) GROUP BY `o`.`officer_id` ;

-- --------------------------------------------------------

--
-- Structure for view `wanted_criminals`
--
DROP TABLE IF EXISTS `wanted_criminals`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `wanted_criminals`  AS SELECT `c`.`criminal_id` AS `criminal_id`, `c`.`name` AS `name`, `c`.`gender` AS `gender`, `c`.`address` AS `address`, `c`.`status` AS `status`, `cr`.`crime_type` AS `crime_type`, `cr`.`date` AS `crime_date`, `cr`.`location` AS `crime_location` FROM (`criminal` `c` join `crime` `cr` on(`c`.`criminal_id` = `cr`.`criminal_id`)) WHERE `c`.`status` = 'Wanted' ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `court_case`
--
ALTER TABLE `court_case`
  ADD PRIMARY KEY (`case_id`),
  ADD KEY `fir_id` (`fir_id`);

--
-- Indexes for table `crime`
--
ALTER TABLE `crime`
  ADD PRIMARY KEY (`crime_id`),
  ADD KEY `fir_id` (`fir_id`),
  ADD KEY `criminal_id` (`criminal_id`);

--
-- Indexes for table `criminal`
--
ALTER TABLE `criminal`
  ADD PRIMARY KEY (`criminal_id`);

--
-- Indexes for table `evidence`
--
ALTER TABLE `evidence`
  ADD PRIMARY KEY (`evidence_id`),
  ADD KEY `crime_id` (`crime_id`),
  ADD KEY `officer_id` (`officer_id`);

--
-- Indexes for table `fir`
--
ALTER TABLE `fir`
  ADD PRIMARY KEY (`fir_id`),
  ADD KEY `victim_id` (`victim_id`),
  ADD KEY `officer_id` (`officer_id`);

--
-- Indexes for table `officer`
--
ALTER TABLE `officer`
  ADD PRIMARY KEY (`officer_id`),
  ADD UNIQUE KEY `badge_no` (`badge_no`),
  ADD KEY `station_id` (`station_id`);

--
-- Indexes for table `station`
--
ALTER TABLE `station`
  ADD PRIMARY KEY (`station_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `officer_id` (`officer_id`);

--
-- Indexes for table `victim`
--
ALTER TABLE `victim`
  ADD PRIMARY KEY (`victim_id`);

--
-- Indexes for table `witness`
--
ALTER TABLE `witness`
  ADD PRIMARY KEY (`witness_id`),
  ADD KEY `crime_id` (`crime_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `court_case`
--
ALTER TABLE `court_case`
  MODIFY `case_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `crime`
--
ALTER TABLE `crime`
  MODIFY `crime_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `criminal`
--
ALTER TABLE `criminal`
  MODIFY `criminal_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `evidence`
--
ALTER TABLE `evidence`
  MODIFY `evidence_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `fir`
--
ALTER TABLE `fir`
  MODIFY `fir_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `officer`
--
ALTER TABLE `officer`
  MODIFY `officer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `station`
--
ALTER TABLE `station`
  MODIFY `station_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `victim`
--
ALTER TABLE `victim`
  MODIFY `victim_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `witness`
--
ALTER TABLE `witness`
  MODIFY `witness_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `court_case`
--
ALTER TABLE `court_case`
  ADD CONSTRAINT `court_case_ibfk_1` FOREIGN KEY (`fir_id`) REFERENCES `fir` (`fir_id`);

--
-- Constraints for table `crime`
--
ALTER TABLE `crime`
  ADD CONSTRAINT `crime_ibfk_1` FOREIGN KEY (`fir_id`) REFERENCES `fir` (`fir_id`),
  ADD CONSTRAINT `crime_ibfk_2` FOREIGN KEY (`criminal_id`) REFERENCES `criminal` (`criminal_id`);

--
-- Constraints for table `evidence`
--
ALTER TABLE `evidence`
  ADD CONSTRAINT `evidence_ibfk_1` FOREIGN KEY (`crime_id`) REFERENCES `crime` (`crime_id`),
  ADD CONSTRAINT `evidence_ibfk_2` FOREIGN KEY (`officer_id`) REFERENCES `officer` (`officer_id`);

--
-- Constraints for table `fir`
--
ALTER TABLE `fir`
  ADD CONSTRAINT `fir_ibfk_1` FOREIGN KEY (`victim_id`) REFERENCES `victim` (`victim_id`),
  ADD CONSTRAINT `fir_ibfk_2` FOREIGN KEY (`officer_id`) REFERENCES `officer` (`officer_id`);

--
-- Constraints for table `officer`
--
ALTER TABLE `officer`
  ADD CONSTRAINT `officer_ibfk_1` FOREIGN KEY (`station_id`) REFERENCES `station` (`station_id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`officer_id`) REFERENCES `officer` (`officer_id`);

--
-- Constraints for table `witness`
--
ALTER TABLE `witness`
  ADD CONSTRAINT `witness_ibfk_1` FOREIGN KEY (`crime_id`) REFERENCES `crime` (`crime_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
