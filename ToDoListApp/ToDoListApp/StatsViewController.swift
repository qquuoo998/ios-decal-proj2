//
//  StatsViewController.swift
//  ToDoListApp
//
//  Created by Eva on 3/1/16.
//  Copyright © 2016 Eva. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {
    @IBOutlet var numStats: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        var count : Int = 0
        for s in Status {
            if s {
                count += 1
            }
        }
        print("stats view: ")
        print(Status)
        numStats.text = String(count + numDeleted)
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
