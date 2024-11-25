-- Definisi Role Customer, ShopOwner, dan Admin
CREATE ROLE Customer;
CREATE ROLE ShopOwner;
CREATE ROLE Admin;

-- Membuat view untuk Customer, menampilkan kolom tertentu dari Users
CREATE VIEW Qopee.CustomerUsersView AS
SELECT user_id, full_name, email
FROM Qopee.Users;

-- Membuat view yang hanya menampilkan kolom shop_id dan shop_name dari tabel CoffeeShops
CREATE VIEW Qopee.CustomerCoffeeShopsView AS
SELECT shop_id, shop_name
FROM Qopee.CoffeeShops;

-- Memberikan hak akses Customer pada tabel Users
GRANT SELECT ON Qopee.CustomerUsersView TO Customer;

-- Memberikan hak akses Customer pada tabel Orders
GRANT SELECT ON Qopee.Orders TO Customer;

-- Memberikan akses SELECT pada view CustomerCoffeeShopsView untuk role Customer
GRANT SELECT ON Qopee.CustomerCoffeeShopsView TO Customer;

-- Memberikan hak akses Customer pada tabel Payments
GRANT SELECT ON Qopee.Payments TO Customer;

-- Membuat view untuk ShopOwner, menampilkan kolom tertentu dari Users
CREATE VIEW Qopee.ShopOwnerUsersView AS
SELECT user_id, full_name, email
FROM Qopee.Users;

-- Memberikan hak akses ShopOwner pada tabel Users
GRANT SELECT ON Qopee.ShopOwnerUsersView TO ShopOwner;

-- Memberikan hak akses penuh ShopOwner pada tabel CoffeeShops
GRANT SELECT, INSERT, UPDATE, DELETE ON Qopee.CoffeeShops TO ShopOwner;

-- Memberikan hak akses penuh ShopOwner pada tabel Menus
GRANT SELECT, INSERT, UPDATE, DELETE ON Qopee.Menus TO ShopOwner;

-- Memberikan hak akses ShopOwner pada tabel Orders
GRANT SELECT ON Qopee.Orders TO ShopOwner;

-- Memberikan hak akses penuh Admin ke semua tabel
GRANT ALL PRIVILEGES ON TABLE Qopee.Users TO Admin;
GRANT ALL PRIVILEGES ON TABLE Qopee.CoffeeShops TO Admin;
GRANT ALL PRIVILEGES ON TABLE Qopee.Menus TO Admin;
GRANT ALL PRIVILEGES ON TABLE Qopee.Orders TO Admin;
GRANT ALL PRIVILEGES ON TABLE Qopee.Payments TO Admin;

-- Memberikan role kepada pengguna yang sesuai
GRANT Customer TO user_customer;
GRANT ShopOwner TO user_shopowner;
GRANT Admin TO user_admin;

-- Mengaktifkan Row Access Control dan Column Access Control di tabel yang relevan
ALTER TABLE Qopee.Orders ACTIVATE ROW ACCESS CONTROL;
ALTER TABLE Qopee.Payments ACTIVATE ROW ACCESS CONTROL;
ALTER TABLE Qopee.Users ACTIVATE COLUMN ACCESS CONTROL;

-- Membuat RCAC untuk Customer di tabel Orders
CREATE PERMISSION OrdersCustomerAccess
ON Qopee.Orders
FOR ROWS WHERE user_id = SESSION_USER
ENFORCED FOR ALL ACCESS
ENABLE;

-- Membuat RCAC untuk ShopOwner di tabel Orders
CREATE PERMISSION OrdersShopOwnerAccess
ON Qopee.Orders
FOR ROWS WHERE EXISTS (
    SELECT 1
    FROM Qopee.CoffeeShops cs
    WHERE cs.shop_id = Qopee.Orders.shop_id
      AND cs.owner_id = SESSION_USER
)
ENFORCED FOR ALL ACCESS
ENABLE;

-- Membuat Column Access Control pada kolom `password_hash` untuk menyembunyikannya
CREATE VIEW Qopee.UsersMaskedView AS
SELECT user_id,
       full_name,
       email,
       CASE 
           WHEN SESSION_USER IS NOT NULL THEN NULL
           ELSE password_hash
       END AS password_hash
FROM Qopee.Users;