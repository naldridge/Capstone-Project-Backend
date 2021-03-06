'use strict';

const db = require('./conn');

class ChannelModel {
    constructor(id, channel_name, slug, description, default_channel) {
        this.id = id;
        this.channel_name = channel_name;
        this.slug = slug;
        this.description = description;
        this.default_channel = default_channel;
    }

    static async getAll() {
        try {
            const response = await db.any(
                `SELECT * FROM channels;`
            )
            return response;
        } catch (err) {
            console.error("Error: ", err);
            return err;
        }
    }

    static async getBySlug(slug) {
        try {
            const response = await db.one(
                `SELECT * FROM channels
                WHERE slug = '${slug}';`
            );
            return response;
        } catch (err) {
            console.error('Error: ', err);
            return err;
        }
    }

    static async getbyDefaultChannel() {
        try {
            const response = await db.any(
                `SELECT * FROM channels
                WHERE default_channel = true;`
                );
                return response;
        } catch (err) {
            console.error('Error: ', err);
            return err;
        }
    }

    static async getChannelMbr(channel_id) {
        try {
            const response = await db.any(
                `SELECT username FROM users
                WHERE channel_member LIKE '%${channel_id}%'`
            );
                return response;
        } catch (err) {
            console.error('Error: ', err);
            return err;
        }
    }

    static async getChannelMod(channel_id) {
        try {
            const response = await db.any(
                `SELECT username FROM users
                WHERE channel_moderator LIKE '%${channel_id}%'`
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
                `INSERT INTO channels (name, slug, description)
                VALUES
                    ('${this.name}', '${this.slug}', '${this.description}')
                    RETURNING id;`
            );
            return response;
        } catch (err) {
            console.error('Error: ', err);
            return err;
        }
    }

    async deleteEntry() {
        try {
            const response = await db.result(
                `DELETE FROM channels WHERE id = $1;`, [this.id]
            );
            return response;
        } catch (err) {
            console.error('Error: ', err);
            return err;
        }
    }

}

module.exports = ChannelModel;