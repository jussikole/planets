
w = 1000
h = 500
c = {x: w / 2, y: h / 2}




fps = 10.0
delay = 1000 / fps

throttle = 0
dt = 1

graphics = new Graphics w, h
arena = new Arena graphics, dt
controls = new Controls graphics, 0.1

planet1 = new Planet {
  pos: new Vector(200, 200)
  mass: 150
  r: 10
}
planet2 = new Planet {
  pos: new Vector(600, 400)
  mass: 150
  r: 10
  v: new Vector(0, -0.3)
}
arena.planets = [planet1, planet2]

arena.rocket = new Rocket {
  pos: new Vector(50, 50)
  v: new Vector(2, 1)
  r: 5
  color: d3.rgb 0, 255, 0
}, controls
    
d3.timer arena.update, delay
  
  
