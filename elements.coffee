G = 3

class Element
  @_id = 1
  
  constructor: (options) ->
    
    defaults = 
      pos: new Vector()
      color: d3.rgb 0, 0, 0
      r: 20
      v: new Vector()
      orbit: null
    
    _.defaults options, defaults
    
    @id = Element._id++
    @pos = options.pos
    @color = options.color
    @r = options.r
    @v = options.v
    @orbit = options.orbit
    
  move: (dt, throttle) =>    
    if @orbit      
      d = Vector.distance @pos, @orbit.pos
      
      a = Vector
        .pointToPoint(@pos, @orbit.pos)
        .unit()
        .multiply(G * @orbit.mass / Math.pow(d, 2) - throttle)
        
      @v.add a.multiply(dt)      
      @pos.add @v.multiply(dt)      

    else
      @pos.add @v.multiply(dt)   
  
  drawFunction: () => (g) ->
      
  sizeX: () => @r 
  sizeY: () => @r
  
  isOrbiting: () => @orbit != null
            
  beginOrbit: (planet) =>    
    @orbit = planet
      
  endOrbit: () =>
    @orbit = null
        

class Planet extends Element
  constructor: (options) ->
    super(options)
    @mass = options.mass || 100
    @field = options.field || 100

  drawFunction: () => Graphics.drawPlanet
      
  sizeX: () => @field
  sizeY: () => @field
  
  isInGravityField: (element) =>
    Vector.distance(element.pos, @pos) <= @field
    
  hasCollided: (element) =>
    Vector.distance(element.pos, @pos) <= @r
    
  move: (dt) =>
    super(dt, 0)
  
  
class Obstacle extends Element
  constructor: (options) ->
    super(options)
    
  drawFunction: () => Graphics.drawObstacle
  
  move: (dt) =>
    super(dt, 0)
    
    
class Rocket extends Element
  constructor: (options, @controls) ->
    super(options)
    
  drawFunction: () => Graphics.drawRocket
    
  move: (dt) =>
    super(dt, controls.throttle)
    