class Controls
  constructor: (graphics, throttleAcceleration) ->
    
    @throttle = 0
    
    graphics.svg.on 'mousedown', =>
      @throttle = throttleAcceleration
      
    graphics.svg.on 'mouseup', =>
      @throttle = 0