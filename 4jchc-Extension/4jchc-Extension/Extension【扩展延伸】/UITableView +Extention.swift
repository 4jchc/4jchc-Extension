


import UIKit

public extension UITableView {
    
    
    /**
     dequeue-出队Create-创建 Reusable-可再次使用的 CellWith Identifier-标识符
     
     - parameter identifier:     <#identifier description#>
     - parameter require-需要 NewCell: <#requireNewCell description#>
     
     - returns: <#return value description#>
     */
    public func dequeueOrCreateReusableCellWithIdentifier(identifier: String, requireNewCell: (identifier: String) -> (UITableViewCell)) -> UITableViewCell {
        
        if let dequeuedCell = dequeueReusableCellWithIdentifier(identifier) {
            
            return dequeuedCell
        }
        else {
            return requireNewCell(identifier: identifier)
        }
    }
    
    
}
extension UITableView {
    //MARK: - 从XIB加载注册cell
    ///  从XIB加载注册cell
    func registerNibName(nibName:String, forCellReuseIdentifier identifier:String ){
        
        let nib = UINib(nibName: nibName, bundle: nil) as UINib
        self.registerNib(nib, forCellReuseIdentifier: identifier)
    }
}

extension UITableView {
    
    func reloadDataWithAnimation() {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { () -> Void in
            for section in 0..<self.numberOfSections {
                for row in 0..<self.numberOfRowsInSection(section) {
                    NSThread.sleepForTimeInterval(0.2)
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        var paths = [NSIndexPath]()
                        paths.append(NSIndexPath(forRow: row, inSection: section))
                        weak var weakTableView:UITableView? = self
                        weakTableView?.reloadRowsAtIndexPaths(paths, withRowAnimation: UITableViewRowAnimation.Left)
                    })
                }
            }
        }
    }
}
/*
override func reloadRowsAtIndexPaths(indexPaths: [NSIndexPath], withRowAnimation animation: UITableViewRowAnimation) {
print("reloading from table view")
for indexPath in indexPaths {
let stages = DataContainerSingleton.getInstance().stages
if (stages[indexPath.section].steps[indexPath.row].isSelected) {
print("trying to select cell")
selectRowAtIndexPath(indexPath, animated: true, scrollPosition: UITableViewScrollPosition.None)
}
}

}
*/








