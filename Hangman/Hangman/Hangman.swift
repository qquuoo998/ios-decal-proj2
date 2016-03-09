//
//  Hangman.swift
//  Hangman
//
//  Created by Eva on 3/8/16.
//  Copyright © 2016 Shawn D'Souza. All rights reserved.
//

import Foundation
//import UIKit

class Hangman {
    var phrases: HangmanPhrases!
    var knownString: String?
    var guessed: NSMutableArray?
    var keyString: String?
    var images: [String]
    var curImageIndex: Int
    
    init() {
        phrases = HangmanPhrases()
        images = [String]()
        for index in 0...6 {
            images.append("hangman\(index+1)")
        }
        curImageIndex = 1
        guessed = NSMutableArray()
    }
    
    func begin() {
        let key = phrases.getRandomPhrase()
        print("got a new key: " + key)
        keyString = key
        assignNewPhrase(key)
        curImageIndex = 1
    }
    
    func restart() {
        let key = keyString!
        curImageIndex = 1
        assignNewPhrase(key)
    }
    
    func ifLost() -> Bool {
        return curImageIndex == 6
    }
    
    func getCurPicName() -> String {
        return images[curImageIndex]
    }
    
    func assignNewPhrase(key: String!) {
        knownString = ""
        var counter = 0
        for (; counter < keyString!.characters.count; counter++) {
            if (key[key.startIndex.advancedBy(counter)] == " ") {
                knownString = knownString! + " "
            } else {
                knownString = knownString! + "_"
            }
        }
        guessed = NSMutableArray()
    }
    
    func ifGuessed(letter: String) -> Bool {
        if guessed!.containsObject(letter.uppercaseString) {
            return true
        }
        guessed!.addObject(letter)
        print("ifGuess: guessed= " + guesses())
        
        var str = Array(keyString!.characters)
        var counter = 0
        var result = false
        for (; counter < keyString!.characters.count; counter++) {
            if String(str[counter]) == letter {
                result = true
                knownString = "\((knownString! as NSString).substringToIndex(counter))" + "\(letter)"
                    + "\((knownString! as NSString).substringFromIndex(counter+1))"
            }
        }
        curImageIndex += (result ? 0:1)
        print("ifGuess: result = ",result, " knowstring = ", knownString)
        print("ifGuess: curimageindex = ", curImageIndex)
        return result
    }
    
    func guesses() -> String {
        var result: String!
        result = ""
        var i = 0
        print(guessed!.count)
        for (; i < guessed!.count; i += 1) {
            result = result + "\(guessed!.objectAtIndex(i)) "
        }
        return result
    }
    
}
