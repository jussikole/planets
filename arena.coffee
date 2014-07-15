class Arena
  constructor: (@graphics, @dt) ->
    @planets = []
    @obstacles = []
    @rocket = null
    
  update: () =>    
    if not @isInside @rocket
      @graphics.showText 'Game over'
      return true
        
    if @rocket.isOrbiting()
      if not @rocket.orbit.isInGravityField @rocket
        console.log "orbit ended"
        @rocket.endOrbit()     
      else if @rocket.orbit.hasCollided @rocket
        @graphics.showText 'Game over'
        return true
    else
      rocket = @rocket
      inOrbitPlanets = _.filter @planets, (p) -> p.isInGravityField(rocket)
      inOrbitPlanets = _.sortBy inOrbitPlanets, (p) -> Vector.distance(p.pos, rocket.pos)
      
      if inOrbitPlanets[0]
        console.log "orbit started"
        rocket.beginOrbit inOrbitPlanets[0]
    
    e.move(@dt,0) for e in @allElements()
  
    @planets = @filter @planets  
    @obstacles = @filter @obstacles
    
    @graphics.update @allElements()
      
    false
    
  filter: (elements) =>
    _.filter elements, (element) => @isInside element
    
  isInside: (element) =>
    element.pos.x >= 0 and element.pos.x <= @graphics.w and element.pos.y >= 0 and element.pos.y <= @graphics.h
    
  allElements: () =>
    _.flatten [@planets, @obstacles, @rocket]