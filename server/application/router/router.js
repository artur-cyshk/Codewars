var express = require('express');
var router = express.Router();
var multipartMiddleware = require('connect-multiparty')({
    uploadDir: '../client/content/images/avatars'
});

router.post('/testSolution', require('./routes/testSolution'));

router.get('/nullTasks/:page', require('./routes/nullTasks'));
router.get('/users/:page', require('./routes/users'));
router.get('/typesWithLimit/:page', require('./routes/typesWithLimit'));

router.put('/user/:id', require('./routes/changeUserRole'));
router.put('/task/level/:id', require('./routes/changeTaskLevel'));
router.post('/type', require('./routes/addType'));
router.delete('/type/:id', require('./routes/deleteType'));

router.get('/logout', require('./routes/logout'));
router.get('/authorized', require('./routes/authorized'));
router.get('/user', require('./routes/user'));
router.get('/languages', require('./routes/languages'));
router.get('/leaders/:page', require('./routes/leaders'));
router.get('/types', require('./routes/types'));

router.get('/task/:task', require('./routes/task'));
router.put('/task/:task', require('./routes/editTask'));
router.delete('/task/:task', require('./routes/deleteTask'));
router.post('/task', require('./routes/addTask'));

router.get('/taskWithTests/:task', require('./routes/taskWithTests'));
router.delete('/deleteCommit/:id', require('./routes/deleteCommit'));
router.post('/tasks', require('./routes/tasks'));

router.post('/uploadAvatar',multipartMiddleware, require('./routes/uploadAvatar'));
router.post('/login', require('./routes/login'));
router.post('/commit', require('./routes/commit'));
router.post('/toDoWithTask', require('./routes/toDoWithTask'));
router.post('/registration', require('./routes/registration'));
router.post('/changeProfile', require('./routes/changeProfile'));
module.exports = router;