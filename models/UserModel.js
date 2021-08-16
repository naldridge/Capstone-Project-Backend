'use strict';

const db = require('./conn');

class UserModel {
    constructor(id, username, full_name, email, channel_favorites, channel_moderator, channel_member, date_created, mbr_following, mbr_blocked, admin) {
        this.id = id;
        this.username = username;
        this.full_name = full_name;
        this.email = email;
        this.channel_favorites = channel_favorites;
        this.channel_moderator = channel_moderator;
        this.channel_member = channel_member;
        this.date_created = date_created;
        this.mbr_following = mbr_following;
        this.mbr_blocked = mbr_blocked;
        this.admin = admin;
    }

    static async getByUsername(username) {
        try {
            const response = await db.any(
                `SELECT * FROM users
                WHERE username = '${username}';`
            );
            return response;
        } catch (err) {
            console.error('Error: ', err);
            return err;
        }
    }

    static async getBlockedMbrs(user_id) {
        try {
            const response = await db.any(
                `SELECT a.user_id Primary, b.username Blocked
                FROM users
                WHERE a.user_id = '${user_id}'
                INNER JOIN user b ON b.user_id = a.user_id;`
            );
            return response;
        } catch (err) {
            console.error('Error: ', err);
            return err;
        }
    }

    async addEntry() {
        try{
            const response = await db.result(
                `INSERT INTO users (username, full_name, email, date_created)
                VALUES
                    ('${this.username}', '${this.full_name}', '${this.email}', '${this.date_created}');`
            )
                return response;
        } catch (err) {
            console.error('Error: ', err);
            return err;
        }
    }
}

module.exports = UserModel;