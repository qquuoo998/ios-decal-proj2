//
//  ViewController.swift
//  ToDoListApp
//
//  Created by Eva on 2/29/16.
//  Copyright © 2016 Eva. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDelegate{
    
//    func calStats() ->Int {
//        
//        
//    }
    
     func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) ->Int{
            return TodoList.count
    }

     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        print("11######")
        print(TodoList)
        print(doneDate)
        print(Status)
        print(indexPath.row)
        print("11######")
        let cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "cell")
        //let curDate : NSDate = NSDate()
        let oneDayAgo = NSDate(timeIntervalSinceNow: -3600 * 24)
        
        
        if (Status[indexPath.row]) {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark;
        } else {
            cell.accessoryType = UITableViewCellAccessoryType.None;
        }
        
        let dateComparisionResult = oneDayAgo.compare(Date[indexPath.row])
        
        if dateComparisionResult == NSComparisonResult.OrderedAscending
        {
            let formatter = NSDateFormatter()
            formatter.timeStyle = .ShortStyle
            // Early date is smaller than end date.
            print("added1")
            cell.detailTextLabel?.text = formatter.stringFromDate(Date[indexPath.row])
            
        }
        else if dateComparisionResult == NSComparisonResult.OrderedDescending
        {
            let formatter = NSDateFormatter()
            formatter.dateStyle = .ShortStyle
            // Early date is larger than end date.
            print("added2")
            cell.detailTextLabel?.text = formatter.stringFromDate(Date[indexPath.row])
            
        }else {
            print("Error")
        }
        
        print(indexPath.row)
        print(cell.detailTextLabel?.text)
        
        cell.textLabel?.text = TodoList[indexPath.row]
        return cell
        
    }
    
    func deleteItem (index: Int) {
        print("deleteItem: ")
        print(index)
        if (Status[index]) {
            numDeleted += 1
        }
        TodoList.removeAtIndex(index)
        Status.removeAtIndex(index)
        Date.removeAtIndex(index)
        doneDate.removeAtIndex(index)
    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        <#code#>
//    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if Status[indexPath.row] == false {
            Status[indexPath.row] = true
            doneDate[indexPath.row] = NSDate()
        } else {
            Status[indexPath.row] = false
            doneDate[indexPath.row] = nil
        }
        print("status: ")
        print(Status)
        print("date: ")
        print(TodoList)
        tableView.reloadData()
    }
    
//    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
//        
//    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            print("want to delete")
            print(indexPath.row)
            deleteItem(indexPath.row)
            print("deleted")
            print(indexPath.row)
        }
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        
        print("viewDidLoad")
        print("\n22######")
        print(TodoList)
        print(doneDate)
        print(Status)
        
        let oneDayAgo = NSDate(timeIntervalSinceNow: -3600 * 24)
        print(oneDayAgo)
        print("22######\n")
        
        var index = 0
        
        while index < doneDate.count {
            print("loop")
            print("\n33######")
            print(index)
            print(TodoList)
            print(doneDate)
            print(Status)
            print("33######\n")
            if Status[index] && (oneDayAgo.compare(doneDate[index]!) == NSComparisonResult.OrderedDescending) {
                print("@@")
                deleteItem(index)
                index -= 1
            }
            index += 1
        }
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

