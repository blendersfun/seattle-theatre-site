module.exports = {
  pages: {},
  registerPage: function (name, component) {
    this.pages[name] = component;
  },
  getPage: function (name) {
    return this.pages[name];
  }
};
