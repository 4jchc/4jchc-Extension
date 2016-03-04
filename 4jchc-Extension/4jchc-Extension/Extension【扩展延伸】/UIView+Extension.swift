
import UIKit
import Foundation




extension UIView {
    
    class func viewFromXib() -> UIView? {
        return self.viewFromXib(self.className())//self.nameOfClass
    }
    
    class func viewFromXib(xibName: String) -> UIView? {
        return NSBundle.mainBundle().loadNibNamed(xibName, owner: nil, options: nil) [0] as? UIView
    }
    
    class func loadFromNibNamed(nibName: String, bundle : NSBundle? = nil) -> UIView? {
        
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiateWithOwner(nil, options: nil).first as? UIView
    }

    
    
    
    
    //=======GestureRecognizer begin(首饰相关的)========//
    
    //添加点击事件
    func addTapGestureRecognizer(target target: AnyObject,action: Selector){
        
        let tapGestureRecognizer:UITapGestureRecognizer = UITapGestureRecognizer(target: target, action: action)
        self.addGestureRecognizer(tapGestureRecognizer)
    }
    
    //制作圆角
    func makeCornerRadius(cornerRadius:CGFloat,borderColor:UIColor,borderWidth:CGFloat){
        self.layer.borderColor = borderColor.CGColor
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
    }
    
    func makeCornerRadius(cornerRadius:CGFloat,borderColor:UIColor){
        self.layer.borderColor = borderColor.CGColor
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = 1
    }
    

}


















//MARK: - 💗非自动布局代码
public extension UIView {
    
