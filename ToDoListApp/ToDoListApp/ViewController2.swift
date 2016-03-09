//
//  ViewController2.swift
//  ToDoListApp
//
//  Created by Eva on 2/29/16.
//  Copyright © 2016 Eva. All rights reserved.
//

import UIKit

var TodoList = [String]()
var Date = [NSDate]()
var doneDate = [NSDate?]()
var Status = [Bool]() //true if completed
var numDeleted = 0


class ViewController2: UIViewController {
    
    
    @IBOutlet var newItem: UITextField!
    @IBAction func AddAction(sender: AnyObject) {
        //TodoList.append(newItem.text!)
        let formatter = NSDateFormatter()
        formatter.dateStyle = .FullStyle

        if newItem.text?.characters.count > 0 {
            TodoList.append(newItem.text!)
            Date.append(NSDate())
            doneDate.append(nil)
            Status.append(false)
            
            newItem.text = ""
            self.view.endEditing(true)
            
        }

        for index in 0..<TodoList.count{
            
            let stringValue = formatter.stringFromDate(Date[index])
            
            print(TodoList[index])
            print(stringValue)
            print(Status[index])
        }
    }

    @IBAction func ClearAction(sender: AnyObject) {
        newItem.text = ""
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
