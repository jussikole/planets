// Generated by CoffeeScript 1.7.1
var Controls;

Controls = (function() {
  function Controls(graphics, throttleAcceleration) {
    this.throttle = 0;
    graphics.svg.on('mousedown', (function(_this) {
      return function() {
        return _this.throttle = throttleAcceleration;
      };
    })(this));
    graphics.svg.on('mouseup', (function(_this) {
      return function() {
        return _this.throttle = 0;
      };
    })(this));
  }

  return Controls;

})();
