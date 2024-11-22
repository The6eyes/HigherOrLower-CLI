

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

# Game Loop: Player Guesses a Number

The game keeps prompting the player to guess until they succeed or decide to stop.

```swift
  while !isGameOver {
        print("Enter your guess here 🤔:", terminator: " " )
        
        if let userInput = readLine()   {
            if let guess = Int(userInput) {
                checkGuess(guess)
            } else {
                print("")
                print("Please enter a valid number. 🥲 \n")
            }
        }
    }
```
`readLine()` captures  the players input 

`(Int(userInput))` checks if the `user input` can be converted into an `integer`. If it can be converted into an `integer` then it calls our `checkGuess(guess)` function to process the guess.

If it can not convert the `user input` into an `integer` then it will ask the player to enter a valid number.

# Checking the Players Guess

The `checkGuess` function first checks if the users guess is in range and then determines if the players guess is too high, too low, or correct.

```swift
 func checkGuess(_ guess: Int) {
    
        if guess < minimumNumber || guess > maximumNumber {
            print("")
            print("Yikers❗️Your guess is out of range❗️ 😩")
            print("Hint: Make sure to guess a number betweeen \(minimumNumber) and \(maximumNumber).\n")
            return
        }
       
        if guess < targetNumber {
            print("")
            if attempts >= 4 {
                print(tooLowResponses.randomElement()!)
            } else {
                print("Too low‼️ Guess Higher❗️")
                attempts += 1}
        } else if guess > targetNumber {
            print("")
            if attempts >= 4 {
                print(tooHighReponses.randomElement()!)
            } else {
                print("Too high‼️ Guess lower❗️")
                attempts += 1}
        } else {
            print("")
            print("Congratulations❗️🥳🎉 You win‼️")
            print("You guessed in \(attempts) attempts.\n")
            isGameOver = true
        }
    }
```
If the players guess is lower than our `minimumNumber` or higher than our `maximumNumber` then we will print a custom message notifying the player that they guessed out of range and we will also remind them of the range they are supposed to be guessing in. 

If the guess is in range then we will compare it against our `targetNumber`. If the guess is too low it will display a too low message. If it is too high it will display a too high message. 

If the guess is correct, it will congratulate the player and `print` how many attempts it took them to guess the correct number before ending the game.

Note: I want to direct your attention to this specific part of the code:
```swift
if guess < targetNumber {
            print("")
            if attempts >= 4 {
                print(tooLowResponses.randomElement()!)
            } else {
                print("Too low‼️ Guess Higher❗️")
                attempts += 1}
        } else if guess > targetNumber {
            print("")
            if attempts >= 4 {
                print(tooHighReponses.randomElement()!)
            } else {
                print("Too high‼️ Guess lower❗️")
                attempts += 1}
```

This section of code checks if the player has made 4 or more incorrect guesses. If this is true then the program will print those funny messages we put in our `tooLowResponses` and `tooHighResponses` `arrays` earlier. The `.randomElement()` function will randomize the order the messages will be printed in keeping our game fun and random. The purpose of this is to add variety and keep the game entertaining.


By using the  `!` `force unwrap` `operator` after the `.randomElement()` `function` we are telling swift that we are absolutely certain that the `optional` contains a value so go ahead and use it directly. 

(This method of `optional unwrapping` is not recommended. We use it here because we put multiple `strings` in our `arrays` earlier in our process but if for example the `optional` happens to contain `nil`, maybe if we had an empty `array` or something, then the program would crash because it would have tried to `foce unwrap` a `nil` which is something that isnt there.)

# Asking the Player if they want to Play Again

After each game the program asks the player if they want to play again.

```swift
    while true {
        print("")
        print("Do you want to play again❓ (yes/no)", terminator: " ")
        if let response = readLine()?.lowercased() {
            if response == "yes" || response == "y" {
                playAgain = true
                break
            } else if response == "no" || response == "n" {
                playAgain = false
                break
            } else {
                print("")
                print("Invalid response. Please choose yes or no.")
            }
        }
    }
```
The player is prompted to type `yes` or `no`. 

If the player types `yes` or `y` then our `playAgain` `variable` will remain `true` and restart our game. If the player types `no` or `n` our `playAgain` `variable` will be `false` and the game will end.

If the user types anything other than `yes` `y` or `no` `n` then an `error` message will `print` saying our response is `invalid` and to please choose and acceptable response.

# Ending the game

If the player decides not to play again then we will print  a custom message

```swift
print("")
print("Thanks for playing❗️ Goodbye‼️✌️😘")
```

In this activity we got to use `variables`, `loops`, `conditionals`, and `functions` to create an interactive command line game!
