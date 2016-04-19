var adminService,
	changeProfileService,
	managementTaskService,
	leadersService,
	httpMock;

beforeEach(function () {
	module('codewars');
	inject(function ($injector,$httpBackend) {
		adminService = $injector.get('adminService');
		changeProfileService = $injector.get('changeProfileService');
		managementTaskService = $injector.get('managementTaskService');
		leadersService = $injector.get('leadersService');
		httpMock = $httpBackend;

	});

});

describe("adminService.getModalText", function () {
	it('level = 3, name = mapArray', function() {
		expect(adminService.getText('level', 'mapArray', '3')).toEqual("Selected task : <span class='name'>mapArray</span><br> Selected level : <span class='name'>3<span class='name'>");
	});
	it('role = admin, name = Uzver', function() {
		expect(adminService.getText('role', 'Uzver', 'admin')).toEqual("Selected user : <span class='name'>Uzver</span><br> Selected role : <span class='name'>admin<span class='name'>");
	});
	it('type = Math', function(){
		expect(adminService.getText('newType', 'Math')).toEqual("New type : <span class='name'>Math</span>");
	});
	it('type = Math', function(){
		expect(adminService.getText('removeType', 'Math')).toEqual("Task to remove : <span class='name'>Math</span>");
	});
	it('other tab', function(){
		expect(adminService.getText('admins')).toBeUndefined();
	})
});

describe("changeProfileService.validate", function () {
	it('state = name,  empty user', function() {
		expect(changeProfileService.validate('name',{})).toBeTruthy();
	});
	it('state = name,  user name length < 4', function() {
		expect(changeProfileService.validate('name', {name : 'art'})).toBeTruthy();
	});
	it('state = name,  user name length > 4', function() {
		expect(changeProfileService.validate('name',{name : 'artur'})).not.toBeTruthy();
	});
	it('state = clan,  user clan empty', function() {
		expect(changeProfileService.validate('clan',{clan : ''})).toBeTruthy();
	});
	it('state = password, passwords length < 8', function() {
		expect(changeProfileService.validate('password',{password : '123'})).toBeTruthy();
	});
	it('state = password, passwords not equal', function() {
		expect(changeProfileService.validate('password',{password : '12345678', repeatedPassword : '12345677'})).toBeTruthy();
	});
	it('state = password, passwords equal', function() {
		expect(changeProfileService.validate('password',{password : '12345678', repeatedPassword : '12345678'})).not.toBeTruthy();
	});

});

describe("managementTaskService.isEmpty object", function () {
	it('object without data', function() {
		expect(managementTaskService.isEmpty({})).toBeTruthy();
	});
	it('object with data', function() {
		expect(managementTaskService.isEmpty({'flag' : true})).not.toBeTruthy();
	});
});

describe("managementTaskService.isEmptyResult", function () {
	it("index in array", function() {
		expect(managementTaskService.isEmptyResult([1,2,3], 3)).toBeTruthy();
	});
	it("index out of array", function() {
		expect(managementTaskService.isEmptyResult([1,2,3], 5)).not.toBeTruthy();
	});
});

describe("managementTaskService.validate errors", function () {

	it("good validation", function() {
		var opt = managementTaskService.getTinymseOptions();
		opt.setDescriptionContent ('test');
		expect(managementTaskService.validate({
			name : 'testTaks',
			language : {'name' : 'test'},
			entryPoint : 'test',
			types : ['type1','type2'],
			tests : [{result : 'test1'},
					{result : 'test2'},
					{result : 'test3'},
					{result : 'test4'},
					{result : 'test5'}]
		})).not.toBeTruthy();
	});

	it("error validation, types undefined", function() {
		var opt = managementTaskService.getTinymseOptions();
		opt.setDescriptionContent ('test');
		expect(managementTaskService.validate({
			name : 'testTaks',
			language : {'name' : 'test'},
			entryPoint : 'test',
			tests : [{result : 'test1'},
				{result : 'test2'},
				{result : 'test3'},
				{result : 'test4'},
				{result : 'test5'}]
		})).toEqual({ name: false,
			language: false,
			entryPoint: false,
			types: true,
			tests: Object({ length: false, results: [] }),
			description: false,
			no: false });
	});

	it("error validation, description empty", function() {
		var opt = managementTaskService.getTinymseOptions();
		opt.setDescriptionContent ('');
		expect(managementTaskService.validate({
			name : 'testTaks',
			language : {'name' : 'test'},
			entryPoint : 'test',
			types : 'test',
			tests : [{result : 'test1'},
				{result : 'test2'},
				{result : 'test3'},
				{result : 'test4'},
				{result : 'test5'}]
		})).toEqual({ name: false,
			language: false,
			entryPoint: false,
			types: false,
			tests: Object({ length: false, results: [  ] }),
			description: true,
			no: false });
	});

	it("error validation, language not object, description empty, name : undefined", function() {
		var opt = managementTaskService.getTinymseOptions();
		opt.setDescriptionContent ('');
		expect(managementTaskService.validate({
			language : '',
			entryPoint : 'test',
			types : 'test',
			tests : [{result : 'test1'},
				{result : 'test2'},
				{result : 'test3'},
				{result : 'test4'},
				{result : 'test5'}]
		})).toEqual({ name: true,
			language: true,
			entryPoint: false,
			types: false,
			tests: Object({ length: false, results: [  ] }),
			description: true,
			no: false });
	});

	it("error validation, tests length < 5", function() {
		var opt = managementTaskService.getTinymseOptions();
		opt.setDescriptionContent ('test');
		expect(managementTaskService.validate({
			language : '',
			entryPoint : 'test',
			types : 'test',
			tests : [{result : 'test1'},
				{result : 'test2'},
				{result : 'test3'},
				{result : 'test4'}]
		})).toEqual({ name: true,
			language: true,
			entryPoint: false,
			types: false,
			tests: Object({ length: true, results: [  ] }),
			description: false,
			no: false });
	});

	it("error validation, test with index 3 has no result variable", function() {
		var opt = managementTaskService.getTinymseOptions();
		opt.setDescriptionContent ('test');
		expect(managementTaskService.validate({
			language : '',
			entryPoint : 'test',
			types : 'test',
			tests : [{result : 'test1'},
				{result : 'test2'},
				{result : 'test3'},
				{variable : 'test4'},
				{result : 'test4'}]
		})).toEqual({ name: true,
			language: true,
			entryPoint: false,
			types: false,
			tests: Object({ length: false, results: [ 3 ] }),
			description: false,
			no: false });
	});
});
//todo
describe('cDashboard', function(){
	it("should get 'pig' from '/data'", function () {
		httpMock.whenGET("/leaders/0").respond([{name:'artur', clan:'bsuir', honor:'11',avatarUrl : 'test'}]);
		leadersService.getLeaders(0)
			.success(function (err, data) {
				expect(data).toEqual({name:'arturlkoadkoad', clan:'bsuir', honor:'11',avatarUrl : 'test'});
				httpMock.flush();
			})
			.error(function (err, data) {
				httpMock.flush();
				console.log(err,data);
			});
	});
});

