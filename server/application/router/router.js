var express = require('express');
var router = express.Router();

router.get('/logout', require('./routes/logout'));
router.get('/authorized', require('./routes/authorized'));
router.get('/user', require('./routes/user'));
router.post('/login', require('./routes/login'));
router.post('/registration', require('./routes/registration'));
router.post('/changeProfile', require('./routes/changeProfile'));
module.exports = router;