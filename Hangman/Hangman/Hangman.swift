//
//  Hangman.swift
//  Hangman
//
//  Created by Eva on 3/8/16.
//  Copyright © 2016 Shawn D'Souza. All rights reserved.
//

import Foundation

class Hangman {
    var phrases: HangmanPhrases!
    var knownString: String?
    var guessed: NSMutableArray?
    var keyString: String?
    var images: [String]
    
    init() {
        phrases = HangmanPhrases()
        images = [String]()
        for index in 1...7 {
            images.append("hangman\(index)")
        }
    }
    
    func begin() {
        let key = phrases.getRandomPhrase()
        keyString = key
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
        return result
    }
    
    func guesses() -> String {
        if guessed!.count == 0 {
            return ""
        }
        var result: String!
        result = ""
        for (var i = 0; i < guessed!.count; i += 1) {
            result = result + ", \(guessed?.objectAtIndex(i))"
        }
        return result
    }
    
}
