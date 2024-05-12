CREATE TABLE Vehicles (
  vehicle_id INT NOT NULL,
  vehicle_type VARCHAR(50),
  vehicle_make VARCHAR(50),
  vehicle_model VARCHAR(50),
  year_of_manufacture INT,
  capacity INT,
  PRIMARY KEY (vehicle_id)
);

CREATE TABLE Drivers (
  driver_id INT NOT NULL,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  date_of_birth DATE,
  contact_number VARCHAR(20),
  license_number VARCHAR(50),
  license_expiry_date DATE,
  PRIMARY KEY (driver_id)
);

CREATE TABLE Passengers (
  passenger_id INT NOT NULL,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  contact_number VARCHAR(20),
  email_address VARCHAR(50),
  PRIMARY KEY (passenger_id)
);

CREATE TABLE Routes (
  route_id INT NOT NULL,
  route_name VARCHAR(50),
  starting_point VARCHAR(100),
  ending_point VARCHAR(100),
  distance INT,
  estimated_travel_time VARCHAR(10),
  PRIMARY KEY (route_id)
);

CREATE TABLE Trips (
  trip_id INT NOT NULL,
  vehicle_id INT,
  driver_id INT,
  route_id INT,
  start_time TIMESTAMP,
  end_time TIMESTAMP,
  number_of_passengers INT,
  PRIMARY KEY (trip_id),
  FOREIGN KEY (vehicle_id) REFERENCES Vehicles(vehicle_id),
  FOREIGN KEY (driver_id) REFERENCES Drivers(driver_id),
  FOREIGN KEY (route_id) REFERENCES Routes(route_id)
);

CREATE TABLE Traffic_Data (
  traffic_id INT NOT NULL,
  route_id INT,
  timestamp TIMESTAMP,
  speed DECIMAL(10,2),
  congestion_level VARCHAR(50),
  PRIMARY KEY (traffic_id),
  FOREIGN KEY (route_id) REFERENCES Routes(route_id)
);

CREATE TABLE Road_Conditions (
  road_condition_id INT NOT NULL,
  route_id INT,
  timestamp TIMESTAMP,
  road_condition_type VARCHAR(50),
  road_condition_description VARCHAR(200),
  PRIMARY KEY (road_condition_id),
  FOREIGN KEY (route_id) REFERENCES Routes(route_id)
);

CREATE TABLE Weather_Conditions (
  weather_id INT NOT NULL,
  route_id INT,
  timestamp TIMESTAMP,
  weather_type VARCHAR(50),
  temperature DECIMAL(5,2),
  humidity INT,
  wind_speed DECIMAL(5,2),
  PRIMARY KEY (weather_id),
  FOREIGN KEY (route_id) REFERENCES Routes(route_id)
);

CREATE TABLE Incidents (
  incident_id INT NOT NULL,
  route_id INT,
  timestamp DATE,
  incident_type VARCHAR(50),
  incident_description VARCHAR(200),
  PRIMARY KEY (incident_id),
  FOREIGN KEY (route_id) REFERENCES Routes(route_id)
);



CREATE TABLE Regulatory_Requirements (
  requirement_id INT NOT NULL,
  requirement_name VARCHAR(100),
  description VARCHAR(200),
  PRIMARY KEY (requirement_id)
);




-- Insert sample values for Vehicles
INSERT INTO Vehicles VALUES(1, 'Bus', 'Volvo', 'B7R', 2010, 50);
INSERT INTO Vehicles VALUES(2, 'Car', 'Toyota', 'Corolla', 2019, 5);
INSERT INTO Vehicles VALUES(3, 'Truck', 'Isuzu', 'NQR', 2015, 10);
INSERT INTO Vehicles VALUES(4, 'Van', 'Mercedes-Benz', 'Sprinter', 2016, 15);
INSERT INTO Vehicles VALUES(5, 'Bus', 'Scania', 'K410', 2014, 40);

INSERT INTO Drivers VALUES (1, 'Rajesh', 'Kumar', TO_DATE('1990-05-15','yyyy-MM-dd'),'9876543210', 'DL123456', TO_DATE('2025-05-15','yyyy-MM-dd'));
INSERT INTO Drivers VALUES (2, 'Priya', 'Sharma', TO_DATE('1995-02-28','yyyy-MM-dd'), '9876543211', 'UP123456', TO_DATE('2024-02-28','yyyy-MM-dd'));
INSERT INTO Drivers VALUES (3, 'Sanjay', 'Singh', TO_DATE('1992-09-10','yyyy-MM-dd'), '9876543212', 'MP123456', TO_DATE('2026-09-10','yyyy-MM-dd'));
INSERT INTO Drivers VALUES (4, 'Anjali', 'Gupta', TO_DATE('1988-12-01','yyyy-MM-dd'), '9876543213', 'GJ123456', TO_DATE('2023-12-01','yyyy-MM-dd'));
INSERT INTO Drivers VALUES (5, 'Vikram', 'Patel', TO_DATE('1993-06-20','yyyy-MM-dd'), '9876543214', 'MH123456', TO_DATE('2027-06-20','yyyy-MM-dd'));

