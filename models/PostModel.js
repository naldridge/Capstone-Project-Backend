'use strict';

const db = require('./conn');

class PostModel {
    constructor(id, channel_id, title, text_content, mm_content, link_content, likes, user_id, time_stamp, blocked) {
        this.id = id;
        this.channel_id = channel_id;
        this.title = title;
        this.text_content = text_content;
        this.mm_content = mm_content;
        this.link_content = link_content;
        this.likes = likes;
        this.user_id = user_id;
        this.time_stamp = time_stamp;
        this.blocked = blocked;
    }

    static async getByUser(user_id) {
        try {
            const response = await db.any(
                `SELECT * FROM posts
                WHERE user_id = '${user_id}';`
            );
            return response;
        } catch (err) {
            console.error('Error: ', err);
            return err;
        }
    }

    static async getByChannel(channel_id) {
        try {
            const response = await db.any(
                `SELECT * FROM posts
                WHERE channel_id = '${channel_id}';`
            );
            return response;
        } catch (err) {
            console.error('Error: ', err);
            return err;
        }
    }

    async addEntry() {
        try {
            const response = await db.result(
                `INSERT INTO posts (channel_id, title, text_content, mm_content, link_content, user_id)
                VALUES
                    ('${this.channel_id}', '${this.title}', '${this.text_content}', '${this.mm_content}', '${this.link_content}', '${this.user_id}');`
            );
            return response;
        } catch (err) {
            console.error('Error: ', err);
            return err;
        }
    }
}

module.exports = PostModel;