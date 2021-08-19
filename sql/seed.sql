INSERT INTO channels
(id, name, slug, description, default_channel)
VALUES
(12, 'Nick', 'Nick_channel', 'watch videos on how to become a better developer', FALSE ),
(13, 'David', 'David_channel', 'post tools that you can not live without as a senior dev', FALSE),
(14, 'Brittany', 'Brittanys_channel', 'drop your favorite vscode extensions here', FALSE),
(15, 'Immanuel', 'Immanuels_channel', 'what do you wish you knew when you first became a dev', FALSE);

INSERT INTO users
(id, username, full_name, email, channel_favorites, channel_moderator, channel_member, date_created, mbr_following, mbr_blocked)
VALUES
(12, 'NickA', 'Nick_Aldridge', 'nicka@fakeemail.com', 3, 5, 33, 2021-08-19, 1000, 2),
(13, 'DavidV', 'David Vasek', 'davidv@fakeemail.com', 4, 6, 34, 2021-18-19, 1001, 2),
(14, 'BrittanyF', 'Brittany_Fisher', 'brittanyf@fakeemail.com', 7, 4, 30, 2021-08-19, 1002, 2),
(15, 'ImmanuelA', 'Immanuel_Alexander', 'immanuela@fakeemail.com', 10, 2, 35, 2021-08-19, 1003, 2);
INSERT INTO posts
(id, channel_id, title, text_content, mm_content, link_content, likes, user_id)
VALUES
(12, 1, 'Backend', null, null, 'backendfake.com', 56, 13),
(13, 2, 'Frontend', null, null, 'frontendfake.com', 60, 14),
(14, 3, 'Fullstack', null, null, 'fullstackfake.com', 58, 15),
(15, 4, 'API', null, null, 'apifake.com', 70, 13);
INSERT INTO comments
(id, channel_id, link_content, user_id)
(15, 4, 'backendfake.com', 12),
(14, 3, 'frontendfake.com', 13),
(13, 2, 'fullstackfake.com', 14),
(12, 1, 'apifake.com', 12);
