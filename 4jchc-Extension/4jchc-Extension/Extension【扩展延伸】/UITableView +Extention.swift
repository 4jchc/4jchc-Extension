


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