-- SQL Schema for Gym Management System

-- Roles Table
CREATE TABLE GymRoles (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre_rol VARCHAR(50) NOT NULL UNIQUE
);

-- Initial Roles
INSERT INTO GymRoles (nombre_rol) VALUES ('admin');
INSERT INTO GymRoles (nombre_rol) VALUES ('empleado');
INSERT INTO GymRoles (nombre_rol) VALUES ('starter');
INSERT INTO GymRoles (nombre_rol) VALUES ('premium');

-- Users Table
CREATE TABLE GymUsuarios (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre VARCHAR(100) NOT NULL,
    usuario VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    id_rol INTEGER,
    FOREIGN KEY (id_rol) REFERENCES GymRoles(id)
);

-- Initial Users (Passwords should be hashed in a real app)
-- Admin: admin / admin123
INSERT INTO GymUsuarios (nombre, usuario, email, password, id_rol) VALUES ('Administrador', 'admin', 'admin@gym.com', 'admin123', 1);
-- Employee: empleado1 / emp123
INSERT INTO GymUsuarios (nombre, usuario, email, password, id_rol) VALUES ('Juan Empleado', 'empleado1', 'empleado@gym.com', 'emp123', 2);
-- Starter Member: starter_user / user123
INSERT INTO GymUsuarios (nombre, usuario, email, password, id_rol) VALUES ('Pedro Starter', 'starter_user', 'starter@user.com', 'user123', 3);
-- Premium Member: premium_user / user123
INSERT INTO GymUsuarios (nombre, usuario, email, password, id_rol) VALUES ('Maria Premium', 'premium_user', 'premium@user.com', 'user123', 4);

-- Memberships Table
CREATE TABLE GymMembresias (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_usuario INTEGER,
    tipo_membresia VARCHAR(50) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_vencimiento DATE NOT NULL,
    estado VARCHAR(20) DEFAULT 'activa',
    FOREIGN KEY (id_usuario) REFERENCES GymUsuarios(id)
);

-- Payments Table
CREATE TABLE GymPagos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_usuario INTEGER,
    monto DECIMAL(10, 2) NOT NULL,
    fecha_pago DATETIME DEFAULT CURRENT_TIMESTAMP,
    metodo_pago VARCHAR(50),
    FOREIGN KEY (id_usuario) REFERENCES GymUsuarios(id)
);
