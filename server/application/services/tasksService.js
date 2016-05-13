var _ = require('lodash');
module.exports = {
    checkFilter : function (filter, authorized, userId) {
        var selectOptionsFilter = {};
        selectOptionsFilter.where = [];
        selectOptionsFilter.join = [];
        selectOptionsFilter.sort = "";
        selectOptionsFilter.sortBy = "";

        if(!filter) {
            return selectOptionsFilter;
        }

        if (authorized && filter.group) {
            switch (filter.group) {
                case 'own':
                    selectOptionsFilter.where.push(' tasks.user_id = "' + userId + '" ');
                    break;
                case 'favorite':
                    selectOptionsFilter.where.push(' favorites_tasks.user_id = "' + userId + '" ');
                    selectOptionsFilter.join.push(' join favorites_tasks using(task_id) ');
                    break;
                case 'later':
                    selectOptionsFilter.where.push(' later_tasks.user_id = "' + userId + '" ');
                    selectOptionsFilter.join.push(' join later_tasks using(task_id) ');
                    break;
                case 'done':
                    selectOptionsFilter.where.push(' solutions.user_id = "' + userId + '" ');
                    selectOptionsFilter.join.push(' join solutions using(task_id) ');
                    break;
                default:
                    break;
            }
        }

        if (!_.isEmpty(filter.levels)) {
            if( _.includes(filter.levels, 'without level') ) {
                var levelIsNull = ' level is NULL ' ;
                filter.levels = _.remove(filter.levels, function (level) {
                    return level != 'without level';
                });
            }
            if(filter.levels.length) {
                var allLevels = ' level in (' + filter.levels.join(',') + ') ';
            }

            if(levelIsNull && allLevels) {
                allLevels += ' or ' + levelIsNull;
            }else if(levelIsNull){
                allLevels = levelIsNull;
            }
            selectOptionsFilter.where.push(allLevels);
        }

        if (!_.isEmpty(filter.types)) {
            filter.types = '"' + filter.types.join('","') + '"';
            selectOptionsFilter.where.push(' types.type_name in (' + filter.types + ') ');
            selectOptionsFilter.join.push(' join tasks_types using (task_id) join types using(type_id) ');
        }


        if (filter.sortBy) {
            selectOptionsFilter.sortBy = (filter.sortBy == 'name' || filter.sortBy == 'level') ? filter.sortBy : 'add_date';
            selectOptionsFilter.sortBy = ' order by tasks.' + selectOptionsFilter.sortBy + ' ';
        }

        if (filter.sortOrder && filter.sortBy) {
            selectOptionsFilter.sort = (filter.sortOrder == 'A-Z') ? 'ASC' : 'DESC';
        }

        selectOptionsFilter.where = (_.isEmpty(selectOptionsFilter.where)) ? "" : ' where ' +  selectOptionsFilter.where.join(' and ');
        selectOptionsFilter.join = (_.isEmpty(selectOptionsFilter.join)) ? "" : selectOptionsFilter.join.join('');
        
        return selectOptionsFilter;
    }
};