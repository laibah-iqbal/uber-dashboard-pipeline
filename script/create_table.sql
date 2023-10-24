DROP TABLE IF EXISTS uber.rides;
CREATE TABLE uber.rides (
    id UUID NOT NULL PRIMARY KEY,
    fare_amount FLOAT,
    pickup_date TIMESTAMP,
    passengers INT,
    pickup_latlong VARCHAR(100),
    dropff_latlong VARCHAR(100),
    created_at TIMESTAMP,
    inserted_at TIMESTAMP not null default CURRENT_TIMESTAMP);