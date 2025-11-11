-- ================================================
-- MOVIE TICKET BOOKING DATABASE PROJECT
-- ================================================

--  start
DROP DATABASE IF EXISTS MovieBookingDB;
CREATE DATABASE MovieBookingDB;
USE MovieBookingDB;

-- ================================================
-- 1 MOVIE TABLE
-- ================================================
CREATE TABLE Movie (
  movie_id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(100),
  genre VARCHAR(50),
  duration INT,
  release_date DATE
);

-- ================================================
-- 2️ THEATER TABLE
-- ================================================
CREATE TABLE Theater (
  theater_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100),
  location VARCHAR(100),
  total_screens INT
);

-- ================================================
-- 3️ SCREEN TABLE
-- ================================================
CREATE TABLE Screen (
  screen_id INT PRIMARY KEY AUTO_INCREMENT,
  theater_id INT,
  screen_number INT,
  capacity INT,
  FOREIGN KEY (theater_id) REFERENCES Theater(theater_id)
);

-- ================================================
-- 4️ SHOWTIME TABLE
-- ================================================
CREATE TABLE Showtime (
  show_id INT PRIMARY KEY AUTO_INCREMENT,
  movie_id INT,
  screen_id INT,
  show_time DATETIME,
  ticket_price DECIMAL(6,2),
  FOREIGN KEY (movie_id) REFERENCES Movie(movie_id),
  FOREIGN KEY (screen_id) REFERENCES Screen(screen_id)
);

-- ================================================
-- 5️ CUSTOMER TABLE
-- ================================================
CREATE TABLE Customer (
  customer_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100),
  email VARCHAR(100),
  phone VARCHAR(15)
);

-- ================================================
-- 6️ BOOKING TABLE
-- ================================================
CREATE TABLE Booking (
  booking_id INT PRIMARY KEY AUTO_INCREMENT,
  customer_id INT,
  show_id INT,
  seats_booked INT,
  booking_date DATETIME,
  total_amount DECIMAL(8,2),
  FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
  FOREIGN KEY (show_id) REFERENCES Showtime(show_id)
);

