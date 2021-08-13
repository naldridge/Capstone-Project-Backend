CREATE TABLE "channels" (
  "id" serial PRIMARY KEY,
  "name" varchar(200) NOT NULL,
  "slug" varchar(200) UNIQUE,
  "description" varchar(500),
  "default_channel" boolean DEFAULT FALSE,
  "protected" boolean
);

CREATE TABLE "users" (
  "id" serial PRIMARY KEY,
  "username" varchar(20),
  "full_name" varchar(100),
  "email" varchar(100),
  "channel_favorites" int,
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
  "id" serial PRIMARY KEY,
  "channel_id" int,
  "title" varchar(100),
  "text_content" varchar(1000),
  "mm_content" varchar(100),
  "link_content" varchar(100),
  "likes" int
);

CREATE TABLE "comments" (
  "id" serial PRIMARY KEY,
  "channel_id" int,
  "post_id" int,
  "chained_id" int,
  "text_content" varchar(1000),
  "mm_content" varchar(100),
  "link_content" varchar(100),
  "likes" int
);

ALTER TABLE "users" ADD CONSTRAINT "user_posts" FOREIGN KEY ("post_history") REFERENCES "posts" ("id");

ALTER TABLE "users" ADD CONSTRAINT "user_comments" FOREIGN KEY ("comment_history") REFERENCES "comments" ("id");

ALTER TABLE "comments" ADD CONSTRAINT "post_comments" FOREIGN KEY ("post_id") REFERENCES "posts" ("id");

ALTER TABLE "comments" ADD CONSTRAINT "chain_comments" FOREIGN KEY ("chained_id") REFERENCES "comments" ("id");

ALTER TABLE "posts" ADD CONSTRAINT "channel_posts" FOREIGN KEY ("channel_id") REFERENCES "channels" ("id");

ALTER TABLE "users" ADD CONSTRAINT "channel_members" FOREIGN KEY ("channel_member") REFERENCES "channels" ("id");

ALTER TABLE "users" ADD CONSTRAINT "channel_favorites" FOREIGN KEY ("channel_favorites") REFERENCES "channels" ("id");

ALTER TABLE "users" ADD CONSTRAINT "channel_moderators" FOREIGN KEY ("channel_moderator") REFERENCES "channels" ("id");

ALTER TABLE "users" ADD CONSTRAINT "user_followers" FOREIGN KEY ("mbr_following") REFERENCES "users" ("id");

ALTER TABLE "users" ADD CONSTRAINT "user_blocked" FOREIGN KEY ("mbr_blocked") REFERENCES "users" ("id");

ALTER TABLE "posts" ADD CONSTRAINT "post_likes" FOREIGN KEY ("likes") REFERENCES "users" ("id");

ALTER TABLE "comments" ADD CONSTRAINT "comments_likes" FOREIGN KEY ("likes") REFERENCES "users" ("id");
