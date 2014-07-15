class Graphics
  constructor: (@w, @h) ->
    @svg = d3.select 'svg'
    @svg
      .attr 'width', @w
      .attr 'height', @h
      
  showText: (text) =>
    @svg.append 'text'
      .attr 'x', @w / 2
      .attr 'y', @h / 2
      .data 'Game over'
      
  update: (elements) =>
    g = @svg.selectAll 'g'
      .data elements, (e) -> e.id

    newG = g.enter()
      .append 'g'
      .each (element, i) -> element.drawFunction()(d3.select(this))
            
    g.attr 'transform', (e) -> "translate(#{e.pos.x-e.sizeX()},#{e.pos.y-e.sizeY()})"

    g.exit()
      .remove()
    

  @drawRocket = (g) ->
    console.log 'rocket'
    g.append 'circle'
      .attr 'r', (e) -> e.r
      .attr 'cx', (e) -> e.r
      .attr 'cy', (e) -> e.r
      .attr 'fill', (e) -> e.color

  @drawPlanet = (g) ->
    g.append 'circle'
      .attr 'r', (e) -> e.field
      .attr 'cx', (e) -> e.field
      .attr 'cy', (e) -> e.field
      .attr 'fill', (e) -> d3.rgb 240, 240, 240

    g.append 'circle'
      .attr 'r', (e) -> e.r
      .attr 'cx', (e) -> e.field
      .attr 'cy', (e) -> e.field
      .attr 'fill', (e) -> e.color

  @drawObstacle = (g) ->
    g.append 'circle'
      .attr 'r', (e) -> e.r
      .attr 'cx', (e) -> e.r
      .attr 'cy', (e) -> e.r
      .attr 'fill', (e) -> e.color  

  