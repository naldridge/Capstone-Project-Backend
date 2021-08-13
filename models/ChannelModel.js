'use strict';

const db = require('./conn');

class ChannelModel {
    constructor(id, name, slug, description, default_channel, protected) {
        this.id = id;
        this.name = name;
        this.slug = slug;
        this.description = description;
        this.default_channel = default_channel;
        this.protected = protected;
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
        } catch (err) {
            console.error('Error: ', err);
            return err;
        }
    }

}

module.exports = ChannelModel;