-- ================================================
-- MOVIE DATA 
-- ================================================
INSERT INTO Movie (title, genre, duration, release_date) VALUES
('Jawan','Action',165,'2023-09-07'),
('Pathaan','Action',155,'2023-01-25'),
('RRR','Drama',180,'2022-03-25'),
('Chhichhore','Comedy',145,'2019-09-06'),
('Drishyam 2','Thriller',140,'2022-11-18'),
('3 Idiots','Comedy',160,'2009-12-25'),
('Gadar 2','Action',170,'2023-08-11'),
('Kantara','Mythological',150,'2022-09-30'),
('Dangal','Biography',161,'2016-12-23'),
('PK','Comedy',153,'2014-12-19'),
('Avengers: Endgame','Action',181,'2019-04-26'),
('Spider-Man: No Way Home','Action',148,'2021-12-17'),
('Bahubali: The Beginning','Action',159,'2015-07-10'),
('Bahubali 2: The Conclusion','Action',171,'2017-04-28'),
('KGF Chapter 1','Action',155,'2018-12-21'),
('KGF Chapter 2','Action',168,'2022-04-14'),
('Vikram','Action',154,'2022-06-03'),
('Sooryavanshi','Action',145,'2021-11-05'),
('War','Action',156,'2019-10-02'),
('Tiger Zinda Hai','Action',158,'2017-12-22'),
('Bajrangi Bhaijaan','Drama',163,'2015-07-17'),
('Andhadhun','Thriller',140,'2018-10-05'),
('Badhaai Ho','Comedy',124,'2018-10-18'),
('Kabir Singh','Romance',172,'2019-06-21'),
('Simmba','Action',149,'2018-12-28'),
('Zero','Romance',164,'2018-12-21'),
('Piku','Drama',123,'2015-05-08'),
('Raazi','Thriller',138,'2018-05-11'),
('Sanju','Biography',159,'2018-06-29'),
('Shershaah','Biography',135,'2021-08-12'),
('Dear Zindagi','Romance',135,'2016-11-25'),
('Queen','Drama',146,'2014-03-07'),
('Uri: The Surgical Strike','Action',138,'2019-01-11'),
('Tamasha','Romance',139,'2015-12-18'),
('Bhoot Part One: The Haunted Ship','Horror',131,'2020-02-21'),
('Stree','Horror',135,'2018-08-31'),
('Ludo','Comedy',155,'2020-11-12'),
('Tanhaji','Action',135,'2020-01-10'),
('Mission Mangal','Drama',127,'2019-08-15'),
('Raees','Action',143,'2017-01-25'),
('Zero Dark Thirty','Thriller',157,'2012-12-19'),
('Tenet','Action',150,'2020-08-26'),
('Inception','Sci-Fi',148,'2010-07-16'),
('Interstellar','Sci-Fi',169,'2014-11-07'),
('The Dark Knight','Action',152,'2008-07-18'),
('The Lion King','Animation',118,'2019-07-19'),
('Frozen 2','Animation',103,'2019-11-22'),
('Black Panther','Action',134,'2018-02-16'),
('Doctor Strange','Action',115,'2016-11-04'),
('Iron Man','Action',126,'2008-05-02'),
('Thor: Ragnarok','Action',130,'2017-11-03'),
('Hera Pheri','Comedy',156,'2000-03-31'),
('Phir Hera Pheri','Comedy',156,'2006-06-09'),
('Housefull','Comedy',145,'2010-04-30'),
('Housefull 2','Comedy',155,'2012-04-05'),
('Housefull 3','Comedy',140,'2016-06-03'),
('Housefull 4','Comedy',145,'2019-10-25'),
('Golmaal','Comedy',157,'2006-07-14'),
('Golmaal Returns','Comedy',156,'2008-10-29'),
('Golmaal 3','Comedy',155,'2010-11-05'),
('Golmaal Again','Comedy',147,'2017-10-20'),
('Singh Is King','Action',160,'2008-08-08'),
('Singh Is Bliing','Action',145,'2015-10-02'),
('Kick','Action',152,'2014-07-25'),
('Jab We Met','Romance',142,'2007-10-26'),
('Yeh Jawaani Hai Deewani','Romance',145,'2013-05-31'),
('Bajirao Mastani','Drama',158,'2015-12-18'),
('Padmaavat','Drama',163,'2018-01-25'),
('Ra.One','Action',156,'2011-10-26'),
('Chennai Express','Action',141,'2013-08-08'),
('Dilwale','Action',130,'2015-12-18'),
('Barfi!','Romance',151,'2012-09-14'),
('M.S. Dhoni: The Untold Story','Biography',184,'2016-09-30'),
('Sultan','Action',170,'2016-07-06'),
('Ek Tha Tiger','Action',133,'2012-08-15'),
('Kesari','Action',150,'2019-03-21'),
('Article 15','Thriller',116,'2019-06-28'),
('Thappad','Drama',133,'2020-02-28'),
('Bareilly Ki Barfi','Romance',120,'2017-08-18'),
('Pati Patni Aur Woh','Comedy',139,'2019-12-06'),
('Good Newwz','Comedy',156,'2019-12-27'),
('Bala','Comedy',128,'2019-11-07'),
('Leo','Action',145,'2023-10-05'),
('Avatar: The Way of Water','Action',192,'2022-12-16'),
('Black Adam','Action',125,'2022-10-21'),
('Doctor Strange in the Multiverse of Madness','Action',126,'2022-05-06'),
('Thor: Love and Thunder','Action',119,'2022-07-08'),
('Spider-Man: Across the Spider-Verse','Animation',140,'2023-06-02'),
('Guardians of the Galaxy Vol. 3','Action',150,'2023-05-05');


