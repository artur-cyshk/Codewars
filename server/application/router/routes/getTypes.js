//var typeModel = require('../models/organizationTypeModel').organizationTypeModel;
exports.get = function (req, res, next) {
	/*typeModel.find({},function(err, data){
	 return (err) ? next(err) : res.status(200).send(data);
	 })*/

	res.send({'name': 'Artur.Vechorko'});
};