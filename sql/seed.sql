INSERT INTO channels
(channel_name, slug, description, default_channel)
VALUES
('DevAdvice', 'devadvice', 'Talk and ask questions with senior Devs! Share some knowledge!', TRUE ),
('Ruby', 'ruby', 'Get it all out in the open. RUBY IS KING!', FALSE),
('Web Design', 'webdesign', 'Be honest, CSS is the powerhouse of web development.', TRUE),
('Javascript', 'javascript', 'Share your awesome functions and spread that javascript around!', TRUE),
('WindowsOS', 'windowsos', 'The trials and tribulations of programming on a Windows machine.', FALSE);

INSERT INTO users
(username, full_name, email, channel_moderator, channel_member)
VALUES
('NickA', 'Nick Aldridge', 'nicka@fakeemail.com', 1, 2),
('DavidV', 'David Vasek', 'davidv@fakeemail.com', 2, 4),
('BrittanyF', 'Brittany Fisher', 'brittanyf@fakeemail.com', 2, 2),
('ImmanuelA', 'Immanuel Alexander', 'immanuela@fakeemail.com', null, 3);

INSERT INTO posts
(channel_id, title, text_content, user_id)
VALUES
(1, 'What To Do While You Are Waiting To Get Hired', 'The time you have while waiting to land that interview and score that job can be crucial. There are useful ways to spend your time and level-up your skills.... ', 1),
(2, 'Ruby, On or Off the Rails?', 'Story Time: I started coding back....', 3),
(3, 'Resources to Spark Imagination', 'We all need it. The muse needs fuel. Check out these sites below:...', 1),
(4, 'API', 'Can someone help me, I am trying to create my own API', 3),
(5, 'I Love/Hate Windows...', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 2),
(1, 'Developer Bootcamp Recommendation', 'DigitalCrafts is by far the best experience I have had in a learning environment. I can and have recommended it to anyone that will listen.', 1),
(3, 'Picking Color Schemes', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 4),
(4, 'Placeholder Text', 'Can anyone recommend a good source for placeholder text?', 4),
(1, 'Anybody else noticing this?', 'Who knows how to get WSL working? I have soo many issues.', 3);


INSERT INTO comments
(channel_id, post_id, text_content, user_id)
VALUES
(1, 1, 'Thanks so much! I now know what I will be doing this weekend.', 2),
(1, 1, 'But what do you do when you run out of projects to work on?', 3),
(4, 8, 'Try googling Lorem Ipsum Generator.', 1),
(3, 7, 'Can you recommend any schemes for someone who is colorblind?', 2),
(1, 9, 'Do not even get me started!', 1),
(3, 3, 'Are you going to list any sites? All I see are ellipsis.', 4),
(3, 3, 'He may have passed out', 2),
(3, 3, 'Favorite and forget', 3),
(1, 6, 'Thanks Sean Reid! You really did an amazing job!', 1);

