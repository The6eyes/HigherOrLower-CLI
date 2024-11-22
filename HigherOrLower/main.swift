//
//  main.swift
//  HigherOrLower
//
//  Created by Fred Saffold on 11/13/24.
//

import Foundation

var playAgain = true // while this variable is true our game will loop

while playAgain   {
    
    //First we have to make a few variables to establish our range and target number that our user will be guessing
    
    let minimumNumber = 1 // we want our minumum number to always be one
    let maximumNumber = Int.random(in: 10...40) // we want out maximum number to be anywhere between 10 and 40
    
    let targetNumber = Int.random(in:minimumNumber...maximumNumber) // variable that generates our random number
    
    var isGameOver = false // Variable to track if the game is over or not
    var attempts = 0 // attempts counts how many guesses the user has made
    
    //If our user guesses more than 4 times our responses will pull from these arrays
    let tooLowResponses = ["Ok buddy, you got this 🙃. Maybe guess higher❓", "Hey, if you were intersted in winning you might wanna guess a little higher. teehee 😇", "Thats too low bruv, you should guess higher❗️"]
    let tooHighReponses = ["Yowza ❗️🤯 Thats a high try❗️Go again but guess lower❗️", "Cowabunga❗️ 🏄‍♂️ Bring it down a little bit, would ya❓ Guess lower❗️", "Holy Smokes pal, thats a pretty high guess. Bring it down maybe❓Guess lower. "]
    
    
    // Print welcome message and rules
    print("")
    print("Welcome to the Higher ⬆️ or Lower ⬇️ game❗️")
    print("") // when we print an empty string we are adding a line..just to space things out
    print("I have picked a number between \(minimumNumber) and \(maximumNumber).")
    print("")// we can also use \n at the end of a string to add a line after that string
    print("Try to guess it and I'll tell you if your guess is too high, too low, or correct.")
    
    // We need to start the game loop here
    while !isGameOver {
        print("Enter your guess here 🤔:", terminator: " " )
        
        if let userInput = readLine()   {
            if let guess = Int(userInput) {
                // we need to create a function that checks our guess, which is now an int, to see if it matches our targetNumber
                checkGuess(guess)
            } else {
                print("")
                print("Please enter a valid number. 🥲 \n") //here is an example
            }
        }
    }
    
    func checkGuess(_ guess: Int) {
        //First we will check if the guess is out of range -- if it is out of range give correct range as a hint using (string interp)
        if guess < minimumNumber || guess > maximumNumber {
            print("")
            print("Yikers❗️Your guess is out of range❗️ 😩")
            print("Hint: Make sure to guess a number betweeen \(minimumNumber) and \(maximumNumber).\n")
            return //If our guess is out of range then it will return us to the start of our game loop prompting us to enter another guess
        }
        // If our guess is in range then we check our guess against our target number
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
    
   // Play again response loop-- we have to account for any responses other than yes/y or no/n
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
}
print("")
print("Thanks for playing❗️ Goodbye‼️✌️😘")
/*
 RESEARCH SECTION
1. limit to a certain amount of  guesses -- new game mode

2. Computer AI --  Everytime we guess the computer guesses and whoever guesses first wins.
3. 2 players option
4. array or responses -- taunt messages
 */
