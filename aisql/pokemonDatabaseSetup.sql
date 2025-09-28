CREATE TABLE User (
    Id INT PRIMARY KEY NOT NULL,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    registration_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Card (
    Id INT PRIMARY KEY NOT NULL,
    name VARCHAR(100) NOT NULL,
    series VARCHAR(50),
    set_name VARCHAR(100),
    card_number VARCHAR(20),
    rarity VARCHAR(255) DEFAULT 'Common' CHECK ( rarity in ('Common','Uncommon','Rare','Holo Rare','Reverse Holo', 'Double Rare' ,'Ultra Rare', 'Illustration Rare', 'Special Illustration Rare', 'Hyper Rare', 'Secret Rare')),
    card_type VARCHAR(20),
    hp INT,
    description TEXT,
    image_url VARCHAR(255)
);

CREATE TABLE UserCard (
    Id INT PRIMARY KEY NOT NULL,
    user_id INT NOT NULL,
    card_id INT NOT NULL,
    quantity INT DEFAULT 1,
    condition VARCHAR(255) DEFAULT 'Good' CHECK( condition in ('Mint','Near Mint','Excellent','Good','Light Played','Played','Poor')),
    rating INT CHECK (rating BETWEEN 1 AND 10),
    is_for_trade BOOLEAN DEFAULT FALSE,
    is_for_sale BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (user_id) REFERENCES User(Id),
    FOREIGN KEY (card_id) REFERENCES Card(Id)
);

CREATE TABLE Trade (
    Id INT PRIMARY KEY NOT NULL,
    sender_user_id INT NOT NULL,
    receiver_user_id INT NOT NULL,
    initiated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    completed_at DATETIME,
    status VARCHAR(255) DEFAULT 'Pending' CHECK ( status in ('Pending','Completed','Cancelled')),
    FOREIGN KEY (sender_user_id) REFERENCES User(Id),
    FOREIGN KEY (receiver_user_id) REFERENCES User(Id)
);

CREATE TABLE TradeItem (
    Id INT PRIMARY KEY NOT NULL,
    trade_id INT NOT NULL,
    first_user_id INT NOT NULL,
    second_user_id INT NOT NULL,
    first_user_card_id INT NOT NULL,
    second_user_card_id INT NOT NULL,
    first_card_quantity INT DEFAULT 1,
    second_card_quantity INT DEFAULT 1,
    FOREIGN KEY (trade_id) REFERENCES Trade(trade_id),
    FOREIGN KEY (first_user_id) REFERENCES Users(Id),
    FOREIGN KEY (second_user_id) REFERENCES Users(Id),
    FOREIGN KEY (first_user_card_id) REFERENCES UserCard(Id),
    FOREIGN KEY (second_user_card_id) REFERENCES UserCard(Id)
);

CREATE TABLE Listing (
    Id INT PRIMARY KEY NOT NULL,
    user_card_id INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    listed_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(255) DEFAULT 'Active' CHECK ( status in ('Active','Sold','Cancelled')),
    FOREIGN KEY (user_card_id) REFERENCES UserCard(Id)
);

CREATE TABLE Transactions (
    Id INT PRIMARY KEY NOT NULL,
    listing_id INT NOT NULL,
    buyer_user_id INT NOT NULL,
    seller_user_id INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    transaction_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (listing_id) REFERENCES Listing(Id),
    FOREIGN KEY (buyer_user_id) REFERENCES User(Id),
    FOREIGN KEY (seller_user_id) REFERENCES User(Id)
);
