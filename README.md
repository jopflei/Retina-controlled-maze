# Retina-controlled-maze
Simple maze game that can be controlled using the Tobii Eyetracker 4c.

# Project Goal:
The way humans are able to use the technology that we create heavily depends on how accessible it is for a given user. Since not all users share the same level of mobility, we wanted to create a product which requires only very simple gestures for control. Specifically, we were drawn to the gaming sector of technology - and decided that there should be a way for individuals with impaired motor-skills to be able to play games using only their eyes as a manipulative input. This could allow anyone to train, and enhance their retinal target abilities; all while playing a fun and simple game such as a maze escape.

# Solution Approach:
We decided to use the Tobii Eye Tracker (4C Model) technology to extract the features necessary for our project. A sketch made in Processing initializes the tracker object, and sends the relative XY position of your retina in relation to it via a pre-defined port socket. These movements are then mapped to an elliptical shape, which represents the player. We then had to design the maze itself, which was done using simple drawing features in Processing. To make things interesting, an enemy class was created which spawns two smaller cirlces that chase the Tobii controlled object around the maze. Lastly, the maze was trained using Wekinator in order to create a decision boundary for wall collision. We decide to use K-nearest neighbor to establish these, but we had to increase the size for KNN to accomodate the sensitivity that this ML algorithm comes with. The number that ended up working best for the implementation was a KNN of 3.

# Potential Improvements:
The maze could definitely be made more challenging using a recursive backtracking algorithm for initialization. Additionally, more layers of gaming could be added by turning the maze into a retina controlled rendition of the cult classic game Pacman.

# Demo Link:

https://youtu.be/RjHmRxi62hE
