# pad

<img src="./img/title.png" alt="title screen" width="400">
<img src="./img/menu.png" alt="game screen" width="400">
<img src="./img/game.png" alt="game screen" width="400">
<img src="./img/fail.png" alt="fail screen" width="400">

A simple Breakout/Arkanoid clone made in the [LÖVE](https://www.love2d.org) game engine.

Very incomplete.

## Controls

* A/D: Move paddle
* K: Increase paddle speed when held
* F4: Open debug menu
* P/ESC: Pause/unpause game
* F (for testing): Trigger game over screen
* Space (for testing): Add 100 points to score

## TODO

* Finish the collision system (partial)
* Add ball "physics" functionality (patial)
* Add scoring system (finished high score functionality)
* Add lives functionality (partial?)
* Add levels
* Add textures when done (partial)

## Bugs

* Rarely, the ball may get stuck below the paddle (maybe because i used ai for the code i think)

## Libraries and assets used

### Libraries

* [bump.lua](https://github.com/kikito/bump.lua) for collision functionality
* [cron.lua](https://github.com/kikito/cron.lua/) for timer function

### Assets

* [Micropixel](https://www.dafont.com/micropixel.font?l[]=10) font by [Sebastian Weber](https://www.dafont.com/sebastian-weber.d1791?l[]=10)
* [Pixeloid Sans](https://ggbot.itch.io/pixeloid-font) font by [GGBotNet](https://ggbot.itch.io/)

## License

Licensed under the [MIT License](./LICENSE.md).

