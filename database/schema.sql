-- Biofuel Logistics Fleet Control System Schema

-- Users Table
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Vehicles Table
CREATE TABLE vehicles (
    vehicle_id SERIAL PRIMARY KEY,
    license_plate VARCHAR(15) UNIQUE NOT NULL,
    make VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    year INT NOT NULL,
    status VARCHAR(20) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Trips Table
CREATE TABLE trips (
    trip_id SERIAL PRIMARY KEY,
    vehicle_id INT REFERENCES vehicles(vehicle_id),
    user_id INT REFERENCES users(user_id),
    start_location VARCHAR(255) NOT NULL,
    end_location VARCHAR(255) NOT NULL,
    start_time TIMESTAMP NOT NULL,
    end_time TIMESTAMP,
    distance NUMERIC(10, 2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Expenses Table
CREATE TABLE expenses (
    expense_id SERIAL PRIMARY KEY,
    trip_id INT REFERENCES trips(trip_id),
    amount NUMERIC(10, 2) NOT NULL,
    description VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Maintenance Schedules Table
CREATE TABLE maintenance_schedules (
    schedule_id SERIAL PRIMARY KEY,
    vehicle_id INT REFERENCES vehicles(vehicle_id),
    maintenance_date TIMESTAMP NOT NULL,
    details VARCHAR(255),
    next_due_date TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Geofences Table
CREATE TABLE geofences (
    geofence_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    coordinates GEOMETRY NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- GPS Tracking Table
CREATE TABLE gps_tracking (
    tracking_id SERIAL PRIMARY KEY,
    vehicle_id INT REFERENCES vehicles(vehicle_id),
    timestamp TIMESTAMP NOT NULL,
    latitude NUMERIC(10, 8) NOT NULL,
    longitude NUMERIC(11, 8) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Alerts Table
CREATE TABLE alerts (
    alert_id SERIAL PRIMARY KEY,
    trip_id INT REFERENCES trips(trip_id),
    alert_type VARCHAR(50),
    message VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Driver Hours Table
CREATE TABLE driver_hours (
    hours_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    trip_id INT REFERENCES trips(trip_id),
    hours_worked NUMERIC(5, 2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tax Records Table
CREATE TABLE tax_records (
    tax_id SERIAL PRIMARY KEY,
    year INT NOT NULL,
    total_revenue NUMERIC(15, 2) NOT NULL,
    total_expenses NUMERIC(15, 2) NOT NULL,
    net_profit NUMERIC(15, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE INDEX idx_users_username ON users(username);
CREATE INDEX idx_vehicles_license_plate ON vehicles(license_plate);
CREATE INDEX idx_trips_user_id ON trips(user_id);
CREATE INDEX idx_expenses_trip_id ON expenses(trip_id);
CREATE INDEX idx_maintenance_vehicle_id ON maintenance_schedules(vehicle_id);
CREATE INDEX idx_gps_vehicle_id ON gps_tracking(vehicle_id);
CREATE INDEX idx_alerts_trip_id ON alerts(trip_id);
CREATE INDEX idx_driver_hours_user_id ON driver_hours(user_id);
CREATE INDEX idx_tax_year ON tax_records(year);
