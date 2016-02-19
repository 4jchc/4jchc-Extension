//
//  UICollectionView.swift
//  4jchc-Extension
//
//  Created by 蒋进 on 16/2/7.
//  Copyright © 2016年 sijichcai. All rights reserved.
//

import UIKit

extension UICollectionView{
    
    //MARK: - 从XIB加载注册cell
    ///  从XIB加载注册cell
    func registerNibName(nibName:String, forCellReuseIdentifier identifier:String ){
        let nib = UINib(nibName: nibName, bundle: nil) as UINib
        self.registerNib(nib, forCellWithReuseIdentifier: identifier)
    }
}