CREATE TABLE "channels" (
  "id" int PRIMARY KEY,
  "name" varchar(200) NOT NULL,
  "description" varchar(500),
  "default" boolean,
  "protected" boolean
);

CREATE TABLE "users" (
  "id" int PRIMARY KEY,
  "username" varchar(20),
  "full_name" varchar(100),
  "email" varchar(100),
  "channel_moderator" int,
  "channel_member" int,
  "post_history" int,
  "comment_history" int,
  "event_history" int,
  "date_created" date,
  "mbr_following" int,
  "mbr_blocked" int,
  "admin" boolean
);

CREATE TABLE "posts" (
  "id" int PRIMARY KEY,
  "channel_id" int,
  "title" varchar(100),
  "body" varchar(1000),
  "likes" int
);

CREATE TABLE "comments" (
  "id" int PRIMARY KEY,
  "channel_id" int,
  "post_id" int,
  "chained_id" int,
  "body" varchar(1000),
  "likes" int
);

ALTER TABLE "posts" ADD CONSTRAINT "user_posts" FOREIGN KEY ("id") REFERENCES "users" ("post_history");

ALTER TABLE "posts" ADD CONSTRAINT "post_likes" FOREIGN KEY ("likes") REFERENCES "users" ("id");

ALTER TABLE "posts" ADD CONSTRAINT "channel_posts" FOREIGN KEY ("channel_id") REFERENCES "channels" ("id");

ALTER TABLE "comments" ADD CONSTRAINT "user_comments" FOREIGN KEY ("id") REFERENCES "users" ("comment_history");

ALTER TABLE "comments" ADD CONSTRAINT "post_comments" FOREIGN KEY ("post_id") REFERENCES "posts" ("id");

ALTER TABLE "comments" ADD CONSTRAINT "chain_comments" FOREIGN KEY ("chained_id") REFERENCES "comments" ("id");

ALTER TABLE "comments" ADD CONSTRAINT "comment_likes" FOREIGN KEY ("likes") REFERENCES "users" ("id");

ALTER TABLE "users" ADD CONSTRAINT "channel_members" FOREIGN KEY ("channel_member") REFERENCES "channels" ("id");

ALTER TABLE "users" ADD CONSTRAINT "channel_moderators" FOREIGN KEY ("channel_moderator") REFERENCES "channels" ("id");

ALTER TABLE "users" ADD CONSTRAINT "user_followers" FOREIGN KEY ("mbr_following") REFERENCES "users" ("id");

ALTER TABLE "users" ADD CONSTRAINT "user_blocked" FOREIGN KEY ("mbr_blocked") REFERENCES "users" ("id");




