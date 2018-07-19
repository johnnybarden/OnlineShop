INSERT INTO customer (id, role, username, password, is_blocked, first_name, address, phone_number, second_name) VALUES
    (1, 'ADMIN', 'admin', '$2a$10$OUwX3BY0RWAA71PjsLHvwu6CwnqKsqQMVBV/FNywy1a0xMvkg0NAS', 'false', 'Alexandr', 'Address', '7 999 021 06 14', 'Anatolyevich'),
    (2, 'USER', 'user', '$2a$10$OUwX3BY0RWAA71PjsLHvwu6CwnqKsqQMVBV/FNywy1a0xMvkg0NAS', 'false', 'Natalia','Address', '7 999 021 06 14', 'Aydarrova'),
    (3, 'USER', 'blocked_user', '$2a$10$OUwX3BY0RWAA71PjsLHvwu6CwnqKsqQMVBV/FNywy1a0xMvkg0NAS', 'true','Michail', 'Address',
    '7 999 021 06 14', 'Popov'),
    (4, 'USER', 'russian_guy', '$2a$10$OUwX3BY0RWAA71PjsLHvwu6CwnqKsqQMVBV/FNywy1a0xMvkg0NAS', 'false','Миша', 'Петроградская, д 10',
    '7 999 021 06 14', 'Андрианов');

INSERT INTO product (id, name, category, price, image_url) VALUES
    (1, 'Phoenix', 'STAR_TREK' ,7500, 'phoenix_st.jpg'),
    (2, 'J class', 'STAR_TREK' ,7500, 'j-class.jpg'),
    (3, 'Enterprise NX-01', 'STAR_TREK' ,7500, 'enterprise.jpg'),
    (4, 'USS Centaur NCC-42043', 'STAR_TREK' ,7500, 'centaur.jpg'),
    (5, 'USS Nova NCC-73515', 'STAR_TREK' ,7500, 'nova.jpg'),
    (6, 'USS Intrepid NCC-74600', 'STAR_TREK' ,7500, 'intrepid.jpg'),
    (7, 'Sh''Ran', 'STAR_TREK' ,7500, 'shran.jpg'),
    (8, 'IKS Negh''Var', 'STAR_TREK' ,7500, 'negh.jpg'),
    (9, 'IKS Orantho', 'STAR_TREK' ,7500, 'bird.jpg'),
    (10, 'Kumari', 'STAR_TREK' ,7500, 'kumari.jpg'),
    (11, 'USS Defiant NX-74205', 'STAR_TREK' ,7500, 'defant.jpg'),
    (12, 'USS Victory NCC-9754', 'STAR_TREK' ,7500, 'victory.jpg'),
    (13, 'Delta', 'STAR_TREK' ,7500, 'delta.jpg'),
    (14, 'Millennium falcon', 'STAR_WARS' ,7500, 'millennium.jpg'),
    (15, 'Acclamator-II ', 'STAR_WARS' ,7500, 'acclamator.jpg'),
    (16, 'Imperator-I', 'STAR_WARS' ,7500, 'imperator1.jpg'),
    (17, 'Imperator-II', 'STAR_WARS' ,7500, 'imperator.jpg');

INSERT INTO order_table (id, status, user_id) VALUES
    (1, 'NEW', 1),
    (2, 'NEW', 2);

INSERT INTO product_in_order (id, quantity, order_id, product_id) VALUES
    (default , 9, 1, 2),
    (default , 6, 1, 3),
    (default , 3, 1, 1),
    (default , 1, 2, 4);