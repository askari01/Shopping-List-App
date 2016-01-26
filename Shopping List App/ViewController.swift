//
//  ViewController.swift
//  Shopping List App
//
//  Created by Syed Askari on 26/01/2016.
//  Copyright © 2016 Syed Askari. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var items = [String]()
    
    // MARK: UIPropertise
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    // MARK: UIAction
    @IBAction func addItem(sender: UIButton) {
        let item = textField.text
        items.append(item!)
        textField.resignFirstResponder()
        textField.text = ""
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell" , forIndexPath: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let selectedRow:UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
        
        if selectedRow.accessoryType == UITableViewCellAccessoryType.None {
            selectedRow.accessoryType = UITableViewCellAccessoryType.Checkmark
            // UIColor method requires a float from 0-1, not 0-255. You need to divide all your RGB values by 255.0
            // HEX can't be used easily so using RGBA
            selectedRow.tintColor = UIColor(red: 68/255, green: 179/255, blue: 157/255, alpha: 1)
        }
        else {
            selectedRow.accessoryType = UITableViewCellAccessoryType.None
        }
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        let deleatedRow:UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            items.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            deleatedRow.accessoryType = UITableViewCellAccessoryType.None
        }
    }

}

