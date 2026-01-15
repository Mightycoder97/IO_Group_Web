-- Migration: Add vendedor role to Usuario table
-- Run this in phpMyAdmin on Hostinger

-- Add 'vendedor' to the rol ENUM in Usuario table
ALTER TABLE Usuario 
MODIFY COLUMN rol ENUM('admin', 'editor', 'viewer', 'vendedor') DEFAULT 'viewer';
