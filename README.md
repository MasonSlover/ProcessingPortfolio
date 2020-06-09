# Processing Portfolio
Hey! My name is Mason Slover and I am a mathematics and computer science student at Fordham University Lincoln Center. I have been creating art using Processing, a visual Java environment, for 5 years. This GitHub is a repository of some of my favorite works, some of which are open source. Here are a couple of my favorite pieces:

## [Dynamic Variable Width Fonts](./VariableWidthFonts)
Using processing, I was able to import a variable width font and dynamically adjust the type's weight and height. Using sinusoidal speed changes and random character attributes, this project creates dynamic type that allows for extreme flexibility.

<img src="./Variable/VariableWidthFont.gif" style="zoom:25%;" />



## [Flocking Algorithms](./FlockingAlgorithm)

Using a [Stanford overview](https://cs.stanford.edu/people/eroberts/courses/soco/projects/2008-09/modeling-natural-systems/boids.html) of [Craig Reynold's Boids Algorithm](http://www.red3d.com/cwr/boids/), I implemented three main flocking behaviors to simulate natural behavior in Processing:

### Separation: 

Any "Boid" within 20 pixels with another Boid will steer away from the center of the other Boid to avoid colliding.

### Cohesion: 

Each Boid calculates the average position of all other Boids within 20px, and steers towards that point. This allows for "flocks" of Boids.

### Alignment: 

Each Boid will steer towards the average heading of all other Boids within 20px. This allows for flocks to fly in the same direction.



<img src="./FlockingAlgorithm/boids.gif" style="zoom:50%;" />