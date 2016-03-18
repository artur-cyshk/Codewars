angular.module('codewars').factory('levelsFactory', function() {
    return {
        mapColors : function(level) {
            var color = {};
            if(!level) {
                color.in = "rgb(64, 64, 64)";
                color.out ="rgb(171, 171, 171)";
            }else {

                if(level <= 2) {
                    color.in = "rgb(50, 82, 98)";
                    color.out ="rgb(104, 224, 244)";
                }
                if(level > 2 && level <= 4) {
                    color.in = "rgb(57, 50, 98)";
                    color.out ="rgb(106, 104, 244)";
                }
                if(level >= 5 && level < 8) {
                    color.in = "rgb(98, 50, 50)";
                    color.out ="rgb(244, 104, 104)";
                }

                if(level == 8) {
                    color.in = "rgb(50, 98, 65)";
                    color.out ="rgb(132, 244, 104)";
                }

            }

            return color;
        },
        getLevelByHonor : function(levels, userHonor) {
            var LAST_LEVEL = 7;
            var index = _.indexOf(levels, _.find(levels, function(level, i, levels) {
                var prevLevelHonor = 0;
                if(levels[i-1]) {
                    prevLevelHonor = levels[i-1].honor;
                }
                return  (userHonor < level.honor && userHonor >= prevLevelHonor)
            }));
            return (index == -1) ? LAST_LEVEL : index;
        },
        levelObjectMapping : function(userHonor) {
            var LEVEL_COUNT = 8;
            if(arguments.length) {
                var MAX_HONOR = 3600;
            }
            var levels = [];
            for(var i = 0; i< LEVEL_COUNT; i++) {
                levels[i] = {};
                var num = i + 1;
                var prevLevelHonor = 0;
                if(levels[i-1]) {
                    prevLevelHonor = levels[i-1].honor;
                }
                levels[i].honor = num * 100 + prevLevelHonor;
                levels[i].levelNum = num;
                if(arguments.length){
                    levels[i].diffHonor = (userHonor <= MAX_HONOR) ?levels[i].honor - prevLevelHonor : userHonor;
                    levels[i].currHonor = (userHonor <= MAX_HONOR) ? userHonor - prevLevelHonor : userHonor;
                }
                levels[i].color = this.mapColors(num);
            }
            return levels;
        }
    }
});