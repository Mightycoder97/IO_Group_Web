-- Migration: Add mes_servicio column to Servicio table
-- Run this in phpMyAdmin before re-importing services

ALTER TABLE Servicio ADD COLUMN mes_servicio VARCHAR(20) AFTER codigo_servicio;

-- Create index for faster queries
CREATE INDEX idx_servicio_mes ON Servicio(mes_servicio);
