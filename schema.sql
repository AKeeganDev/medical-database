CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    name VARCHAR,
    date_of_birth DATE
);

CREATE UNIQUE INDEX patient_key ON patients(id);

CREATE TABLE medical_histories (
    id SERIAL PRIMARY KEY,
    patiend_id INT REFERENCES patients(id),
    admitted_at TIMESTAMP,
    status VARCHAR
);

CREATE UNIQUE INDEX patient_ID_index ON medical_histories(id);

CREATE TABLE treatments (
    id SERIAL PRIMARY KEY REFERENCES medical_histories(id),
    type VARCHAR,
    name VARCHAR
);

CREATE UNIQUE INDEX treatments_id_index ON treatments(id);