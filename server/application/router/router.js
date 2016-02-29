var express = require('express');
var router = express.Router();

router.get('/types', require('./routes/getTypes.js').get);

module.exports = router;