
/**
 * Module dependencies.
 */

var Router = require('routr');

var router = new Router({
    Home: {
        path: '/',
        method: 'get',
        serverAction: 'home/HomeActions'
    },
    Test: {
        path: '/test',
        method: 'get'
    }
});

module.exports = router;