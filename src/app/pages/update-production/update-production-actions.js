
var UpdateProductionActions = {
    createAuthor: function (actionContext, payload, done) {
      actionContext.service.create('people', {}, payload, function (err, result) {
        console.log(arguments);
      });
    },
    getAuthorMatches: function (actionContext, payload, done) {
      if (!payload.first_name && !payload.middle_name && !payload.last_name) {
        done();
        return;
      }
      
      actionContext.service.read('people', { matchers: payload }, {}, function (err, result) {
        if (err) {
          done(err);
        } else {
          actionContext.dispatch('authorsMatched', result);
        }
      });
    }
};

module.exports = UpdateProductionActions;