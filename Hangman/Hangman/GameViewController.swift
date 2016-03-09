//
//  GameViewController.swift
//  Hangman
//
//  Created by Shawn D'Souza on 3/3/16.
//  Copyright © 2016 Shawn D'Souza. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, UITextFieldDelegate {

    var hangmanStateImages = [UIImage]()
    var curImage = 1
    var hangmanGame: Hangman!
    
//    @IBOutlet var guessLetterTextField: UITextField!
//    @IBOutlet var guessedLettersLabel: UILabel!
//    @IBOutlet var hangmanImageView: UIImageView!
//    @IBOutlet var newGameButton: UIButton!
//    @IBOutlet var guessLetterButton: UIButton!
//    @IBOutlet var answerLabel: UILabel!
    
    @IBAction func newGameButtonPressed(sender: UIButton) {
        hangmanGame.begin()
        guessedLettersLabel.text = ""
        answerLabel.text = hangmanGame.knownString!
        curImage = 1
        for i in 0...6 {
            hangmanStateImages.append(UIImage(named: "hangman\(i + 1)")!)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        hangmanGame = Hangman()
        guessLetterTextField.delegate = self
        self.newGameButtonPressed(newGameButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
