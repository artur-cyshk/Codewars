var express = require('express');
var router = express.Router();
var multipartMiddleware = require('connect-multiparty')({
    uploadDir: '../client/content/images/avatars'
});

router.get('/logout', require('./routes/logout'));
router.get('/authorized', require('./routes/authorized'));
router.get('/user', require('./routes/user'));
router.get('/types', require('./routes/types'));
router.get('/languages', require('./routes/languages'));
router.get('/leaders/:page', require('./routes/leaders'));
router.get('/task/:task', require('./routes/task'));
router.get('/taskWithTests/:task', require('./routes/taskWithTests'));
router.delete('/deleteTask/:task', require('./routes/deleteTask'));
router.delete('/deleteCommit/:id', require('./routes/deleteCommit'));
router.post('/tasks', require('./routes/tasks'));
router.post('/uploadAvatar',multipartMiddleware, require('./routes/uploadAvatar'));
router.post('/login', require('./routes/login'));
router.post('/commit', require('./routes/commit'));
router.post('/toDoWithTask', require('./routes/toDoWithTask'));
router.post('/registration', require('./routes/registration'));
router.post('/changeProfile', require('./routes/changeProfile'));
module.exports = router;