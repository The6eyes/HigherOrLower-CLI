

# Setting up the game variables 

We start by creating some variables that will manage the game and track the game state.

```swift 
var playAgain = true 

while playAgain   {
```

The `playAgain` variable is set to `true`, which means the game will keep running in a loop until the player decides to quit.

The `while playAgain` loop ensures that the game can restart if the player wants to play again.

Within the loop more variables are initialized.
```swift
let minimumNumber = 1
    let maximumNumber = Int.random(in: 10...40)
    
    let targetNumber = Int.random(in:minimumNumber...maximumNumber)

    var isGameOver = false
    var attempts = 0
```
`minimumNumber` defines the smallest possible number to guess. In this case it will always be 1.

`maximumNumber` picks a random number between 10 and 40. We gave the maximum number a range so that our user will get a new range everytime they play.

`targetNumber` is the secret number the player must guess. This number is randomly generated and is inside the range of our `minimumNumber` and `maximumNumber`.

`isGameOver` tracks whether the current game round has ended. (we use this in our guessing loop)
`attempts` counts how many guesses the player has made during the game.


