const express = require('express');
const cors = require('cors');
const app = express();

app.use(cors());

app.get('/login/', (req, res, next) => {
    const user = req.query.user;
    const pass = req.query.pass;
    const id = Math.random() * 1000;
    res.json({ name: user, id: id });
});

app.listen(3000, () => {
    console.log('Servidor andando.');
});