-- Insert sample values for Passengers
INSERT INTO Passengers VALUES (1, 'Alice', 'Smith', '+1 (123) 456-7890', 'alice.smith@example.com');
INSERT INTO Passengers VALUES (2, 'Bob', 'Johnson', '+1 (987) 654-3210', 'bob.johnson@example.com');
INSERT INTO Passengers VALUES (3, 'Charlie', 'Wilson', '+44 (0) 1234 567890', 'charlie.wilson@example.com');
INSERT INTO Passengers VALUES (4, 'David', 'Lee', '+44 (0) 7777 123456', 'david.lee@example.com');
INSERT INTO Passengers VALUES (5, 'Emily', 'Chen', '+61 (0) 1234 5678', 'emily.chen@example.com');


-- Insert sample values for Routes

INSERT INTO Routes VALUES (1, 'Route A', 'City A', 'City B', 100.0, '02:00:00');
INSERT INTO Routes VALUES (2, 'Route B', 'City C', 'City D', 50.5, '01:00:00');
INSERT INTO Routes VALUES (3, 'Route C', 'City D', 'City E', 75.2, '01:30:00');
INSERT INTO Routes VALUES (4, 'Route D', 'City F', 'City G', 200.0, '03:30:00');
INSERT INTO Routes VALUES (5, 'Route E', 'City H', 'City I', 150.5, '02:45:00');

-- Insert sample values for Trips
INSERT INTO Trips VALUES (1, 1, 1, 1, TO_DATE('2023-05-02 10:00:00', 'yyyy-MM-dd hh24:mi:ss'), TO_DATE('2023-05-02 12:00:00', 'yyyy-MM-dd hh24:mi:ss'), 35);
INSERT INTO Trips VALUES (2, 2, 2, 2, TO_DATE('2023-05-03 08:30:00', 'yyyy-MM-dd hh24:mi:ss'), TO_DATE('2023-05-03 09:30:00', 'yyyy-MM-dd hh24:mi:ss'), 3);
INSERT INTO Trips VALUES (3, 3, 3, 3, TO_DATE('2023-05-04 12:00:00', 'yyyy-MM-dd hh24:mi:ss'), TO_DATE('2023-05-04 13:30:00', 'yyyy-MM-dd hh24:mi:ss'), 8);
INSERT INTO Trips VALUES (4, 4, 4, 4, TO_DATE('2023-05-05 15:00:00', 'yyyy-MM-dd hh24:mi:ss'), TO_DATE('2023-05-05 18:30:00', 'yyyy-MM-dd hh24:mi:ss'), 20);
INSERT INTO Trips VALUES (5, 5, 5, 5, TO_DATE('2023-05-06 07:00:00', 'yyyy-MM-dd hh24:mi:ss'), TO_DATE('2023-05-06 09:45:00', 'yyyy-MM-dd hh24:mi:ss'), 30);

 
INSERT INTO Traffic_Data VALUES (1, 1, TO_DATE('2022-04-29 10:00:00', 'yyyy-MM-dd hh24:mi:ss'), 50.5, 'Medium');
INSERT INTO Traffic_Data VALUES (2, 2, TO_DATE('2022-04-25 11:00:00', 'yyyy-MM-dd hh24:mi:ss'), 60.0, 'High');
INSERT INTO Traffic_Data VALUES (3, 3, TO_DATE('2022-04-05 12:00:00', 'yyyy-MM-dd hh24:mi:ss'), 40.2, 'Low');
INSERT INTO Traffic_Data VALUES (4, 1, TO_DATE('2022-04-24 13:00:00', 'yyyy-MM-dd hh24:mi:ss'), 45.8, 'Low');
INSERT INTO Traffic_Data VALUES (5, 2, TO_DATE('2022-04-16 14:00:00', 'yyyy-MM-dd hh24:mi:ss'), 55.1, 'Medium');