INSERT INTO Theater (name, location, total_screens) VALUES
('PVR Icon', 'Mumbai', 6),
('INOX Liberty', 'Mumbai', 5),
('Carnival Cinemas', 'Mumbai', 4),
('Cinepolis Mumbai', 'Mumbai', 7),
('City Gold Cinema', 'Mumbai', 5),
('PVR Saket', 'Delhi', 7),
('INOX Nehru Place', 'Delhi', 6),
('Carnival Delhi', 'Delhi', 5),
('Cinepolis Delhi', 'Delhi', 6),
('DT Cinemas', 'Delhi', 4),
('PVR Pune', 'Pune', 5),
('INOX Pune', 'Pune', 4),
('Carnival Pune', 'Pune', 3),
('Cinepolis Pune', 'Pune', 5),
('City Gold Pune', 'Pune', 4),
('PVR Forum', 'Bangalore', 6),
('INOX Bangalore', 'Bangalore', 5),
('Carnival Bangalore', 'Bangalore', 4),
('Cinepolis Bangalore', 'Bangalore', 6),
('Galaxy Cinemas', 'Bangalore', 5),
('PVR Hyderabad', 'Hyderabad', 5),
('INOX Hyderabad', 'Hyderabad', 4),
('Carnival Hyderabad', 'Hyderabad', 5),
('Cinepolis Hyderabad', 'Hyderabad', 4),
('City Gold Hyderabad', 'Hyderabad', 3),
('PVR Chennai', 'Chennai', 5),
('INOX Chennai', 'Chennai', 4),
('Carnival Chennai', 'Chennai', 4),
('Cinepolis Chennai', 'Chennai', 5),
('City Gold Chennai', 'Chennai', 3),
('PVR Kolkata', 'Kolkata', 6),
('INOX Kolkata', 'Kolkata', 5),
('Carnival Kolkata', 'Kolkata', 5),
('Cinepolis Kolkata', 'Kolkata', 4),
('Galaxy Kolkata', 'Kolkata', 4),
('PVR Ahmedabad', 'Ahmedabad', 5),
('INOX Ahmedabad', 'Ahmedabad', 4),
('Carnival Ahmedabad', 'Ahmedabad', 3),
('Cinepolis Ahmedabad', 'Ahmedabad', 4),
('City Gold Ahmedabad', 'Ahmedabad', 3),
('PVR Jaipur', 'Jaipur', 5),
('INOX Jaipur', 'Jaipur', 4),
('Carnival Jaipur', 'Jaipur', 4),
('Cinepolis Jaipur', 'Jaipur', 5),
('Galaxy Jaipur', 'Jaipur', 4),
('PVR Lucknow', 'Lucknow', 5),
('INOX Lucknow', 'Lucknow', 4),
('Carnival Lucknow', 'Lucknow', 4),
('Cinepolis Lucknow', 'Lucknow', 5),
('City Gold Lucknow', 'Lucknow', 3);


-- ================================================
-- 4️ SCREEN DATA (2–3 SCREENS PER THEATER)
-- ================================================
INSERT INTO Screen (theater_id, screen_number, capacity) VALUES
(1, 1, 250), (1, 2, 180), (1, 3, 220),
(2, 1, 200), (2, 2, 150),
(3, 1, 180), (3, 2, 220), (3, 3, 260),
(4, 1, 300), (4, 2, 250),
(5, 1, 180), (5, 2, 220),
(6, 1, 200), (6, 2, 180), (6, 3, 250),
(7, 1, 150), (7, 2, 200),
(8, 1, 230), (8, 2, 190), (8, 3, 240),
(9, 1, 180), (9, 2, 200),
(10, 1, 220), (10, 2, 180),
(11, 1, 250), (11, 2, 190),
(12, 1, 220), (12, 2, 200), (12, 3, 260),
(13, 1, 180), (13, 2, 210),
(14, 1, 230), (14, 2, 190),
(15, 1, 200), (15, 2, 180),
(16, 1, 220), (16, 2, 250), (16, 3, 270),
(17, 1, 240), (17, 2, 180),
(18, 1, 200), (18, 2, 230),
(19, 1, 180), (19, 2, 210),
(20, 1, 250), (20, 2, 220),
(21, 1, 190), (21, 2, 230),
(22, 1, 200), (22, 2, 180), (22, 3, 260),
(23, 1, 210), (23, 2, 250),
(24, 1, 200), (24, 2, 180),
(25, 1, 230), (25, 2, 190), (25, 3, 220),
(26, 1, 180), (26, 2, 240),
(27, 1, 200), (27, 2, 190),
(28, 1, 250), (28, 2, 180),
(29, 1, 190), (29, 2, 210),
(30, 1, 220), (30, 2, 180),
(31, 1, 250), (31, 2, 200),
(32, 1, 230), (32, 2, 180),
(33, 1, 200), (33, 2, 240),
(34, 1, 190), (34, 2, 220),
(35, 1, 180), (35, 2, 200), (35, 3, 260),
(36, 1, 210), (36, 2, 190),
(37, 1, 230), (37, 2, 180),
(38, 1, 250), (38, 2, 220),
(39, 1, 180), (39, 2, 210),
(40, 1, 200), (40, 2, 230),
(41, 1, 180), (41, 2, 250),
(42, 1, 220), (42, 2, 180),
(43, 1, 190), (43, 2, 210),
(44, 1, 200), (44, 2, 240),
(45, 1, 250), (45, 2, 190),
(46, 1, 230), (46, 2, 180),
(47, 1, 200), (47, 2, 220),
(48, 1, 240), (48, 2, 190),
(49, 1, 180), (49, 2, 200),
(50, 1, 210), (50, 2, 230);

