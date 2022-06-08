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

CREATE TABLE invoices (
  id SERIAL PRIMARY KEY,
  total_amount DECIMAL,
  generated_at TIMESTAMP,
  payed_at TIMESTAMP,
  medical_history_id INT REFERENCES medical_histories(id)
);

CREATE UNIQUE INDEX invoices_id_index ON invoices(id);

CREATE TABLE invoice_items (
  id SERIAL PRIMARY KEY,
  unit_price DECIMAL,
  quantity INT,
  total_price DECIMAL,
  invoice_id INT REFERENCES invoices(id),
  treatment_id INT
);

CREATE UNIQUE INDEX invoice-items_id_index ON invoice_items(id);

CREATE UNIQUE INDEX invoice-items_treatment_id_index ON treatments(id);