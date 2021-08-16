'use strict';

const express = require('express');
const router = express.Router();
const UserModel = require('../models/UserModel');

router.get('/:username?', async (req, res) => {
    if (req.params.username) {
        const { username } = req.params;
        const user = await UserModel.getByUsername(username);

        if (user) {
            res.json(user).status(200);
        } else {
            res.status(400).send(`No user by the username, ${username}.`);
        } else {
            res.redirect('/');
        }
    }
})

router.post('/add', async (req, res) => {
    const { username, full_name, email, date_created } = req.body;

    const newUser = new UserModel(null, username, full_name, email, null, null, null, date_created, null, null);
    const reponse = await newUser.addEntry();
    res.sendStatus(200);
})

module.exports = router;