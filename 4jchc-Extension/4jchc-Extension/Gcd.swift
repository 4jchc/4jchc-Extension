//
//  Gcd.swift
//  4jchc-Extension
//
//  Created by 蒋进 on 16/1/13.
//  Copyright © 2016年 sijichcai. All rights reserved.
//

import UIKit

class Gcd: UITableViewController {

    /** key : URL地址, value : UIImage  */
    var images:NSMutableDictionary!
    /** key : URL地址, value : 操作  */
    var operations:NSMutableDictionary!//
    let queue:NSOperationQueue = NSOperationQueue()
    var data:NSArray?
   
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "reuseIdentifier")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...
        // 2.设置cell的数据
        cell.textLabel!.text = self.data![indexPath.row] as? String;
        
        // 3.设置图片数据
        let image = (self.images!["http://43245325.png"] as? UIImage)
     
    
        if (image == nil) { // 没有图片
            var operation = self.operations!["http://43245325.png"] as? NSBlockOperation
            
            
            if (operation == nil) { // 下载
                operation = NSBlockOperation.operationWithAsyncBlock({ (finish) -> Void in
                    
                    let data:NSData = NSData(contentsOfURL: NSURL(string: "http://43245325.png")!)!
                    let downloadImage:UIImage = UIImage(data: data)!
                    // 存入字典
                    self.images!["http://43245325.png"] = downloadImage;
                    // 移除下载操作
                    self.operations.removeObjectForKey("http://43245325.png")
                    // 回到主线程设置图片
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        
                        cell.imageView!.image = downloadImage;

                    })
 
                self.queue.addOperation(operation!)
                
                self.operations["http://43245325.png"] = operation;
            })
        }else { // 正在下载
                cell.imageView!.image = UIImage(named: "")
            }
        } else { // 已经有图片
            cell.imageView!.image = image;
        }
        
        return cell
    }
    

}
