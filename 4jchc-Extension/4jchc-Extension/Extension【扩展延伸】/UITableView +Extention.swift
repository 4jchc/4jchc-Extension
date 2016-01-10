


import UIKit

public extension UITableView {
    
    public func dequeueOrCreateReusableCellWithIdentifier(identifier: String, requireNewCell: (identifier: String) -> (UITableViewCell)) -> UITableViewCell {
        
        if let dequeuedCell = dequeueReusableCellWithIdentifier(identifier) {
            
            return dequeuedCell
        }
        else {
            
            return requireNewCell(identifier: identifier)
        }
    }
}