    //MARK:  取消--指定--视图的 autoresizing 属性
    ///  取消--指定--视图的 autoresizing 属性
    public class func disableAutoresizingMasksInViews(views: UIView...) {
        for view in views {
            view.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    //MARK:  取消所有子视图的 autoresizing 属性
    ///  取消所有子视图的 autoresizing 属性
    func disableSubviewsAutoresizing() {
        for v in subviews {
            //translates-转化 Autoresizing MaskInto Constraints-系统规定参数
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    /**
     Adds multiple-多样的subviews in order顺序. Later arguments参数 are placed on top of the views
     preceding在前的 them.
     */
     //MARK:  添加多视图
     ///  添加多样的视图
    public func addSubviews(views: UIView ...) {
        for view in views {
            self.addSubview(view)
        }
    }
    //MARK:  添加-多-视图--Fill并且填充
    ///  添加-多-视图--Fill并且填充
    public func addSubviewsAndFill(views: UIView ...) {
        for view in views {
            self.addSubviewAndFill(view)
        }
    }
    //MARK:  添加-单-视图--Fill并且填充
    ///  添加-单-视图--Fill并且填充
    public func addSubviewAndFill(view: UIView) {
        self.addSubview(view)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let views = ["view" : view]
        let rules = ["H:|-0-[view]-0-|",
            "V:|-0-[view]-0-|"]
        self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormatArray(rules, metrics: nil, views: views))

    }
    
    public func fillSuperview() {
        if let superview = self.superview {
            self.translatesAutoresizingMaskIntoConstraints = false
            let views = ["view" : self]
            let rules = ["H:|-0-[view]-0-|",
                "V:|-0-[view]-0-|"]
            superview.addConstraints(
                NSLayoutConstraint.constraintsWithVisualFormatArray(rules,
                    metrics: nil,
                    views: views))
        }
    }
    //MARK:  instantiate实例化 FromNib
    ///  instantiate实例化 FromNib
    public class func instantiateFromNib<T: UIView>() -> T {
        let mainBundle = NSBundle.mainBundle()
        if let objects = mainBundle.loadNibNamed(self.className(), owner: self, options: nil) {
            if let view = objects.last as? T {
                return view
            }
            fatalError("\(__FUNCTION__): Cannot cast view object to \(T.classForCoder())")
        }
        fatalError("\(__FUNCTION__): No nib named \'\(self.className())\'")
    }
    
     //MARK: - 返回这个类的名称
     ///  返回这个类的名称
    class func className() -> String {
        let description = self.classForCoder().description()
        if let className = description.componentsSeparatedByString(".").last {
            return className
        }
        fatalError("\(__FUNCTION__): This method no longer works for getting the Swift class name.")
    }
    
    
    
    
    // MARK: - Constraints
    
//    var leftConstraint: NSLayoutConstraint? {
//        get {
//            return findParentConstraint(.Leading)
//        }
//    }
//    
//    
//    var rightConstraint: NSLayoutConstraint? {
//        get {
//            return findParentConstraint(.Trailing)
//        }
//    }
//    
//    
//    var topConstraint: NSLayoutConstraint? {
//        get {
//            return findParentConstraint(.Top)
//        }
//    }
//    
//    var bottomConstraint: NSLayoutConstraint? {
//        get {
//            return findParentConstraint(.Bottom)
//        }
//    }
//    
    // MARK: - Constraints (Width/Height)
    
//    var widthConstraint: NSLayoutConstraint? {
//        get {
//            return findConstraint(.Width)
//        }
//    }
//    
//    var heightConstraint: NSLayoutConstraint? {
//        get {
//            return findConstraint(.Height)
//        }
//    }
    
//    private func findConstraint(attribute: NSLayoutAttribute) -> NSLayoutConstraint? {
//        var foundConstraint: NSLayoutConstraint?
//        
//        if attribute == .Width || attribute == .Height {
//            for (index, constraint: NSLayoutConstraint) in enumerate(self.constraints() as [NSLayoutConstraint) {
//                if constraint.isMemberOfClass(NSLayoutConstraint) && constraint.firstAttribute == attribute {
//                    foundConstraint = constraint
//                }
//            }
//        }
//        
//        return foundConstraint
//    }
    
    
    
    
    
    
    
    
    
    // MARK: - Constraints (Center)
    
//    var horizontalCenterConstraint: NSLayoutConstraint? {
//        get {
//            return findParentConstraint(.CenterX)
//        }
//    }
//    
//    var verticalCenterConstraint: NSLayoutConstraint? {
//        get {
//            return findParentConstraint(.CenterY)
//        }
//    }
//    
//    private func findParentConstraint(attribute: NSLayoutAttribute) -> NSLayoutConstraint? {
//        var foundConstraint: NSLayoutConstraint?
//        
//        for (index, constraint: NSLayoutConstraint) in (self.constraints() as [NSLayoutConstraint]) {
//            if ((constraint.firstItem as! UIView == self && constraint.firstAttribute == attribute) ||
//                (constraint.secondItem as! UIView? == self && constraint.secondAttribute == attribute)) &&
//                constraint.isMemberOfClass(NSLayoutConstraint) {
//                    foundConstraint = constraint
//            }
//        }
//        
//        return foundConstraint
//    }
    
    
    
    
//    class func constraints(views views: [NSObject : AnyObject], formats: String...) -> [AnyObject] {
//        var constraints = [NSLayoutConstraint]()
//        
//        for format in formats {
//            if format.hasPrefix("H:") {
//                constraints += NSLayoutConstraint.constraintsWithVisualFormat(format, options: NSLayoutFormatOptions(), metrics: nil, views: views as! [String : AnyObject])
//            } else {
//                constraints += NSLayoutConstraint.constraintsWithVisualFormat(format, options: NSLayoutFormatOptions(), metrics: nil, views: views as! [String : AnyObject])
//            }
//        }
//        
//        return constraints
//    }
//    
//    
    

    
    
    // MARK: - Constraints
    
    
    func sx_verticallyCenter(margin: CGFloat = 0) -> [NSLayoutConstraint] {
        if let superview = self.superview {
            return [NSLayoutConstraint(item: self, attribute: .CenterY, relatedBy: .Equal, toItem: superview, attribute: .CenterY, multiplier: 1, constant: margin)]
        }
        return []
    }
    
    func sx_horizontalCenter(margin: CGFloat = 0) -> [NSLayoutConstraint] {
        if let superview = self.superview {
            return [NSLayoutConstraint(item: self, attribute: .CenterX, relatedBy: .Equal, toItem: superview, attribute: .CenterX, multiplier: 1, constant: margin)]
        }
        return []
    }
    
    func sx_leadingSnap(margin: CGFloat = 0) -> [NSLayoutConstraint] {
        if let superview = self.superview {
            return [NSLayoutConstraint(item: self, attribute: .Leading, relatedBy: .Equal, toItem: superview, attribute: .Leading, multiplier: 1, constant: margin)]
        }
        return []
    }
    
    func sx_trailingSnap(margin: CGFloat = 0) -> [NSLayoutConstraint] {
        if let superview = self.superview {
            return [NSLayoutConstraint(item: self, attribute: .Trailing, relatedBy: .Equal, toItem: superview, attribute: .Trailing, multiplier: 1, constant: -margin)]
        }
        return []
    }
    
    func sx_horizontalFill(margin: CGFloat = 0) -> [NSLayoutConstraint] {
        return self.sx_leadingSnap(margin) + self.sx_trailingSnap(margin)
    }
    
    
    func sx_topSnap(margin: CGFloat = 0) -> [NSLayoutConstraint] {
        if let superview = self.superview {
            return [NSLayoutConstraint(item: self, attribute: .Top, relatedBy: .Equal, toItem: superview, attribute: .Top, multiplier: 1, constant: margin)]
        }
        return []
    }
    
    func sx_bottomSnap(margin: CGFloat = 0) -> [NSLayoutConstraint] {
        if let superview = self.superview {
            return [NSLayoutConstraint(item: self, attribute: .Bottom, relatedBy: .Equal, toItem: superview, attribute: .Bottom, multiplier: 1, constant: -margin)]
        }
        return []
    }
    
    func sx_verticalFill(margin: CGFloat = 0) -> [NSLayoutConstraint] {
        return self.sx_topSnap(margin) + self.sx_bottomSnap(margin)
    }
    
    func sx_fixedHeight(height: CGFloat) -> [NSLayoutConstraint] {
        return [NSLayoutConstraint(item: self, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 0, constant: height)]
    }
    
    func sx_fixedWidth(width: CGFloat) -> [NSLayoutConstraint] {
        return [NSLayoutConstraint(item: self, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 0, constant: width)]
    }
    
    func sx_fixedSize(size: CGSize) -> [NSLayoutConstraint] {
        return sx_fixedWidth(size.width) + sx_fixedHeight(size.height)
    }
    
    
    func sx_verticalAfter(view: UIView, margin: CGFloat = 0) -> [NSLayoutConstraint] {
        return [NSLayoutConstraint(item: self, attribute: .Top, relatedBy: .Equal, toItem: view, attribute: .Bottom, multiplier: 1, constant: margin)]
    }
    
    func sx_verticalBefore(view: UIView, margin: CGFloat = 0) -> [NSLayoutConstraint] {
        return [NSLayoutConstraint(item: self, attribute: .Bottom, relatedBy: .Equal, toItem: view, attribute: .Top, multiplier: 1, constant: -margin)]
    }
    
    func sx_horizontalAfter(view: UIView, margin: CGFloat = 0) -> [NSLayoutConstraint] {
        return [NSLayoutConstraint(item: self, attribute: .Leading, relatedBy: .Equal, toItem: view, attribute: .Trailing, multiplier: 1, constant: margin)]
    }
    
    func sx_horizontalBefore(view: UIView, margin: CGFloat = 0) -> [NSLayoutConstraint] {
        return [NSLayoutConstraint(item: self, attribute: .Trailing, relatedBy: .Equal, toItem: view, attribute: .Leading, multiplier: 1, constant: -margin)]
    }
    
    func sx_aspectRatioSize(aspectRatio: CGFloat) -> [NSLayoutConstraint] {
        return [NSLayoutConstraint(item: self, attribute: .Width, relatedBy: .Equal, toItem: self, attribute: .Height, multiplier: aspectRatio, constant:0)]
    }
    
    
    func sx_equalWidth(view: UIView, multiplier: CGFloat = 1, constant: CGFloat = 0) -> [NSLayoutConstraint] {
        return [NSLayoutConstraint(item: self, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: multiplier, constant: constant)]
    }
    
    func sx_equalHeigth(view: UIView, multiplier: CGFloat = 1, constant: CGFloat = 0) -> [NSLayoutConstraint] {
        return [NSLayoutConstraint(item: self, attribute: .Height, relatedBy: .Equal, toItem: view, attribute: .Height, multiplier: multiplier, constant: constant)]
    }
}



extension Array where Element: NSLayoutConstraint {
    
    func priority(priority: UILayoutPriority) -> [NSLayoutConstraint] {
        return self.map { (l: NSLayoutConstraint) -> NSLayoutConstraint in
            l.priority = priority
            return l
        }
    }
    
    func relatedBy(relation: NSLayoutRelation) -> [NSLayoutConstraint] {
        return self.map { (l: NSLayoutConstraint) -> NSLayoutConstraint in
            let lNew = NSLayoutConstraint(item: l.firstItem, attribute: l.firstAttribute, relatedBy: relation, toItem: l.secondItem, attribute: l.secondAttribute, multiplier: l.multiplier, constant: l.constant)
            return lNew
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    /**
     Create a NSLayoutConstraint with Left Alignment.
     
     let leftEqualConstraint = button.sl_alignLeft(label)
     let leftGeaterConstraint = button.sl_alignLeft(label, relation:.GreaterThanOrEqual)
     :param: view to align.
     :param: relation between the views.
     
     :returns: NSLayoutConstraint.
     */
    public func sl_alignLeft(view: UIView, relation: NSLayoutRelation = .Equal) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self, attribute: .Left, relatedBy: relation, toItem: view, attribute: .Left, multiplier: 1.0, constant: 0.0)
    }
    
    /**
     Create a NSLayoutConstraint with Top Alignment.
     
     let topEqualConstraint = button.sl_alignTop(label)
     let topGeaterConstraint = button.sl_alignTop(label, relation:.GreaterThanOrEqual)
     
     :param: view to align.
     :param: relation between the views.
     
     :returns: NSLayoutConstraint.
     */
    public func sl_alignTop(view: UIView, relation: NSLayoutRelation = .Equal) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self, attribute: .Top, relatedBy: relation, toItem: view, attribute: .Top, multiplier: 1.0, constant: 0.0)
    }
    
