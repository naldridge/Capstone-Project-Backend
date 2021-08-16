'use strict';

const express = require('express');
const router = express.Router();
const CommentModel = require('../models/CommentModel');

router.get('/show_comments', async (req, res) => {
    if (req.body.post_id) {
        const { post_id } = req.body;
        const comment = await CommentModel.getByPost(post_id);

        if (comment) {
            res.json(comment).sendStatus(200);
        } else {
            res.sendStatus(400).send('No comments on this post yet.');
        }
    } else if (req.body.user_id) {
        const { user_id } = req.body;
        const comment = await CommentModel.getByUser(user_id);

        if (comment) {
            res.json(comment).sendStatus(200);
        } else {
            res.sendStatus(400).send('This user has not commented yet.');
        }
    } else {
        res.redirect('/');
    }
})

router.post('/add', async (req, res) => {
    const { channel_id, post_id, chained_id, text_content, mm_content, link_content, user_id } = req.body;

    const newComment = new CommentModel(null, channel_id, post_id, chained_id, text_content, mm_content, link_content, user_id);
    const response = await newComment.addEntry();
    res.sendStatus(200);
})

module.exports = router;