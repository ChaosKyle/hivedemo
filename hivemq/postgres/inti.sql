-- Create tables for ESE
CREATE TABLE IF NOT EXISTS users (
    username VARCHAR(255) PRIMARY KEY,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS permissions (
    role VARCHAR(50) NOT NULL,
    permission VARCHAR(255) NOT NULL,
    PRIMARY KEY (role, permission)
);

-- Insert users
INSERT INTO users (username, password, role) VALUES
('machine1', 'password1', 'machine'),
('backend1', 'password2', 'backend'),
('admin1', 'password3', 'admin');

-- Insert permissions
INSERT INTO permissions (role, permission) VALUES
('machine', 'PUBLISH:1:{clientid}/telemetry/data'),
('backend', 'SUBSCRIBE:2:+/+/data'),
('admin', 'PUBLISH:2:#'),
('admin', 'SUBSCRIBE:2:#');