-- ================================================
-- 5️ SHOWTIME DATA (15 ENTRIES)
-- ================================================
INSERT INTO Showtime (movie_id, screen_id, show_time, ticket_price) VALUES
(1, 1, '2025-11-11 10:00:00', 250.00),
(2, 4, '2025-11-11 13:00:00', 220.00),
(3, 7, '2025-11-11 16:00:00', 280.00),
(4, 10, '2025-11-11 19:00:00', 300.00),
(5, 12, '2025-11-11 22:00:00', 200.00),
(6, 15, '2025-11-12 10:00:00', 230.00),
(7, 18, '2025-11-12 13:00:00', 270.00),
(8, 20, '2025-11-12 16:00:00', 300.00),
(9, 25, '2025-11-12 19:00:00', 250.00),
(10, 28, '2025-11-12 22:00:00', 220.00),
(11, 30, '2025-11-13 10:00:00', 260.00),
(12, 35, '2025-11-13 13:00:00', 280.00),
(13, 40, '2025-11-13 16:00:00', 240.00),
(14, 45, '2025-11-13 19:00:00', 310.00),
(15, 50, '2025-11-13 22:00:00', 200.00);


-- ================================================
-- 6️ CUSTOMER DATA (30 ENTRIES)
-- ================================================
INSERT INTO Customer (name, email, phone) VALUES
('Aarav Sharma', 'aarav.sharma@example.com', '9876543210'),
('Vihaan Patel', 'vihaan.patel@example.com', '9823012456'),
('Vivaan Reddy', 'vivaan.reddy@example.com', '9832145698'),
('Aditya Nair', 'aditya.nair@example.com', '9812354789'),
('Arjun Singh', 'arjun.singh@example.com', '9845012369'),
('Reyansh Gupta', 'reyansh.gupta@example.com', '9865014782'),
('Krishna Verma', 'krishna.verma@example.com', '9898541236'),
('Ishaan Yadav', 'ishaan.yadav@example.com', '9812347852'),
('Kabir Mehta', 'kabir.mehta@example.com', '9821456987'),
('Shaurya Iyer', 'shaurya.iyer@example.com', '9845698712'),
('Atharv Joshi', 'atharv.joshi@example.com', '9874512369'),
('Dhruv Rao', 'dhruv.rao@example.com', '9856741235'),
('Ayaan Das', 'ayaan.das@example.com', '9812356974'),
('Rudra Ghosh', 'rudra.ghosh@example.com', '9823014576'),
('Anaya Mishra', 'anaya.mishra@example.com', '9832145789'),
('Diya Kapoor', 'diya.kapoor@example.com', '9875412368'),
('Aarohi Bhatia', 'aarohi.bhatia@example.com', '9865423789'),
('Myra Jain', 'myra.jain@example.com', '9812398745'),
('Sara Chatterjee', 'sara.chatterjee@example.com', '9823145697'),
('Kiara Menon', 'kiara.menon@example.com', '9845123698'),
('Navya Pillai', 'navya.pillai@example.com', '9874563210'),
('Ananya Deshmukh', 'ananya.deshmukh@example.com', '9856321478'),
('Avni Raina', 'avni.raina@example.com', '9812365478'),
('Pari Malhotra', 'pari.malhotra@example.com', '9821456325'),
('Nisha Sinha', 'nisha.sinha@example.com', '9865012354'),
('Riya Dubey', 'riya.dubey@example.com', '9812356987'),
('Simran Bansal', 'simran.bansal@example.com', '9823012564'),
('Tanya Gill', 'tanya.gill@example.com', '9832145782'),
('Priya Nair', 'priya.nair@example.com', '9845012563'),
('Sneha Patil', 'sneha.patil@example.com', '9876547895');



