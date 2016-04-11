var adminService;

beforeEach(function () {
	module('codewars');
	inject(function ($injector) {
		adminService = $injector.get('adminService');
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




