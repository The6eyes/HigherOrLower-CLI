

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

# Custom Feedback for Too High and Too Low Guesses

The game includes funny feedback messages if the player guesses incorrectly too many times.

```swift
 let tooLowResponses = ["Ok buddy, you got this 🙃. Maybe guess higher❓", "Hey, if you were intersted in winning you might wanna guess a little higher. teehee 😇", "Thats too low bruv, you should guess higher❗️"]
    let tooHighReponses = ["Yowza ❗️🤯 Thats a high try❗️Go again but guess lower❗️", "Cowabunga❗️ 🏄‍♂️ Bring it down a little bit, would ya❓ Guess lower❗️", "Holy Smokes pal, thats a pretty high guess. Bring it down maybe❓Guess lower. "]
```
We hold these funny messages inside `Arrays` so that when the player guesses too many times incorrectly we can have more than one response that prints.

The `randomElement()` function picks one of these messages at random. You will see later in the breakdown how we will use this.

#Printing the Welcome Message and rules 

The game starts with an introduction.
```swift
    print("")
    print("Welcome to the Higher ⬆️ or Lower ⬇️ game❗️")
    print("")
    print("I have picked a number between \(minimumNumber) and \(maximumNumber).")
    print("")
    print("Try to guess it and I'll tell you if your guess is too high, too low, or correct.")
```
We use the empty `print(" ")` to print an empty line. We can also do this by using `\n` inside of a `string` to skip the next line.

We use `string interpolation` to display the range (`minimumNumber` and `maximumNumber`) dynamically. 

This ensures the player knows the rules and the range to guess in.
