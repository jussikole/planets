class Vector
  constructor: (@x=0, @y=0) ->
    
  isEmpty: () ->
    @x == 0 and @y == 0
    
  add: (vector) ->
    @x += vector.x
    @y += vector.y
    this
    
  addNew: (vector) ->
    x = @x + vector.x
    y = @y + vector.y
    new Vector x,y
    
  multiply: (scalar) ->
    @x *= scalar
    @y *= scalar
    this
    
  multiplyNew: (scalar) ->
    new Vector @x * scalar, @y * scalar
    
  angle: () ->
    Math.atan2 -@y, @x
    
  length: () ->
    Math.sqrt(Math.pow(@x, 2) + Math.pow(@y, 2))
    
  unit: () ->
    @multiply(1 / @length())
    this
    
  copy: () ->
    new Vector @x, @y
    
  projection: (vector) =>
    scale = Vector.dot(this, vector) / Math.pow(vector.length(), 2)
    vector.multiplyNew scale    
   
  # Static methods
  @dot: (v1, v2) ->
    v1.x * v2.x + v1.y * v2.y
  
  @distance: (v1, v2) ->
    Math.sqrt(Math.pow(v1.x - v2.x, 2) + Math.pow(v1.y - v2.y, 2))
    
  @pointToPoint: (pos1, pos2) ->
    new Vector(pos2.x - pos1.x, pos2.y - pos1.y)


    