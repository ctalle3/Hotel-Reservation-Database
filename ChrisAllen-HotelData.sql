USE ChrisAllenHotelDB
GO

-- Insert Guests table data
INSERT INTO Guests
(FirstName, LastName, Address, City, State, Zip, Phone)
VALUES
('Chris', 'Allen', '123 Drury Lane', 'Denver', 'CO', '82240', '(555) 555-5555'),
('Mack', 'Simmer', '379 Old Shore Street', 'Council Bluffs', 'IA', '51501', '(291) 553-0508'),
('Bettyann', 'Seery', '750 Wintergreen Dr.' ,'Wasilla', 'AK', '99654', '(478) 277-9632'),
('Duane', 'Cullison', '9662 Foxrun Lane', 'Harlingen', 'TX', '78552', '(308) 494-0198'),
('Karie', 'Yang', '9378 W. Augusta Ave.', 'West Deptford', 'NJ', '80960', '(214) 730-0298'),
('Aurore', 'Lipton', '762 Wild Rose Street', 'Saginaw', 'MI', '48601', '(377) 507-0974'),
('Zachery', 'Luechtefeld', '7 Poplar Dr.', 'Arvada', 'CO', '80003', '(814) 485-2615'),
('Jeremiah', 'Pendergrass', '70 Oakwood St.', 'Zion', 'IL', '60099', '(279) 491-0960'),
('Walter', 'Holaway', '7556 Arrowhead St.', 'Cumberland', 'RI', '28640', '(446) 396-6785'),
('Wilfred', 'Vise', '77 West Surrey Street', 'Oswego', 'NY', '13126', '(834) 727-1001'),
('Maritza', 'Tilton', '939 Linda Rd.', 'Burke', 'VA', '22015', '(446) 351-6860'),
('Joleen', 'Tison', '87 Queen St.', 'Drexel Hill', 'PA', '19026', '(231) 893-2755');

-- Insert Reservations table data
INSERT INTO Reservations
(Adults, Children, StartDate, EndDate, TotalRoomCost, idGuest)
VALUES
('1', '0', '2023-02-02', '2023-02-04', '$299.98', '2'),
('2', '1', '2023-02-05', '2023-02-10', '$999.95', '3'),
('2', '0', '2023-02-22', '2023-02-24', '$349.98', '4'),
('2', '2', '2023-03-06', '2023-03-07', '$199.99', '5'),
('1', '1', '2023-03-17', '2023-03-20', '$524.97', '1'),
('3', '0', '2023-03-18', '2023-03-23', '$924.95', '6'),
('2', '2', '2023-03-29', '2023-03-31', '$349.98', '7'),
('2', '0', '2023-03-31', '2023-04-05', '$874.95', '8'),
('1', '0', '2023-04-09', '2023-04-13', '$799.96', '9'),
('1', '1', '2023-04-23', '2023-04-24', '$174.99', '10'),
('2', '4', '2023-05-30', '2023-06-02', '$1,199.97', '11'),
('2', '0', '2023-06-10', '2023-06-14', '$599.96', '12'),
('1', '0', '2023-06-10', '2023-06-14', '$599.96', '12'),
('3', '0', '2023-06-17', '2023-06-18', '$184.99', '6'),
('2', '0', '2023-06-28', '2023-07-02', '$699.96', '1'),
('3', '1', '2023-07-13', '2023-07-14', '$184.99', '9'),
('4', '2', '2023-07-18', '2023-07-21', '$1,259.97', '10'),
('2', '1', '2023-07-28', '2023-07-29', '$199.99', '3'),
('1', '0', '2023-08-30', '2023-09-01', '$349.98', '3'),
('2', '0', '2023-09-16', '2023-09-17', '$149.99', '2'),
('2', '2', '2023-09-13', '2023-09-15', '$399.98', '5'),
('2', '2', '2023-11-22', '2023-11-25', '$1,199.97', '4'),
('2', '0', '2023-11-22', '2023-11-25', '$449.97', '2'),
('2', '2', '2023-11-22', '2023-11-25', '$599.97', '2'),
('2', '0', '2023-12-24', '2023-12-28', '$699.96', '11');

-- Insert RoomTypes table data
INSERT INTO RoomTypes
(Type, StandardOccupancy, MaximumOccupancy, ExtraPerson)
VALUES
('Double', '2', '4', 10),
('Single', '2', '2', null),
('Suite', '3', '8', 20);

-- Insert RoomAmenities table data
INSERT INTO RoomAmenities
(Amenity)
VALUES
('Microwave, Jacuzzi'),
('Refrigerator'),
('Microwave, Refrigerator, Jacuzzi'),
('Microwave, Refrigerator'),
('Microwave, Refrigerator, Oven');

-- Insert RoomsADAAccessible table data
INSERT INTO RoomsADAAccessible
(ADAAccessible)
VALUES
('1'),
('0');

-- Insert RoomPrices table data
INSERT INTO RoomPrices
(RoomPrice)
VALUES
('$149.99'),
('$174.99'),
('$199.99'),
('$399.99');

-- Insert Rooms table data
INSERT INTO Rooms
(Room, idRoomType, idRoomADAAccessible, idRoomPrice)
VALUES
('201', '1', '2', '3'),
('202', '1', '1', '2'),
('203', '1', '2', '3'),
('204', '1', '1', '2'),
('205', '2', '2', '2'),
('206', '2', '1', '1'),
('207', '2', '2', '2'),
('208', '2', '1', '1'),
('301', '1', '2', '3'),
('302', '1', '1', '2'),
('303', '1', '2', '3'),
('304', '1', '1', '2'),
('305', '2', '2', '2'),
('306', '2', '1', '1'),
('307', '2', '2', '2'),
('308', '2', '1', '1'),
('401', '3', '1', '4'),
('402', '3', '1', '4');

-- Insert RoomReservations table data
INSERT INTO RoomReservations
(idReservation, idRoom)
VALUES
('1', '16'),
('2', '3'),
('3', '13'),
('4', '1'),
('5', '15'),
('6', '10'),
('7', '2'),
('8', '12'),
('9', '9'),
('10', '7'),
('11', '17'),
('12', '6'),
('13', '8'),
('14', '12'),
('15', '5'),
('16', '4'),
('17', '17'),
('18', '11'),
('19', '13'),
('20', '8'),
('21', '3'),
('22', '17'),
('23', '6'),
('24', '9'),
('25', '10'); 

-- Insert AmenitiesInRooms table data
INSERT INTO AmenitiesInRooms
(idRoom, idRoomAmenity)
VALUES
('1', '1'),
('2', '2'),
('3', '1'),
('4', '2'),
('5', '3'),
('6', '4'),
('7', '3'),
('8', '4'),
('9', '1'),
('10', '2'),
('11', '1'),
('12', '2'),
('13', '3'),
('14', '4'),
('15', '3'),
('16', '4'),
('17', '5'),
('18', '5');

--Delete Jeremiah Pendergrass from the database
DELETE FROM RoomReservations
WHERE idRoom = '12'

DELETE FROM Reservations
WHERE idGuest = '8';

DELETE FROM Guests
WHERE FirstName = 'Jeremiah' AND LastName = 'Pendergrass'; 