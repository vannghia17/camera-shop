var express = require('express');
var router = express.Router();

router.get('/', (req, res, next) => {
    res.render('contact', {
        title: 'Liên hệ | CamShop'
    });
});

module.exports = router;