-- ================================================
-- 7️ BOOKING DATA (25 ENTRIES)
-- ================================================
INSERT INTO Booking (customer_id, show_id, seats_booked, booking_date, total_amount) VALUES
(1, 1, 2, '2025-11-10 09:00:00', 500.00),
(2, 2, 3, '2025-11-10 10:15:00', 660.00),
(3, 3, 1, '2025-11-10 11:00:00', 280.00),
(4, 4, 4, '2025-11-10 11:30:00', 1200.00),
(5, 5, 2, '2025-11-10 12:15:00', 400.00),
(6, 6, 3, '2025-11-10 13:00:00', 690.00),
(7, 7, 1, '2025-11-10 13:15:00', 270.00),
(8, 8, 2, '2025-11-10 13:45:00', 600.00),
(9, 9, 3, '2025-11-10 14:30:00', 750.00),
(10, 10, 2, '2025-11-10 15:00:00', 440.00),
(11, 11, 5, '2025-11-10 16:00:00', 1300.00),
(12, 12, 2, '2025-11-10 17:00:00', 560.00),
(13, 13, 4, '2025-11-10 18:00:00', 960.00),
(14, 14, 3, '2025-11-10 19:00:00', 930.00),
(15, 15, 1, '2025-11-10 20:00:00', 200.00),
(16, 1, 3, '2025-11-09 11:00:00', 750.00),
(17, 2, 2, '2025-11-09 11:15:00', 440.00),
(18, 3, 1, '2025-11-09 12:00:00', 280.00),
(19, 4, 2, '2025-11-09 13:00:00', 600.00),
(20, 5, 3, '2025-11-09 13:45:00', 600.00),
(21, 6, 1, '2025-11-09 14:30:00', 230.00),
(22, 7, 4, '2025-11-09 15:00:00', 1080.00),
(23, 8, 3, '2025-11-09 16:00:00', 900.00),
(24, 9, 2, '2025-11-09 17:00:00', 500.00),
(25, 10, 1, '2025-11-09 18:00:00', 220.00);

-- Queries----------------------------------------------------------------------------------------------------------

-- ================================================
-- Query 1: Display all movies
-- ================================================
SELECT * FROM Movie;

-- ================================================
-- Query 2: List all theaters in Mumbai
-- ================================================
SELECT name, location, total_screens
FROM Theater
WHERE location = 'Mumbai';

-- ================================================
-- Query 3: Count total number of theaters city-wise
-- ================================================
SELECT location AS City, COUNT(*) AS Total_Theaters
FROM Theater
GROUP BY location;

-- ================================================
-- Query 4: Display all screens for a specific theater
-- ================================================
SELECT s.screen_id, s.screen_number, s.capacity
FROM Screen s
JOIN Theater t ON s.theater_id = t.theater_id
WHERE t.name = 'PVR Icon';

-- ================================================
-- Query 5: List all showtimes for a particular movie
-- ================================================
SELECT m.title, t.name AS Theater, s.screen_number, sh.show_time, sh.ticket_price
FROM Showtime sh
JOIN Movie m ON sh.movie_id = m.movie_id
JOIN Screen s ON sh.screen_id = s.screen_id
JOIN Theater t ON s.theater_id = t.theater_id
WHERE m.title = 'Jawan';

-- ================================================
-- Query 6: Find all customers who booked tickets for a specific show
-- ================================================
SELECT c.name, c.phone, b.seats_booked
FROM Booking b
JOIN Customer c ON b.customer_id = c.customer_id
WHERE b.show_id = 4;

-- ================================================
-- Query 7: Find total seats booked for each show
-- ================================================
SELECT show_id, SUM(seats_booked) AS Total_Seats
FROM Booking
GROUP BY show_id;

