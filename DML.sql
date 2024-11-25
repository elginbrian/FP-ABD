-- Menyisipkan data ke dalam tabel Users
INSERT INTO QOPEE.USERS (user_id, full_name, email, password_hash, phone_number) VALUES
('e7b5a1a1-6219-4a00-b5d0-07b7156a1c6e', 'John Doe', 'johndoe@example.com', 'hashed_password1', '081234567890'),
('d3f8bfc8-c5c0-485c-b065-25a2ecf4b276', 'Jane Smith', 'janesmith@example.com', 'hashed_password2', '081234567891'),
('f93c9e9e-328b-4b6f-8ec4-df8030f1ad52', 'Michael Brown', 'michaelbrown@example.com', 'hashed_password3', '081234567892'),
('af68d7f5-cb4e-4cf4-a2a2-8d1efb34d49f', 'Emily Davis', 'emilydavis@example.com', 'hashed_password4', '081234567893'),
('d2e5f6ab-f91d-4d9a-8501-64e9e03a61c8', 'David Wilson', 'davidwilson@example.com', 'hashed_password5', '081234567894');

-- Menyisipkan data ke dalam tabel CoffeeShops
INSERT INTO QOPEE.COFFEESHOPS (shop_id, shop_name, owner_id, location, contact_number, open_hours) VALUES
('f86a1b3b-7c32-45db-a1f0-934ac8b4e5b4', 'Kopi Lokal', 'e7b5a1a1-6219-4a00-b5d0-07b7156a1c6e', 'Jl. Merdeka No. 123, Jakarta', '021987654321', '08:00 - 22:00'),
('a49c8e3b-09c0-466d-a46d-6b6c1a0a3c7f', 'Ngopi Santai', 'd3f8bfc8-c5c0-485c-b065-25a2ecf4b276', 'Jl. Sudirman No. 45, Bandung', '022987654322', '09:00 - 21:00'),
('8b1e4e84-6b83-44e4-95e5-13e5c2f5e6c0', 'Kopi Mantap', 'f93c9e9e-328b-4b6f-8ec4-df8030f1ad52', 'Jl. Gajah Mada No. 88, Surabaya', '031987654323', '07:00 - 23:00'),
('5d8f4d62-4c8f-44cb-91fc-78570a2a17b4', 'Kopi Nusantara', 'af68d7f5-cb4e-4cf4-a2a2-8d1efb34d49f', 'Jl. Diponegoro No. 99, Yogyakarta', '027487654324', '10:00 - 20:00'),
('1b78e76e-3a1a-47dc-a8e6-0e6a5a6c4d5e', 'Coffeeland', 'd2e5f6ab-f91d-4d9a-8501-64e9e03a61c8', 'Jl. Panglima Polim No. 10, Jakarta', '021987654325', '08:00 - 22:00');

-- Menyisipkan data ke dalam tabel Menus
INSERT INTO QOPEE.MENUS (menu_id, shop_id, item_name, description, price, is_available) VALUES
('a6d1c682-0c34-4b56-9759-2b8d74c4c1d0', 'f86a1b3b-7c32-45db-a1f0-934ac8b4e5b4', 'Espresso', 'Kopi hitam dengan rasa kuat', 25000, 1),
('b4d12d38-b6c1-4de7-9b9d-8dfd6f7585f4', 'f86a1b3b-7c32-45db-a1f0-934ac8b4e5b4', 'Latte', 'Kopi dengan susu segar', 30000, 1),
('c7e5d2f6-8304-4df7-9eb7-3a9274b5f7d0', 'a49c8e3b-09c0-466d-a46d-6b6c1a0a3c7f', 'Cappuccino', 'Kopi dengan foam susu', 28000, 1),
('e1d3e09a-d8ec-41d3-93e1-cf1c7b9d3fc0', 'a49c8e3b-09c0-466d-a46d-6b6c1a0a3c7f', 'Mocha', 'Kopi dengan cokelat', 32000, 1),
('f3d5e4d8-c6c7-41d2-bb7c-dc7b81e56e4e', '8b1e4e84-6b83-44e4-95e5-13e5c2f5e6c0', 'Americano', 'Kopi hitam dengan air tambahan', 20000, 1);

-- Menyisipkan data ke dalam tabel Orders
INSERT INTO QOPEE.ORDERS (order_id, user_id, shop_id, order_status, total_price, order_date, pickup_time) VALUES
('f8b3420b-1c4f-42b6-a00e-ff0d4efc6218', 'e7b5a1a1-6219-4a00-b5d0-07b7156a1c6e', 'f86a1b3b-7c32-45db-a1f0-934ac8b4e5b4', 'Pending', 55000, CURRENT_TIMESTAMP, '2024-09-11 10:30:00'),
('f8b3420b-1c4f-42b6-a00e-ff0d4efc6219', 'd3f8bfc8-c5c0-485c-b065-25a2ecf4b276', 'a49c8e3b-09c0-466d-a46d-6b6c1a0a3c7f', 'Confirmed', 58000, CURRENT_TIMESTAMP, '2024-09-11 11:00:00'),
('f8b3420b-1c4f-42b6-a00e-ff0d4efc6220', 'f93c9e9e-328b-4b6f-8ec4-df8030f1ad52', '8b1e4e84-6b83-44e4-95e5-13e5c2f5e6c0', 'Completed', 40000, CURRENT_TIMESTAMP, '2024-09-11 12:00:00'),
('f8b3420b-1c4f-42b6-a00e-ff0d4efc6221', 'af68d7f5-cb4e-4cf4-a2a2-8d1efb34d49f', '5d8f4d62-4c8f-44cb-91fc-78570a2a17b4', 'Cancelled', 36000, CURRENT_TIMESTAMP, '2024-09-11 13:00:00'),
('f8b3420b-1c4f-42b6-a00e-ff0d4efc6222', 'd2e5f6ab-f91d-4d9a-8501-64e9e03a61c8', '1b78e76e-3a1a-47dc-a8e6-0e6a5a6c4d5e', 'Pending', 75000, CURRENT_TIMESTAMP, '2024-09-11 14:00:00');

-- Menyisipkan data ke dalam tabel Payments
INSERT INTO QOPEE.PAYMENTS (payment_id, order_id, payment_method, payment_status, amount, payment_date) VALUES
('e95a0d1e-7594-4b88-8d36-d650b1b5ea62', 'f8b3420b-1c4f-42b6-a00e-ff0d4efc6218', 'Credit Card', 'Pending', 55000, CURRENT_TIMESTAMP),
('e95a0d1e-7594-4b88-8d36-d650b1b5ea63', 'f8b3420b-1c4f-42b6-a00e-ff0d4efc6219', 'Cash', 'Completed', 58000, CURRENT_TIMESTAMP),
('e95a0d1e-7594-4b88-8d36-d650b1b5ea64', 'f8b3420b-1c4f-42b6-a00e-ff0d4efc6220', 'Credit Card', 'Completed', 40000, CURRENT_TIMESTAMP),
('e95a0d1e-7594-4b88-8d36-d650b1b5ea65', 'f8b3420b-1c4f-42b6-a00e-ff0d4efc6221', 'Digital Wallet', 'Cancelled', 36000, CURRENT_TIMESTAMP),
('e95a0d1e-7594-4b88-8d36-d650b1b5ea66', 'f8b3420b-1c4f-42b6-a00e-ff0d4efc6222', 'Cash', 'Pending', 75000, CURRENT_TIMESTAMP);