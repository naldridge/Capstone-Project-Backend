INSERT INTO channels
(channel_name, slug, description, default_channel)
VALUES
('Nick channel', 'nickchannel', 'watch videos on how to become a better developer', TRUE ),
('David channel', 'davidchannel', 'post tools that you can not live without as a senior dev', FALSE),
('Brittany channel', 'brittanychannel', 'drop your favorite vscode extensions here', TRUE),
('Immanuel channel', 'Immanuelchannel', 'what do you wish you knew when you first became a dev', FALSE);

INSERT INTO users
(username, full_name, email, channel_moderator, channel_member)
VALUES
('NickA', 'Nick Aldridge', 'nicka@fakeemail.com', 1, 2),
('DavidV', 'David Vasek', 'davidv@fakeemail.com', 2, 4),
('BrittanyF', 'Brittany Fisher', 'brittanyf@fakeemail.com', 2, 2),
('ImmanuelA', 'Immanuel Alexander', 'immanuela@fakeemail.com', null, 3);
INSERT INTO posts
(channel_id, title, text_content, mm_content, link_content, user_id)
VALUES
(1, 'Backend', null, null, 'backendfake.com', 1),
(2, 'Frontend', 'Brittany is the best!!', null, null, 3),
(3, 'Fullstack', null, null, 'fullstackfake.com', 1),
(2, 'API', null, null, 'apifake.com', 3);
INSERT INTO comments
(channel_id, post_id, text_content, user_id)
VALUES
(2, 2, 'You right!', 2),
(2, 2, 'Also David!', 3);

