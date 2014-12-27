module.exports = function (OverlayView) {
	function PinLabelOverlay (label, point, map) {
		this.label = label;
		this.point = point;
		this.map = map;

		this.div = null;

		this.setMap(map);
	}
	PinLabelOverlay.prototype = new OverlayView();
	PinLabelOverlay.prototype.onAdd = function () {
		var div = document.createElement('div');
		div.style.whiteSpace = 'nowrap';
		div.style.background = '#fff';
		div.style.position = 'absolute';
		div.innerHTML = this.label;

		this.div = div;

		var panes = this.getPanes();
		panes.overlayLayer.appendChild(div);
	};
	PinLabelOverlay.prototype.draw = function () {
		var overlayProjection = this.getProjection();
		var px = overlayProjection.fromLatLngToDivPixel(this.point);

		this.div.style.left = (px.x + 15) + 'px';
		this.div.style.top = (px.y - 35) + 'px';
	};
	PinLabelOverlay.prototype.onRemove = function() {
		this.div.parentNode.removeChild(this.div);
		this.div = null;
	};

	return PinLabelOverlay;
}