INSERT INTO Road_Conditions VALUES (1, 1, TO_DATE('2022-04-05 10:00:00', 'yyyy-MM-dd hh24:mi:ss'), 'Construction', 'Left lane closed due to road work');
INSERT INTO Road_Conditions VALUES (2, 2, TO_DATE('2022-04-20 18:00:00', 'yyyy-MM-dd hh24:mi:ss'), 'Accident', 'Multi-car pile-up blocking multiple lanes');
INSERT INTO Road_Conditions VALUES (3, 3, TO_DATE('2022-04-13 08:00:00', 'yyyy-MM-dd hh24:mi:ss'), 'Heavy Traffic', 'Slow moving traffic due to rush hour');
INSERT INTO Road_Conditions VALUES (4, 1, TO_DATE('2022-04-11 20:00:00', 'yyyy-MM-dd hh24:mi:ss'), 'Clear', 'No road hazards reported');
INSERT INTO Road_Conditions VALUES (5, 2, TO_DATE('2022-04-18 16:00:00', 'yyyy-MM-dd hh24:mi:ss'), 'Heavy Rain', 'Heavy rain causing flooding on roadway');


INSERT INTO Weather_Conditions VALUES (1, 1, TO_DATE('2022-04-30 10:00:00', 'yyyy-MM-dd hh24:mi:ss'), 'Sunny', 25.5, 50, 10.2);
INSERT INTO Weather_Conditions VALUES  (2, 2, TO_DATE('2022-04-30 10:00:00', 'yyyy-MM-dd hh24:mi:ss'), 'Cloudy', 20.0, 70, 5.1);
INSERT INTO Weather_Conditions VALUES  (3, 3, TO_DATE('2022-04-30 10:00:00', 'yyyy-MM-dd hh24:mi:ss'), 'Rainy', 15.2, 80, 7.3);
INSERT INTO Weather_Conditions VALUES  (4, 1, TO_DATE('2022-04-30 11:00:00', 'yyyy-MM-dd hh24:mi:ss'), 'Sunny', 28.6, 40, 8.2);
INSERT INTO Weather_Conditions VALUES  (5, 2, TO_DATE('2022-04-30 11:00:00', 'yyyy-MM-dd hh24:mi:ss'), 'Thunderstorm', 18.9, 90, 15.5);


INSERT INTO Incidents VALUES (1, 1, TO_DATE('2023-05-02 12:00:00', 'yyyy-MM-dd hh24:mi:ss'), 'Accident', 'Car crash on the highway');
INSERT INTO Incidents VALUES (2, 2, TO_DATE('2023-05-01 14:30:00', 'yyyy-MM-dd hh24:mi:ss'), 'Roadwork', 'Lane closure due to construction');
INSERT INTO Incidents VALUES (3, 3, TO_DATE('2023-04-29 16:45:00', 'yyyy-MM-dd hh24:mi:ss'), 'Traffic Jam', 'Heavy traffic causing delays');
INSERT INTO Incidents VALUES (4, 4, TO_DATE('2023-04-27 08:15:00', 'yyyy-MM-dd hh24:mi:ss'), 'Hazardous Conditions', 'Ice on the road, drive with caution');
INSERT INTO Incidents VALUES (5, 5, TO_DATE('2023-04-26 17:00:00', 'yyyy-MM-dd hh24:mi:ss'), 'Police Activity', 'Police car blocking a lane for an investigation');


INSERT INTO Regulatory_Requirements VALUES (1, 'Seat Belt Law', 'All occupants of a vehicle must wear seat belts while driving');
INSERT INTO Regulatory_Requirements VALUES (2, 'Speed Limit', 'The maximum speed limit on highways is 65 mph');
INSERT INTO Regulatory_Requirements VALUES (3, 'Inspection Stickers', 'All registered vehicles must have a current inspection sticker displayed on the windshield');
INSERT INTO Regulatory_Requirements VALUES (4, 'Handheld Device Ban', 'It is illegal to use handheld devices while driving');
INSERT INTO Regulatory_Requirements VALUES (5, 'Drunk Driving Law', 'Driving with a blood alcohol concentration of 0.08% or higher is illegal');

SELECT * FROM Vehicles WHERE vehicle_type = 'Car';

SELECT Trips.*, Vehicles.vehicle_make, Vehicles.vehicle_model, Drivers.first_name, Drivers.last_name FROM Trips
INNER JOIN Vehicles ON Trips.vehicle_id = Vehicles.vehicle_id
INNER JOIN Drivers ON Trips.driver_id = Drivers.driver_id
WHERE Trips.start_time >= TO_DATE('2023-01-01 01:00:00', 'yyyy-MM-dd hh24:mi:ss') AND Trips.end_time <= TO_DATE('2023-12-31 23:00:00', 'yyyy-MM-dd hh24:mi:ss');

SELECT * FROM Traffic_Data
WHERE timestamp BETWEEN  TO_DATE('2022-04-15 10:00:00', 'yyyy-MM-dd hh24:mi:ss') AND TO_DATE('2022-04-30 18:00:00', 'yyyy-MM-dd hh24:mi:ss');

