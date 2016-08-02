//
//  MasterViewController.swift
//  LHL-June.StretchMyHeader
//
//  Created by Asuka Nakagawa on 2016-08-02.
//  Copyright © 2016 Asuka Nakagawa. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    @IBOutlet weak var currentDateLabel: UILabel!
    @IBOutlet weak var headerView: UIView!
    
    let kTableHeaderHeight: CGFloat = 282.0
    
    var newsList = [News]()
    
    func loadNews() {
        let news1 = News(category: .World, headline: "Climate change protests, divestments meet fossil fuels realities.")
        let news2 = News(category: .Europe, headline: "Scotland's 'Yes' leader says independence vote is 'once in a lifetime")
        let news3 = News(category: .MiddleEast, headline: "Airstrikes boost Islamic State, FBI director warns more hostages possible")
        let news4 = News(category: .Africa, headline: "Nigeria says 70 dead in building collapse; questions S. Africa victim claim")
        let news5 = News(category: .AsiaPacific, headline: "Despite UN ruling, Japan seeks backing for whale hunting")
        let news6 = News(category: .Americas, headline: "Officials: FBI is tracking 100 Americans who fought alongside IS in Syria")
        let news7 = News(category: .World, headline: "South Africa in $40 billion deal for Russian nuclear reactors")
        let news8 = News(category: .Europe, headline: "'One million babies' created by EU student exchanges")
        
        newsList = [news1, news2, news3, news4, news5, news6, news7, news8]
    }
    
    
    
    var detailViewController: DetailViewController? = nil
    var objects = [AnyObject]()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadNews()

        let currentDate = NSDate()
        let formatter = NSDateFormatter()
        formatter.locale = NSLocale.currentLocale()
        formatter.dateStyle = NSDateFormatterStyle.LongStyle
        let converttedDate = formatter.stringFromDate(currentDate)

        currentDateLabel.text = converttedDate
        
        // Do any additional setup after loading the view, typically from a nib.
//        self.navigationItem.leftBarButtonItem = self.editButtonItem()
//
//        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(insertNewObject))
//        self.navigationItem.rightBarButtonItem = addButton
        
        self.tableView.estimatedRowHeight = 88
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        self.tableView.tableHeaderView = nil
        self.tableView.addSubview(headerView)
        
        tableView.contentInset = UIEdgeInsetsMake(kTableHeaderHeight, 0.0, 0.0, 0.0)
        tableView.contentOffset = CGPointMake(0.0, -kTableHeaderHeight)
        updateHeaderView()
    }
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        updateHeaderView()
    }

    
    func updateHeaderView() {
        var headerRect = CGRectMake(0.0, -kTableHeaderHeight, tableView.bounds.width, kTableHeaderHeight)
        if tableView.contentOffset.y < -kTableHeaderHeight {
            headerRect.origin.y = tableView.contentOffset.y
            headerRect.size.height = -(tableView.contentOffset.y)
        }
        headerView.frame = headerRect
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
                let object = newsList[indexPath.row]
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
        
//        let category = News.Category(rawValue: "Asia Pacidsjfhsdkafic")

        let news = newsList[indexPath.row]
        cell.categoryLabel.text = news.category.rawValue
        cell.categoryLabel.textColor = news.category.color()
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

