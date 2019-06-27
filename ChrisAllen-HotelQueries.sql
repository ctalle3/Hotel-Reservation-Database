USE ChrisAllenHotelDB
GO

--1) Write a query that returns a list of reservations that end in July 2023, including the name of the guest, the room number(s), and 
--the reservation dates.
SELECT g.FirstName, g.LastName, r.Room, res.StartDate, res.EndDate 
FROM Guests AS g
JOIN Reservations AS res ON res.idGuest = g.idGuest
JOIN RoomReservations AS rr ON rr.idReservation = res.idReservation
JOIN Rooms AS r ON r.idRoom = rr.idRoom
WHERE MONTH(res.EndDate) = 7 AND YEAR(res.EndDate) = 2023

--Chris	Allen	 205 6/28/2023 7/2/2023
--Walter Holaway 204 7/13/2023 7/14/2023
--Wilfred Vise	 401 7/18/2023 7/21/2023
--Bettyann Seery 303 7/28/2023 7/29/2023

--2) Write a query that returns a list of all reservations for rooms with a jacuzzi, displaying the guest's name, the room number, and 
--the dates of the reservation.

SELECT g.FirstName, g.LastName, r.Room, res.StartDate, res.EndDate, ra.Amenity
FROM Guests AS g
JOIN Reservations AS res ON res.idGuest = g.idGuest
JOIN RoomReservations AS rr ON rr.idReservation = res.idReservation
JOIN Rooms AS r ON r.idRoom = rr.idRoom
JOIN AmenitiesInRooms AS ar ON ar.idRoom = r.idRoom
JOIN RoomAmenities AS ra ON ra.idRoomAmenity = ar.idRoomAmenity
WHERE RIGHT(ra.Amenity, 7) = 'Jacuzzi'

--Bettyann Seery 203 2/5/2023	2/10/2023	Microwave, Jacuzzi
--Duane	Cullison 305 2/22/2023	2/24/2023	Microwave, Refrigerator, Jacuzzi
--Karie	Yang	 201 3/6/2023	3/7/2023	Microwave, Jacuzzi
--Chris	Allen	 307 3/17/2023	3/20/2023	Microwave, Refrigerator, Jacuzzi
--Walter Holaway 301 4/9/2023	4/13/2023	Microwave, Jacuzzi
--Wilfred Vise	 207 4/23/2023	4/24/2023	Microwave, Refrigerator, Jacuzzi
--Chris	Allen	 205 6/28/2023	7/2/2023	Microwave, Refrigerator, Jacuzzi
--Bettyann Seery 303 7/28/2023	7/29/2023	Microwave, Jacuzzi
--Bettyann Seery 305 8/30/2023	9/1/2023	Microwave, Refrigerator, Jacuzzi
--Karie	Yang	 203 9/13/2023	9/15/2023	Microwave, Jacuzzi
--Mack Simmer	 301 11/22/2023	11/25/2023	Microwave, Jacuzzi

--3) Write a query that returns all the rooms reserved for a specific guest, including the guest's name, the room(s) reserved, the 
--starting date of the reservation, and how many people were included in the reservation. (Choose a guest's name from the existing
-- data.)

SELECT g.FirstName, g.LastName, r.Room, res.StartDate, res.Adults, res.Children
FROM Guests AS g
JOIN Reservations AS res ON res.idGuest = g.idGuest
JOIN RoomReservations AS rr ON rr.idReservation = res.idReservation
JOIN Rooms AS r ON r.idRoom = rr.idRoom
WHERE g.FirstName = 'Wilfred' AND g.LastName = 'Vise'

--Wilfred Vise 207 2023-04-23 1 1
--Wilfred Vise 401 2023-07-18 4 2

--4) Write a query that returns a list of rooms, reservation ID, and per-room cost for each reservation. The results should include all 
--rooms, whether or not there is a reservation associated with the room.

SELECT r.Room, res.idReservation, rp.RoomPrice
FROM Reservations AS res
JOIN RoomReservations AS rr On rr.idReservation = res.idReservation
RIGHT JOIN Rooms AS r ON r.idRoom = rr.idRoom
JOIN RoomPrices AS rp ON rp.idRoomPrice = r.idRoomPrice
ORDER BY r.Room DESC

--402	NULL	399.99
--401	11		399.99
--401	17		399.99
--401	22		399.99
--308	1		149.99
--307	5		174.99
--306	NULL	149.99
--305	3		174.99
--305	19		174.99
--304	NULL	174.99
--303	18		199.99
--302	6		174.99
--302	25		174.99
--301	9		199.99
--301	24		199.99
--208	13		149.99
--208	20		149.99
--207	10		174.99
--206	12		149.99
--206	23		149.99
--205	15		174.99
--204	16		174.99
--203	2		199.99
--203	21		199.99
--202	7		174.99
--201	4		199.99

--5) Write a query that returns all the rooms accommodating at least three guests and that are reserved on any date in April 2023.
SELECT r.Room, res.StartDate, res.Adults, res.Children
FROM Reservations AS res
JOIN RoomReservations AS rr ON rr.idReservation = res.idReservation
JOIN Rooms AS r ON r.idRoom = rr.idRoom
WHERE MONTH(res.StartDate) = 4 AND (res.Adults + res.Children >= 3)

-- No results

--6) Write a query that returns a list of all guest names and the number of reservations per guest, sorted starting with the guest with 
--the most reservations and then by the guest's last name.

SELECT COUNT(g.FirstName) AS firstNameCount, g.firstName, g.LastName
FROM Guests AS g
JOIN Reservations AS res ON res.idGuest = g.idGuest
GROUP BY g.FirstName, g.LastName
ORDER BY firstNameCount DESC, g.LastName

--4	Mack	Simmer
--3	Bettyann	Seery
--2	Chris	Allen
--2	Duane	Cullison
--2	Walter	Holaway
--2	Aurore	Lipton
--2	Maritza	Tilton
--2	Joleen	Tison
--2	Wilfred	Vise
--2	Karie	Yang
--1	Zachery	Luechtefeld

--7) Write a query that displays the name, address, and phone number of a guest based on their phone number. (Choose a phone number from
-- the existing data.)

SELECT g.FirstName, g.LastName, g.Address, g.City, g.State, g.Zip, g.Phone
FROM Guests AS g
WHERE g.Phone = '(555) 555-5555'

--Chris	Allen 123 Drury Lane Denver	CO 82240 (555) 555-5555