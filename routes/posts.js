'use strict';

const express = require('express');
const router = express.Router();
const PostModel = require('../models/PostModel');


router.get('/show_posts/:channel_id?', async (req, res) => {
    if (req.params.channel_id) {
        const { channel_id } = req.params;
        const post = await PostModel.getByChannel(channel_id);

        if (post) {
            res.json(post);
        } else {
            res.sendStatus(400).send('No posts on this channel yet.');
        }
    } else {
        res.redirect('/');
    }
})

router.post('/add', async (req, res) => {
    const { channel_id, title, text_content, mm_content, link_content, user_id } = req.body;

    const newPost = new PostModel(null, channel_id, title, text_content, mm_content, link_content, user_id);
    const response = await newPost.addEntry();
    res.sendStatus(200);
})

module.exports = router;