    /**
     Create a NSLayoutConstraint with Right Alignment.
     
     let rightEqualConstraint = button.sl_alignRight(label)
     let rightGeaterConstraint = button.sl_alignRight(label, relation:.GreaterThanOrEqual)
     
     :param: view to align.
     :param: relation between the views.
     
     :returns: NSLayoutConstraint.
     */
    public func sl_alignRight(view: UIView, relation: NSLayoutRelation = .Equal) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self, attribute: .Right, relatedBy: relation, toItem: view, attribute: .Right, multiplier: 1.0, constant: 0.0)
    }
    
    /**
     Create a NSLayoutConstraint with Bottom Alignment.
     
     let bottomEqualConstraint = button.sl_alignBottom(label)
     let bottomGeaterConstraint = button.sl_alignBottom(label, relation:.GreaterThanOrEqual)
     
     :param: view to align.
     :param: relation between the views.
     
     :returns: NSLayoutConstraint.
     */
    public func sl_alignBottom(view: UIView, relation: NSLayoutRelation = .Equal) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self, attribute: .Bottom, relatedBy: relation, toItem: view, attribute: .Bottom, multiplier: 1.0, constant: 0.0)
    }
    
    /**
     Create a NSLayoutConstraint with Leading Alignment.
     
     let leadingEqualConstraint = button.sl_alignLeading(label)
     let leadingGeaterConstraint = button.sl_alignLeading(label, relation:.GreaterThanOrEqual)
     
     :param: view to align.
     :param: relation between the views.
     
     :returns: NSLayoutConstraint.
     */
    public func sl_alignLeading(view: UIView, relation: NSLayoutRelation = .Equal) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self, attribute: .Leading, relatedBy: relation, toItem: view, attribute: .Leading, multiplier: 1.0, constant: 0.0)
    }
    
    /**
     Create a NSLayoutConstraint with Trailing Alignment.
     
     let trailingEqualConstraint = button.sl_alignTrailing(label)
     let trailingGeaterConstraint = button.sl_alignTrailing(label, relation:.GreaterThanOrEqual)
     
     :param: view to align.
     :param: relation between the views.
     
     :returns: NSLayoutConstraint.
     */
    public func sl_alignTrailing(view: UIView, relation: NSLayoutRelation = .Equal) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self, attribute: .Trailing, relatedBy: relation, toItem: view, attribute: .Trailing, multiplier: 1.0, constant: 0.0)
    }
    
    
//    //MARK: - 
//    static var reuseIdentifier: String {
//        return self.className;
//    }
//    
//    static var mainBundleNib: UINib {
//        return UINib(nibName: self.className, bundle: NSBundle.mainBundle())
//    }
//    
//    //MARK: - 2
//    public func animateConstraintChange(duration: NSTimeInterval) {
//        
//        UIView.animateWithDuration(duration, animations: { () in
//            self.layoutIfNeeded()
//        })
//    }
//    
//    public func showLoader() {
//        
//        var actInd : UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(0,0, 50, 50)) as UIActivityIndicatorView
//        actInd.center = self.center
//        actInd.hidesWhenStopped = true
//        actInd.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
//        actInd.setTranslatesAutoresizingMaskIntoConstraints(false)
//        self.addSubview(actInd)
//        actInd.addCenterYConstraint(toView: self)
//        actInd.addCenterXConstraint(toView: self)
//        actInd.startAnimating()
//    }
//    
//    public func hideLoader() {
//        for v in self.subviews {
//            if v is UIActivityIndicatorView{
//                v.stopAnimating()
//            }
//        }
//    }
//    
    
    
    
}