DROP TABLE bookings;
DROP TABLE members;
DROP TABLE sessions;

CREATE TABLE sessions (
  id SERIAL PRIMARY KEY,
  type VARCHAR(255),
  trainer VARCHAR(255),
  room INT
  );
CREATE TABLE members (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  goal VARCHAR(255)
  );
CREATE TABLE bookings (
  id SERIAL PRIMARY KEY,
  session_id INT REFERENCES sessions(id),
  member_id INT REFERENCES members(id)
  );
