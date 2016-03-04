

import Foundation
import UIKit
extension UIBarButtonItem{
    

    /*
    1.如果在func前面加上class, 就相当于OC中的+
    2.首先setBackgroundImage，image会随着button的大小而改变，图片自动会拉伸来适应button的大小，这个时候任然可以设置button的title，image不会挡住title；
    相反的的setImage，图片不会进行拉伸，原比例的显示在button上，此时再设置title，title将无法显示，因此可以根据需求选中方法；
    
    */
    
    //MARK:  【Nav-按钮-无文字】-UIButton设置正常&高亮&点击事件
    ///  【Nav-按钮-无文字】-UIButton设置正常&高亮&点击事件
    class func ItemWithBarButtonItem(image:String, target: AnyObject?, action:String?) ->UIBarButtonItem {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: image), forState: UIControlState.Normal)
        button.setBackgroundImage(UIImage(named: image + "-click"), forState: UIControlState.Highlighted)
        
        if action != nil{
            
            button.addTarget(target, action: Selector(action!), forControlEvents: UIControlEvents.TouchUpInside)
            
        }
        button.size = button.currentBackgroundImage!.size;
        return UIBarButtonItem(customView: button)
    }
    //MARK:  【Nav-按钮-有文字-返回】-UIButton设置正常&高亮&点击事件
    ///  【Nav-按钮-有文字-返回】-UIButton设置正常&高亮&点击事件
    class func ItemWithBarButtonItemBackTitle(title:String?,image:String, target: AnyObject?, action:String?) ->UIBarButtonItem {
        let button = UIButton()
        //添加字体
        if title!.characters.count > 0 {
            
            button.setTitle(title, forState: UIControlState.Normal)
            //设置字体大小
            button.titleLabel?.font = UIFont.systemFontOfSize(14)
            
            //设置字体颜色
            button.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            button.setTitleColor(UIColor.redColor(), forState: UIControlState.Highlighted)
        }
        button.setImage(UIImage(named: image), forState: UIControlState.Normal)
        button.setImage(UIImage(named: image + "-click"), forState: UIControlState.Highlighted)
        if action != nil{
            
            button.addTarget(target, action: Selector(action!), forControlEvents: UIControlEvents.TouchUpInside)
            
        }
        //button.size = button.currentImage!.size;
        // 有图片和文字
        button.size = CGSizeMake(70, 30);
        // 让按钮内部的所有内容左对齐
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left;
        // 让按钮的内容往左边偏移10
        button.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
        return UIBarButtonItem(customView: button)
    }
    


    
    //MARK:  自定义UIButton按钮设置正常&高亮&点击事件---title文字
    ///  自定义UIButton按钮设置正常&高亮&点击事件---title文字
    class func ItemWithTitleImageTarget(image_Nor_Hig_Name: String = "", title: String = "", target: AnyObject?, action:String?)->UIBarButtonItem {
        //创建一个 button
        let button = UIButton()
        //添加点击事件
        if action != nil{
            
            button.addTarget(target, action: Selector(action!), forControlEvents: UIControlEvents.TouchUpInside)
            
        }
        //添加图片
        if image_Nor_Hig_Name.characters.count > 0 {
            button.setImage(UIImage(named: image_Nor_Hig_Name), forState: UIControlState.Normal)
            button.setImage(UIImage(named: "\(image_Nor_Hig_Name)_highlighted"), forState: UIControlState.Highlighted)
        }
        
        //添加字体
        if title.characters.count > 0 {
            button.setTitle(title, forState: UIControlState.Normal)
            
            //设置字体大小
            button.titleLabel?.font = UIFont.systemFontOfSize(14)
            
            //设置字体颜色
            button.setTitleColor(UIColor.orangeColor(), forState: UIControlState.Normal)
            button.setTitleColor(UIColor.orangeColor(), forState: UIControlState.Highlighted)
        }
        
        //调整一下
        button.sizeToFit()
        
        return UIBarButtonItem(customView: button)
    }

    /*
    
    //MARK:  快速创建UIButton类型的按钮(图片正常--高亮状态)
    ///  快速创建UIButton类型的按钮(图片正常--高亮状态)
    class func creatBarButtonItem(image:String, target: AnyObject?, action:Selector?) ->UIBarButtonItem {
    let btn = UIButton()
    btn.setImage(UIImage(named: image), forState: UIControlState.Normal)
    btn.setImage(UIImage(named: image + "_highlighted"), forState: UIControlState.Highlighted)
    btn.addTarget(target, action: action, forControlEvents: UIControlEvents.TouchUpInside)
    btn.sizeToFit()
    return UIBarButtonItem(customView: btn)
    }
    
    */
    
    //MARK:  快速创建UIButton类型的按钮(图片正常--高亮状态)
    ///  快速创建UIButton类型的按钮(图片正常--高亮状态)
    class func creatBarButtonItem(image:String, target: AnyObject?, action:String?) ->UIBarButtonItem {
        let btn = UIButton()
        btn.setImage(UIImage(named: image), forState: UIControlState.Normal)
        btn.setImage(UIImage(named: image + "_highlighted"), forState: UIControlState.Highlighted)
        if action != nil
        {
            // 如果是自己封装一个按钮, 最好传入字符串, 然后再将字符串包装为Selector
            btn.addTarget(target, action: Selector(action!), forControlEvents: UIControlEvents.TouchUpInside)
        }
        btn.sizeToFit()
        return UIBarButtonItem(customView: btn)
    }
    //MARK: - init方法中的action为string类型
    ///  init方法中的action为string类型
    convenience init(image:String, target: AnyObject?, action: String?)
    {
        let btn = UIButton()
        btn.setImage(UIImage(named: image), forState: UIControlState.Normal)
        btn.setImage(UIImage(named: image + "_highlighted"), forState: UIControlState.Highlighted)
        if action != nil
        {
            // 如果是自己封装一个按钮, 最好传入字符串, 然后再将字符串包装为Selector
            btn.addTarget(target, action: Selector(action!), forControlEvents: UIControlEvents.TouchUpInside)
        }
        btn.sizeToFit()
        self.init(customView: btn)
    }
    
    
    /**
     *  创建一个item
     *  @param target    点击item后调用哪个对象的方法
     *  @param action    点击item后调用target的哪个方法
     *  @param image     图片
     *  @param highImage 高亮的图片
     *  @return 创建完的item
     */ //ItemWithImageTarget
    class func ItemWithImageTarget(target:AnyObject?,action:Selector,image:String,highImage:String) ->UIBarButtonItem{
        
        let btn:UIButton = UIButton(type: UIButtonType.Custom)
        btn.addTarget(target, action: action, forControlEvents: UIControlEvents.TouchUpInside)
        
        // 设置图片
        btn.setBackgroundImage(UIImage(named: image ), forState: UIControlState.Normal)
        btn.setBackgroundImage(UIImage(named: highImage ), forState: UIControlState.Highlighted)
        
        // 设置尺寸
        btn.frame.size = btn.currentBackgroundImage!.size;
        
        return UIBarButtonItem(customView: btn)
        
    }
    //MARK: - init方法
    convenience init(image: String?, highImage: String?, title: String?, target: AnyObject?, action: Selector) {
        
        let button = UIButton()
        if let image = image, highImage = highImage {
            button.setBackgroundImage(UIImage(named: image), forState: .Normal)
            button.setBackgroundImage(UIImage(named: highImage), forState: .Highlighted)
        }
        button.sizeToFit()
        button.addTarget(target, action: action, forControlEvents: .TouchUpInside)
        
        self.init(customView: button)
    }
    
    convenience init(title: String, target: AnyObject?, action: Selector) {
        self.init(image: nil, highImage: nil, title: title, target: target, action: action)
    }
    
    
    
    
    
    
    convenience init(image_Nor_Hig_name:String, target: AnyObject?, action: String?)
    {
        let btn = UIButton()
        btn.setImage(UIImage(named: image_Nor_Hig_name), forState: UIControlState.Normal)
        btn.setImage(UIImage(named: image_Nor_Hig_name + "_highlighted"), forState: UIControlState.Highlighted)
        if action != nil
        {
            // 如果是自己封装一个按钮, 最好传入字符串, 然后再将字符串包装为Selector
            btn.addTarget(target, action: Selector(action!), forControlEvents: UIControlEvents.TouchUpInside)
        }
        btn.sizeToFit()
        self.init(customView: btn)
    }
    
    convenience init(image: String, highImage: String, target: AnyObject?, action: Selector) {
        self.init(image: image, highImage: highImage, title: nil, target: target, action: action)
    }
    
    
    
    
}