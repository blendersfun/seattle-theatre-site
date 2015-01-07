module.exports = {
	pages: {},
	registerPage: function (name, pageComponentFactory) {
		this.pages[name] = pageComponentFactory;
	},
	getPage: function (name) {
		return this.pages[name] || null;
	}
};