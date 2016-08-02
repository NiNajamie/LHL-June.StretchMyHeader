//
//  MasterViewController.swift
//  LHL-June.StretchMyHeader
//
//  Created by Asuka Nakagawa on 2016-08-02.
//  Copyright © 2016 Asuka Nakagawa. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    
    var newsList = [News]()
    
    func loadNews() {
        let news1 = News(category: "World", headline: "Climate change protests, divestments meet fossil fuels realities")
        let news2 = News(category: "Europe", headline: "Climate change protests, divestments meet fossil fuels realities")
        
        newsList = [news1!, news2!]
    }
    
    
    
    var detailViewController: DetailViewController? = nil
    var objects = [AnyObject]()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadNews()
        
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.leftBarButtonItem = self.editButtonItem()

        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "insertNewObject:")
        self.navigationItem.rightBarButtonItem = addButton
        
    }

    override func viewWillAppear(animated: Bool) {
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func insertNewObject(sender: AnyObject) {
        objects.insert(NSDate(), atIndex: 0)
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }

    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let object = objects[indexPath.row] as! NSDate
                let controller = segue.destinationViewController as! DetailViewController
                controller.detailItem = object
            }
        }
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsList.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! NewsTableViewCell

        let news = newsList[indexPath.row]
        cell.categoryLabel.text = news.category
        cell.headlineLabel.text = news.headline
        
//        let object = objects[indexPath.row] as! NSDate
//        cell.textLabel!.text = object.description
        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            objects.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }


}

