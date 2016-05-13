var adminService,
	changeProfileService,
	managementTaskService,
	leadersService,
	taskSolutionService;

beforeEach(function () {
	module('codewars');
	inject(function ($injector) {
		adminService = $injector.get('adminService');
		changeProfileService = $injector.get('changeProfileService');
		managementTaskService = $injector.get('managementTaskService');
		leadersService = $injector.get('leadersService');
		taskSolutionService = $injector.get('taskSolutionService');
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
			tests : [{"result" : 1},
				{"result" : 2},
				{"result" : 3},
				{"result" : 4},
				{"result" : 5}]
		})).not.toBeTruthy();
	});

	it("error validation, types undefined and last test bad variable", function() {
		var opt = managementTaskService.getTinymseOptions();
		opt.setDescriptionContent ('test');
		expect(managementTaskService.validate({
			name : 'testTaks',
			language : {'name' : 'test'},
			entryPoint : 'test',
			tests : [{"result" : 3},
				{"result" : 1},
				{"result" : 2},
				{"result" : 'test4'},
				{"result" : {'1' : 2}, variables : [{"0"  : '22'}]}]
		})).toEqual({ name: false,
			language: false,
			entryPoint: false,
			types: true,
			tests: Object({ length: false, results: [{result : false, variables : []},
						{result : false, variables : []},
						{result : false, variables : []},
						{result : true, variables : []},
						{result : true, variables : [0]}] }
			),
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
			tests : [{result : 1},
				{result : 2},
				{result : 3},
				{result : 4},
				{result : 5}]
		})).toEqual({ name: false,
			language: false,
			entryPoint: false,
			types: false,
			tests: Object({ length: false, results: [{result : false, variables : []},
						{result : false, variables : []},
						{result : false, variables : []},
						{result : false, variables : []},
						{result : false, variables : []}] }
			),
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
			tests : [{result : 1},
				{result : 2},
				{result : 3},
				{result : 4},
				{result : 5}]
		})).toEqual({ name: true,
			language: true,
			entryPoint: false,
			types: false,
			tests: Object({ length: false, results: [{result : false, variables : []},
						 {result : false, variables : []},
						 {result : false, variables : []},
						 {result : false, variables : []},
						 {result : false, variables : []}] }
			),
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
			tests : [{result : 1},
				{result : 2},
				{result : 3},
				{result : 4}]
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
			tests : [{result : 1},
				{result : 2},
				{result : 3},
				{result : 5},
				{res : 55}]
		})).toEqual({ name: true,
			language: true,
			entryPoint: false,
			types: false,
			tests: Object({ length: false, results: [{result : false, variables : []},
				{result : false, variables : []},
				{result : false, variables : []},
				{result : false, variables : []},
				{result : true, variables : []}] }
			),
			description: false,
			no: false });
	});
});

describe("taskSolutionService.getFunctionText", function () {
	it('sum function name', function(){
		expect(taskSolutionService.getSolutionEntryText('sum')).toEqual('function sum() {\n\t\n}');
	});
	it('getAllNames function name', function(){
		expect(taskSolutionService.getSolutionEntryText('getAllNames')).toEqual('function getAllNames() {\n\t\n}');
	});
	it('getInfo function name', function(){
		expect(taskSolutionService.getSolutionEntryText('getInfo')).toEqual('function getInfo() {\n\t\n}');
	});
});
