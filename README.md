# Neuro Gamemaker SDK
This is a Gamemaker addon that implements the functionality of the [Neuro-Game-SDK](https://github.com/VedalAI/neuro-game-sdk), allowing Neuro-Sama to play Gamemaker games.

An example project of rock paper scissors is provided in the source code to give a basic idea of how this addon can be implemented in your projects.

# Installation
1. Download the `NeuroGameSDK.yymps` file from releases
2. Go into your gamemaker project and at the top go to `Tools > Import Local Package` and then import `NeuroGameSDK.yymps` (make sure to add all!)
3. Place the `obj_neurogameapi` object into the first room that gets loaded (make sure its one of the very first objects to get created!)
4. Set the `global.GameString` variable in the create event of `obj_neurogameapi` to the name of the game
5. Enjoy!

# Usage
You can find the documentation for the Neuro API [here.](https://github.com/VedalAI/neuro-game-sdk/blob/main/API/README.md)
