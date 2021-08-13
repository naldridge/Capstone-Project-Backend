'use strict';

const express = require('express');
const router = express.Router();
const slugify = require('slugify');
const ChannelModel = require('../models/ChannelModel');

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

module.exports = router;