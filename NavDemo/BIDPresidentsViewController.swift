//
//  BIDPresidentsViewController.swift
//  Nav
//
//  Created by demon on 14-7-22.
//  Copyright (c) 2014年 demon. All rights reserved.
//

import UIKit

class BIDPresidentsViewController: BIDSecondLeveViewController ,BIDPresidentDetailViewControllerDelegate{
    var presidents:NSMutableArray!
    
    override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.title="Detail Edit"
        self.rowImage=UIImage(named: "detailEditIcon")
        var bundle=NSBundle.mainBundle()
        var plistURL:String=bundle.pathForResource("Presidents", ofType: "plist")!
        var data:NSData=NSData(contentsOfFile: plistURL)
        var aa:NSDictionary=NSDictionary(contentsOfFile: plistURL)
        println(aa)
        //var dict:NSMutableDictionary=NSKeyedUnarchiver.unarchiveObjectWithFile(plistURL) as NSMutableDictionary
        var unarciver:NSKeyedUnarchiver=NSKeyedUnarchiver(forReadingWithData: data)
        //oc里面没有这句。swift必须加上setClass
        unarciver.setClass(BIDPresident.classForCoder(), forClassName: "BIDPresident")

        self.presidents=unarciver.decodeObjectForKey("Presidents") as NSMutableArray
         println(self.presidents)
       // println(self.presidents)
        unarciver.finishDecoding()

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return self.presidents.count
    }
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell{
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell
        cell.accessoryType=UITableViewCellAccessoryType.DisclosureIndicator
        var president:BIDPresident=self.presidents[indexPath.row] as BIDPresident
        cell.textLabel.text=president.name
        
        // Configure the cell...
        
        return cell
    }
    override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        var president:BIDPresident=self.presidents[indexPath.row] as BIDPresident
        var controller:BIDPresidentDetailViewController=BIDPresidentDetailViewController(style:UITableViewStyle.Grouped)
        controller.president=president
        controller.delegate=self
        controller.row=indexPath.row
        self.navigationController.pushViewController(controller, animated: true)
    }
    func presidentDetailViewController(controller: BIDPresidentDetailViewController, didUpdatePresident president: BIDPresident){
        self.presidents.replaceObjectAtIndex(controller.row!, withObject: president)
        self.tableView.reloadData()
    }

}
