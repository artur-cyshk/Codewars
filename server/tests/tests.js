var chai = require('chai');
var expect = chai.expect; // we are using the "expect" style of Chai
var honorService = require('../application/services/honorByLevel');
var taskService = require('../application/services/taskService');
var tasksService = require('../application/services/tasksService');

describe('HonorLevel', function() {
    it('honor of first level', function() {
        expect(honorService.getHonor(1)).to.equal(10);
    });
    it('honor of undefined level', function() {
        expect(honorService.getHonor(undefined)).to.equal(0);
    });
    it('honor of third level', function() {
        expect(honorService.getHonor(3)).to.equal(30);
    });
    it('honor of fifth level', function() {
        expect(honorService.getHonor(5)).to.equal(50);
    });
    it('honor of seventh level', function() {
        expect(honorService.getHonor(7)).to.equal(70);
    });
});

describe('taskService.isEmptyResults', function() {
    it('undefined result', function() {
        expect(taskService.isEmptyResults([{'result' : undefined}])).to.equal(true);
    });
    it('result 10', function() {
        expect(taskService.isEmptyResults([{'result' : undefined},{'result': 10}])).to.equal(false);
    });
    it('empty variables and undefined result', function() {
        expect(taskService.isEmptyResults([{'result' : undefined},{ variables:[]}])).to.equal(true);
    });
});

describe('taskService.jsonErrorParse', function() {
    it('value = [1,2,3]', function() {
        expect(taskService.jsonErrorParse("[1,2,3]")).to.equal(false);
    });
    it('value = [1,2,\'3\']', function() {
        expect(taskService.jsonErrorParse("[1,2,'3']")).to.equal(true);
    });

    it('value = ["1","2"]', function() {
        expect(taskService.jsonErrorParse('["1","2"]')).to.equal(false);
    });
});

describe('taskService.mapTypes', function() {
    it('types = [{typeId : 1}, {typeId : 2},{typeId : 3}], userId = 1', function() {
        expect(taskService.mapTypes([{typeId : 1}, {typeId : 2},{typeId : 3}], 1)).to.deep.equal([[1, 1], [2,1], [3,1]]);
    });
    it('value = [{typeId : "17"}, {typeId : 55}], userId = 3 ', function() {
        expect(taskService.mapTypes([{typeId : '17'}, {typeId : 55}], 3)).to.deep.equal([['17', 3], [55,3]]);
    });

});

describe('tasksService.checkFilter', function() {
    it('filter with sortBy, levels and types without authorized', function() {
        expect(tasksService.checkFilter(
            { sortBy: 'date',
                sortOrder: 'Z-A',
                group: 'all',
                levels: [ 1, 2, 3, 5, 6, 7, 8, 'without level' ],
                types: [ 'Algebra' ] 
            },
            undefined,
            undefined
        )).to.deep.equal( { where: ' where  level in (1,2,3,5,6,7,8)  or  level is NULL  and  types.type_name in ("Algebra") ',
            join: ' join tasks_types using (task_id) join types using(type_id) ',
            sort: 'DESC',
            sortBy: ' order by tasks.add_date ' } );
    });

    it('filter with sortOrder, level and types without authorized', function() {
        expect(tasksService.checkFilter(
            { sortBy: 'level',
                sortOrder: 'A-Z',
                group: 'all',
                levels: [ 1 ],
                types: [ 'Algebra', 'Classes', 'Design Principles', 'Graphs' ] },
            undefined,
            undefined
        )).to.deep.equal(
            { where: ' where  level in (1)  and  types.type_name in ("Algebra","Classes","Design Principles","Graphs") ',
                join: ' join tasks_types using (task_id) join types using(type_id) ',
                sort: 'ASC',
                sortBy: ' order by tasks.level ' }
        );
    });

    it('filter with user authorized', function() {
        expect(tasksService.checkFilter(
            { sortBy: 'name',
                sortOrder: 'A-Z',
                group: 'done',
                levels: [ 1, 4, 5, 6, 8 ],
                types:
                    [ 'Cryptography',
                        'Fundamentals',
                        'Prototypes',
                        'Arithmetic',
                        'Algebra',
                        'Algorithms',
                        'Arrays' ] },
            true,
            38
        )).to.deep.equal(
            { where: ' where  solutions.user_id = "38"  and  level in (1,4,5,6,8)  and  types.type_name in ("Cryptography","Fundamentals","Prototypes","Arithmetic","Algebra","Algorithms","Arrays") ',
                join: ' join solutions using(task_id)  join tasks_types using (task_id) join types using(type_id) ',
                sort: 'ASC',
                sortBy: ' order by tasks.name ' }
        );
    });

});