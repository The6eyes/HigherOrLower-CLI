//
//  main.swift
//  HigherOrLower
//
//  Created by Fred Saffold on 11/13/24.
//

//Just a test to see if things work

import Foundation

var playAgain = true

while playAgain   {
    
    var isSharinganMode = false
    

    
    let minimumNumber = 1
    let maximumNumber = Int.random(in: 10...40)
    
    let targetNumber = Int.random(in:minimumNumber...maximumNumber)
    
    var isGameOver = false
    var attempts = 0
    
    
    let tooLowResponses = ["Ok buddy, you got this 🙃. Maybe guess higher❓", "Hey, if you were intersted in winning you might wanna guess a little higher. teehee 😇", "Thats too low bruv, you should guess higher❗️"]
    let tooHighReponses = ["Yowza ❗️🤯 Thats a high try❗️Go again but guess lower❗️", "Cowabunga❗️ 🏄‍♂️ Bring it down a little bit, would ya❓ Guess lower❗️", "Holy Smokes pal, thats a pretty high guess. Bring it down maybe❓Guess lower. "]
    
    
    
    print("")
    print("Welcome to the Higher ⬆️ or Lower ⬇️ game❗️")
    print("") // when we print an empty string we are adding a line..just to space things out
    print("So the way the game works is I will choose a random number inside a range.")
    print("")// we can also use \n at the end of a string to add a line after that string
    print("Try to guess it and I'll tell you if your guess is too high, too low, or correct.")
    print("")
    
    while true {
        print("There are two game modes. Regular mode and Sharingan mode.")
        print("")
        print("In regular mode you have unlimited guesses. In sharingan mode you are limited to 7 guesses.")
        print("")
        print("Before we start, choose your mode: Type '1' for Regular Mode. Type '2' for Sharingan Mode")
        print("")
        
        if let modeChoice = readLine() {
            if modeChoice == "1" {
                isSharinganMode = false
                print("")
                print("Regular Mode selected. You have unlimited guesses! Good luck!")
                break
            } else if modeChoice == "2" {
                isSharinganMode = true
                print("")
                print("Sharingan Mode activated! You have only 7 guesses. Good luck.")
                break
            } else {
                print("Please select a valid game mode.")
            }
        }
    }
    
    
    while !isGameOver {
        
        print("I have picked a number between \(minimumNumber) and \(maximumNumber).")
        
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
        
        if isSharinganMode && attempts >= 7 {
            print("You used all of your guesses. The number was \(targetNumber). I knew you didnt have a sharingan")
            isGameOver = true
            return
        }
    }
    
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

