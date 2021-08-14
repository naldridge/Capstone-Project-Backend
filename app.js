'use strict';

const http = require('http');
const hostname = '127.0.0.1';
const port = 3333;

const cors = require('cors');

const express = require('express');
const app = express();

app.use(express.json());
app.use(express.urlencoded({extended: false}));
app.use(express.static('public'));

app.use(cors());

const server = http.createServer(app);

server.listen(port, hostname, () => {
    console.log(`Server is running on http://${hostname}:${port}`);
    });

const rootController = require('./routes/index');
const userController = require('./routes/users');
const channelController = require('./routes/channels');

app.use('/', rootController);
app.use('/user', userController);
app.use('/channel', channelController);


