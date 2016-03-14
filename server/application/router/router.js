var express = require('express');
var router = express.Router();

router.get('/logout', require('./routes/logout'));
router.get('/authorized', require('./routes/authorized'));
router.get('/user', require('./routes/user'));
router.get('/types', require('./routes/types'));
router.get('/leaders/:page', require('./routes/leaders'));
router.get('/task/:task', require('./routes/task'));
router.post('/tasks', require('./routes/tasks'));
router.post('/login', require('./routes/login'));
router.post('/commit', require('./routes/commit'));
router.post('/toDoWithTask', require('./routes/toDoWithTask'));
router.post('/registration', require('./routes/registration'));
router.post('/changeProfile', require('./routes/changeProfile'));
module.exports = router;