-- ================================================
-- Query 8: Find total revenue generated per show
-- ================================================
SELECT show_id, SUM(total_amount) AS Total_Revenue
FROM Booking
GROUP BY show_id;

-- ================================================
-- Query 9: Find total revenue for each movie
-- ================================================
SELECT m.title, SUM(b.total_amount) AS Total_Revenue
FROM Booking b
JOIN Showtime sh ON b.show_id = sh.show_id
JOIN Movie m ON sh.movie_id = m.movie_id
GROUP BY m.title
ORDER BY Total_Revenue DESC;

-- ================================================
-- Query 10: Find top 5 highest earning movies
-- ================================================
SELECT m.title, SUM(b.total_amount) AS Revenue
FROM Booking b
JOIN Showtime sh ON b.show_id = sh.show_id
JOIN Movie m ON sh.movie_id = m.movie_id
GROUP BY m.title
ORDER BY Revenue DESC
LIMIT 5;

-- ================================================
-- Query 11: Find customers who booked more than 2 seats in a booking
-- ================================================
SELECT c.name, b.seats_booked, b.total_amount
FROM Booking b
JOIN Customer c ON b.customer_id = c.customer_id
WHERE b.seats_booked > 2;

-- ================================================
-- Query 12: Show all bookings made on a particular date
-- ================================================
SELECT b.booking_id, c.name, m.title, b.booking_date
FROM Booking b
JOIN Customer c ON b.customer_id = c.customer_id
JOIN Showtime sh ON b.show_id = sh.show_id
JOIN Movie m ON sh.movie_id = m.movie_id
WHERE DATE(b.booking_date) = '2025-11-10';

-- ================================================
-- Query 13: List customers and their total amount spent
-- ================================================
SELECT c.name, SUM(b.total_amount) AS Total_Spent
FROM Booking b
JOIN Customer c ON b.customer_id = c.customer_id
GROUP BY c.name
ORDER BY Total_Spent DESC;

-- ================================================
-- Query 14: Find movies with ticket price greater than ₹250
-- ================================================
SELECT m.title, sh.ticket_price
FROM Showtime sh
JOIN Movie m ON sh.movie_id = m.movie_id
WHERE sh.ticket_price > 250;

-- ================================================
-- Query 15: Count number of movies per genre
-- ================================================
SELECT genre, COUNT(*) AS Total_Movies
FROM Movie
GROUP BY genre
ORDER BY Total_Movies DESC;

-- ================================================
-- Query 16: Customers who spent more than average total booking amount
-- ================================================
SELECT c.name, SUM(b.total_amount) AS Total_Spent
FROM Booking b
JOIN Customer c ON b.customer_id = c.customer_id
GROUP BY c.name
HAVING Total_Spent > (
    SELECT AVG(total_amount) FROM Booking
);

-- ================================================
-- Query 17: Most popular movie by number of bookings
-- ================================================
SELECT m.title, COUNT(b.booking_id) AS Total_Bookings
FROM Booking b
JOIN Showtime sh ON b.show_id = sh.show_id
JOIN Movie m ON sh.movie_id = m.movie_id
GROUP BY m.title
ORDER BY Total_Bookings DESC
LIMIT 1;

-- ================================================
-- Query 18: Theater with highest total capacity
-- ================================================
SELECT t.name, SUM(s.capacity) AS Total_Capacity
FROM Theater t
JOIN Screen s ON t.theater_id = s.theater_id
GROUP BY t.name
ORDER BY Total_Capacity DESC
LIMIT 1;

-- ================================================
-- Query 19: Movies longer than average duration
-- ================================================
SELECT title, duration
FROM Movie
WHERE duration > (
    SELECT AVG(duration) FROM Movie
);

-- ================================================
-- Query 20: City generating the most revenue
-- ================================================
SELECT t.location AS City, SUM(b.total_amount) AS Total_Revenue
FROM Booking b
JOIN Showtime sh ON b.show_id = sh.show_id
JOIN Screen s ON sh.screen_id = s.screen_id
JOIN Theater t ON s.theater_id = t.theater_id
GROUP BY t.location
ORDER BY Total_Revenue DESC
LIMIT 1;
