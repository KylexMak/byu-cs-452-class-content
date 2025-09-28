-- Insert Users
INSERT INTO User (Id, username, email, password_hash, registration_date) VALUES
  (1, 'ash_ketchum', 'ash@pallet.com', 'hash1', '2025-09-01 10:00:00'),
  (2, 'misty_waterflower', 'misty@cerulean.com', 'hash2', '2025-09-02 11:00:00'),
  (3,'brock_pewter', 'brock@pewter.com', 'hash3', '2025-09-03 12:00:00'),
  (4,'garyoak', 'gary@violetcity.com', 'hash4', '2025-09-04 09:30:00'),
  (5,'tracey', 'tracey@orangeislands.com', 'hash5', '2025-09-05 08:45:00');

-- Insert Cards
INSERT INTO Card (Id, name, series, set_name, card_number, rarity, card_type, hp, description, image_url) VALUES
  (1, 'Charizard', 'Base', 'Base Set', '4', 'Ultra Rare', 'Fire', 120, 'Spits fire that melts boulders.', 'https://img.pokecards.com/charizard.jpg'),
  (2, 'Pikachu', 'XY', 'Steam Siege', '25', 'Common', 'Electric', 60, 'Mouse Pokémon famous for its static.', 'https://img.pokecards.com/pikachu.jpg'),
  (3, 'Squirtle', 'Base', 'Base Set', '7', 'Uncommon', 'Water', 50, 'Tiny Turtle Pokémon.', 'https://img.pokecards.com/squirtle.jpg'),
  (4, 'Bulbasaur', 'Jungle', 'Jungle Set', '44', 'Rare', 'Grass', 70, 'A Seed Pokémon that can drain energy.', 'https://img.pokecards.com/bulbasaur.jpg'),
  (5, 'Eevee', 'Evolution', 'Evolution Set', '133', 'Rare', 'Normal', 60, 'An adaptable Pokémon with many evolutions.', 'https://img.pokecards.com/eevee.jpg');

-- Insert UserCards
INSERT INTO UserCard (Id, user_id, card_id, quantity, condition, rating, is_for_trade, is_for_sale) VALUES
  (1, 1, 1, 2, 'Mint', 10, TRUE, TRUE),
  (2, 2, 2, 1, 'Near Mint', 9, FALSE, TRUE),
  (3, 3, 3, 3, 'Good', 7, TRUE, FALSE),
  (4, 4, 4, 1, 'Excellent', 8, TRUE, TRUE),
  (5, 5, 5, 5, 'Light Played', 6, FALSE, FALSE);

-- Insert Trades
INSERT INTO Trade (Id, sender_user_id, receiver_user_id, initiated_at, status) VALUES
  (1, 1, 2, '2025-09-10 15:00:00', 'Completed'),
  (2, 3, 1, '2025-09-14 16:30:00', 'Pending'),
  (3, 4, 5, '2025-09-15 14:20:00', 'Cancelled');

-- Insert TradeItems
INSERT INTO TradeItem (Id, trade_id, first_user_id, second_user_id, first_user_card_id, second_user_card_id, first_card_quantity, second_card_quantity) VALUES
  (1, 1, 1, 2, 1, 2, 1, 1),
  (2, 2, 3, 1, 3, 1, 2, 1),
  (3, 3, 4, 5, 4, 5, 1, 3);

-- Insert Listings
INSERT INTO Listing (Id, user_card_id, price, listed_at, status) VALUES
  (1, 2, 100.00, '2025-09-14 17:30:00', 'Active'),
  (2, 3, 15.00, '2025-09-14 18:10:00', 'Sold'),
  (3, 4, 50.00, '2025-09-15 09:50:00', 'Active'),
  (4, 5, 30.00, '2025-09-15 12:00:00', 'Cancelled');

-- Insert Transactions
INSERT INTO Transactions (Id, listing_id, buyer_user_id, seller_user_id, price, transaction_date) VALUES
  (1, 2, 1, 3, 15.00, '2025-09-14 18:15:00'),
  (2, 3, 5, 4, 50.00, '2025-09-15 10:10:00');
