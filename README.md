# Snake Game

The snake game is a classic arcade game where you control a growing snake, eating food to score points while avoiding crashing into your body.


## Features
-Increasing difficulty
-Continuous growth
-Retro design
-Simple ui

## How it works

The game uses a grid-coordinate array in GDScript to drive movement. On each Timer tick, the head vector updates and body segments follow the path history, while boundary logic handles screen wrapping. Food spawns on random coordinates checked against active body positions, and high scores persist locally via Godot's ConfigFile system.

## Acknowledgements

Followed this tutorial to build the foundation of the game: https://youtu.be/c7HQwxs5y8w?si=HfqG1C7JkR4cTJ6l

## What is new
-Added a golden star which increase the score by 5, and the length by one
-Increasing the speed by eating food with different factors
## About

Built as a personal project to practice Godot game development, GDScript, object-oriented programming, and game architecture.
