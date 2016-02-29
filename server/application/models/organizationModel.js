mongoose = require( '../config/mongooseConnect');
Schema = mongoose.Schema;

var organizationSchema = Schema({
	name : {
		type : String,
		required: true
	},
	information : String ,
	address : String ,
	phone : String ,
	employeeCount : Number ,
	additionalInformation : String ,
	creationDate : Date ,
	type : {
		type: Schema.Types.ObjectId,
		ref : 'Type'
	} ,
	director : {
		type: Schema.Types.ObjectId,
		ref: 'Director'
	}
})
exports.organizationModel = mongoose.model ( 'Organization' , organizationSchema );