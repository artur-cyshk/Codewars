var express = require('express');
var router = express.Router();

router.get('/types', function(req,res){
    console.log('z');
    res.end();
});

module.exports = router;