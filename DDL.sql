-- Membuat schema baru
CREATE SCHEMA Qopee;

-- Mengatur schema yang baru dibuat sebagai default
SET SCHEMA Qopee;

-- Tabel: Users
CREATE TABLE Users (
    user_id CHAR(36) NOT NULL PRIMARY KEY,  -- Menambahkan NOT NULL
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(15),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabel: CoffeeShops
CREATE TABLE CoffeeShops (
    shop_id CHAR(36) NOT NULL PRIMARY KEY,  -- Menambahkan NOT NULL
    shop_name VARCHAR(100) NOT NULL,
    owner_id CHAR(36) NOT NULL REFERENCES Users(user_id),  -- Menambahkan NOT NULL
    location VARCHAR(255) NOT NULL,
    contact_number VARCHAR(15),
    open_hours VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabel: Menus
CREATE TABLE Menus (
    menu_id CHAR(36) NOT NULL PRIMARY KEY,  -- Menambahkan NOT NULL
    shop_id CHAR(36) NOT NULL REFERENCES CoffeeShops(shop_id) ON DELETE CASCADE,  -- Menambahkan NOT NULL
    item_name VARCHAR(100) NOT NULL,
    description CLOB,
    price DECIMAL(10, 2) NOT NULL,
    is_available BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabel: Orders
CREATE TABLE Orders (
    order_id CHAR(36) NOT NULL PRIMARY KEY,  -- Menambahkan NOT NULL
    user_id CHAR(36) NOT NULL REFERENCES Users(user_id),  -- Menambahkan NOT NULL
    shop_id CHAR(36) NOT NULL REFERENCES CoffeeShops(shop_id),  -- Menambahkan NOT NULL
    order_status VARCHAR(50) DEFAULT 'Pending',
    total_price DECIMAL(10, 2) NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    pickup_time TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabel: Payments
CREATE TABLE Payments (
    payment_id CHAR(36) NOT NULL PRIMARY KEY,  -- Menambahkan NOT NULL
    order_id CHAR(36) NOT NULL REFERENCES Orders(order_id) ON DELETE CASCADE,  -- Menambahkan NOT NULL
    payment_method VARCHAR(50),
    payment_status VARCHAR(50) DEFAULT 'Pending',
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    amount DECIMAL(10, 2) NOT NULL
);

-- View: UserOrders
CREATE VIEW UserOrders AS
SELECT 
    U.full_name,
    U.email,
    O.order_id,
    O.order_status,
    O.total_price,
    O.pickup_time,
    C.shop_name
FROM 
    Users U
JOIN 
    Orders O ON U.user_id = O.user_id
JOIN 
    CoffeeShops C ON O.shop_id = C.shop_id;

-- View: ShopMenuDetails
CREATE VIEW ShopMenuDetails AS
SELECT 
    C.shop_name,
    M.item_name,
    M.description,
    M.price,
    M.is_available
FROM 
    CoffeeShops C
JOIN 
    Menus M ON C.shop_id = M.shop_id;

-- View: PaymentDetails
CREATE VIEW PaymentDetails AS
SELECT 
    U.full_name,
    O.order_id,
    P.payment_method,
    P.payment_status,
    P.amount,
    P.payment_date
FROM 
    Payments P
JOIN 
    Orders O ON P.order_id = O.order_id
JOIN 
    Users U ON O.user_id = U.user_id;

-- Index: idx_users_email
CREATE INDEX idx_users_email ON Users (email);

-- Index: idx_coffee_shops_location
CREATE INDEX idx_coffee_shops_location ON CoffeeShops (location);

-- Index: idx_menus_item_name
CREATE INDEX idx_menus_item_name ON Menus (item_name);

-- Index: idx_orders_status
CREATE INDEX idx_orders_status ON Orders (order_status);

-- Index: idx_payments_status
CREATE INDEX idx_payments_status ON Payments (payment_status);