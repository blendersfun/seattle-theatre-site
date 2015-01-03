
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
    CreateProduction: {
        path: '/create-production',
        method: 'get'
    }
});

module.exports = router;