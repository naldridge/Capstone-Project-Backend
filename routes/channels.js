'use strict';

const express = require('express');
const router = express.Router();
const slugify = require('slugify');
const ChannelModel = require('../models/ChannelModel');
const PostModel = require('../models/PostModel');

router.get('/:slug?', async (req, res) => {
    if (req.params.slug) {
        const { slug } = req.params;
        const channel = await ChannelModel.getBySlug(slug);

        if (channel) {
            res.json(channel).status(200);
        } else {
            res.status(400).send(`No channel found that matches the description, ${slug}.`);
        }
    } else {
       res.redirect('/') 
    }
})

router.get('/default', async (req, res) => {
    const channel = await ChannelModel.getbyDefaultChannel();

    if (channel) {
        res.json(channel).status(200);
    } else {
        res.status(400).send(`No channel found that matches the description, default.`);
    }
})

router.post('/add_channel', async (req, res) => {
    //name attribute to fields that will be posted
    const { channel_name, channel_description, channel_default_channel, channel_protected } = req.body;

    const slug = slugify(channel_name, {
        replacement: '',
        lower: true,
        strict: true
    });
    
    const newChannel = new ChannelModel(null, channel_name, slug, channel_description, channel_default_channel, channel_protected);

    const response = await newChannel.addEntry();
    res.sendStatus(200);
})

router.post('/delete_channel', async (req, res) => {
    const { id } = req.body;
    const channelToDelete = new ChannelModel(id);

    const response = await channelToDelete.deleteEntry();
    res.sendStatus(200);
})

router.post('/add_post', async (req, res) => {
    const { channel_id, title, text_content, mm_content, link_content, user_id } = req.body;

    const newPost = new PostModel(null, channel_id, title, text_content, mm_content, link_content, user_id);
    const response = await newPost.addEntry();
    res.sendStatus(200);
})

module.exports = router;