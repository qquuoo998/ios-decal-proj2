//
//  GameViewController.swift
//  Hangman
//
//  Created by Shawn D'Souza on 3/3/16.
//  Copyright © 2016 Shawn D'Souza. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    var statesImages = [UIImage]()
    var hangmanGame: Hangman!
    
    @IBOutlet var knownLabel: UILabel!
    @IBOutlet var statesImageView: UIImageView!
    @IBOutlet var guessedLabel: UILabel!
    @IBOutlet var inputTextField: UITextField!
    @IBOutlet var newGameButton: UIBarButtonItem!
    @IBOutlet var restartButton: UIBarButtonItem!
    @IBOutlet var guessButton: UIButton!


    @IBAction func newGameButtonPressed(sender: UIBarButtonItem) {
        hangmanGame.begin()
        resetPara()
    }

    @IBAction func restartButtonPressed(sender: UIBarButtonItem) {
        hangmanGame.restart()
        resetPara()
    }

    func resetPara() {
        guessedLabel.text = ""
        knownLabel.text = hangmanGame.knownString!
        statesImageView.image = UIImage(named: hangmanGame.getCurPicName())
        inputTextField.text = ""
        statesImageView.image = UIImage(named: hangmanGame.getCurPicName() + ".gif")
    }

    @IBAction func guessButton(sender: UIButton) {
        let letter = (inputTextField.text)!.uppercaseString
        let alert = UIAlertView()
        alert.title = "Alert"

        if (letter.characters.count != 1) || letter < "A" || letter > "Z" {
            alert.message = "Please only enter one letter!"
            alert.addButtonWithTitle("Try again")
            alert.show()
        } else {
            let result = hangmanGame.ifGuessed(letter)
            print("known: " + hangmanGame.knownString!)
            knownLabel.text = hangmanGame.knownString!
            print("Guess: " + hangmanGame.guesses())
            guessedLabel.text = hangmanGame.guesses()
            print("name: ", hangmanGame.getCurPicName())
            statesImageView.image = UIImage(named: hangmanGame.getCurPicName() + ".gif")
            if result {
                if (hangmanGame.knownString == hangmanGame.keyString) {
                    alert.message = "You Win!"
                    alert.addButtonWithTitle("New Game")
                    alert.show()
                    self.newGameButtonPressed(newGameButton)
                }
            } else if hangmanGame.ifLost() {
                alert.message = "You Lost!"
                alert.addButtonWithTitle("Restart")
                alert.show()
                self.restartButtonPressed(restartButton)
            }
        }
        inputTextField.text = ""
        
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        hangmanGame = Hangman()
        self.newGameButtonPressed(newGameButton)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
