USE [master]
GO

-- If database exists it will delete it and then create a new one
IF EXISTS (SELECT * FROM sys.databases WHERE NAME = N'ChrisAllenHotelDB')
BEGIN
	EXEC msdb.dbo.sp_delete_database_backuphistory @database_name = N'ChrisAllenHotelDB';
	ALTER DATABASE ChrisAllenHotelDB SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE ChrisAllenHotelDB;
END

CREATE DATABASE ChrisAllenHotelDB
GO

USE ChrisAllenHotelDB
GO

-- Creates tables in order for constraints to be used properly. 
CREATE TABLE Guests(
	idGuest INT PRIMARY KEY IDENTITY(1, 1) NOT NULL,
	FirstName VARCHAR(20) NOT NULL,
	LastName VARCHAR(20) NOT NULL,
	Address VARCHAR(50) NOT NULL,
	City VARCHAR(20) NOT NULL,
	State CHAR(2) NOT NULL,
	Zip VARCHAR(10) NOT NULL,
	Phone VARCHAR(15) NOT NULL,
)

CREATE TABLE Reservations(
	idReservation INT PRIMARY KEY IDENTITY(1, 1) NOT NULL,
	Adults INT NOT NULL,
	Children INT NOT NULL,
	StartDate DATE NOT NULL,
	EndDate DATE NOT NULL,
	TotalRoomCost MONEY NOT NULL,
	idGuest INT NOT NULL FOREIGN KEY REFERENCES Guests
)

CREATE TABLE RoomTypes(
	idRoomType INT PRIMARY KEY IDENTITY(1, 1) NOT NULL,
	Type VARCHAR(10) NOT NULL,
	StandardOccupancy INT NOT NULL,
	MaximumOccupancy INT NOT NULL,
	ExtraPerson MONEY NULL
)

CREATE TABLE RoomAmenities(
	idRoomAmenity INT PRIMARY KEY IDENTITY(1, 1) NOT NULL,
	Amenity VARCHAR(50) NOT NULL,
)

CREATE TABLE RoomsADAAccessible(
	idRoomADAAccessible INT PRIMARY KEY IDENTITY(1, 1) NOT NULL,
	ADAAccessible BIT NOT NULL
)

CREATE TABLE RoomPrices(
	idRoomPrice INT PRIMARY KEY IDENTITY(1, 1) NOT NULL,
	RoomPrice MONEY NOT NULL
)

CREATE TABLE Rooms(
	idRoom INT PRIMARY KEY IDENTITY(1, 1) NOT NULL,
	Room INT NOT NULL,
	idRoomType INT FOREIGN KEY REFERENCES RoomTypes,
	idRoomADAAccessible INT FOREIGN KEY REFERENCES RoomsADAAccessible,
	idRoomPrice INT FOREIGN KEY REFERENCES RoomPrices
)

CREATE TABLE RoomReservations(
	idRoomReservation INT PRIMARY KEY IDENTITY(1, 1) NOT NULL,
	idReservation INT FOREIGN KEY REFERENCES Reservations,
	idRoom INT FOREIGN KEY REFERENCES Rooms
)

CREATE TABLE AmenitiesInRooms(
	idAmenitiesInRoom INT PRIMARY KEY IDENTITY(1, 1) NOT NULL,
	idRoom INT FOREIGN KEY REFERENCES Rooms,
	idRoomAmenity INT FOREIGN KEY REFERENCES RoomAmenities
)