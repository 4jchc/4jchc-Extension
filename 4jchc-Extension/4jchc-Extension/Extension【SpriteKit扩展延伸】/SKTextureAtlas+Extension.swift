//
//  SKTextureAtlas.swift
//  4jchc-Extension
//
//  Created by 蒋进 on 16/1/18.
//  Copyright © 2016年 sijichcai. All rights reserved.
//

import UIKit
import SpriteKit


extension SKTextureAtlas {
    //加载纹理图集atlas
    /**
    *  根据运行设备加载不同的纹理贴图集
    *
    *  @param name 纹理贴图集的名称
    *
    *  @return 纹理贴图集
    */
   static func atlasWithName( var name:String) ->SKTextureAtlas{
    
    if (IS_IPHONE_5) {
        name = NSString(format: "%@-568", name) as String
    } else if (IS_IPAD) {
        name = NSString(format: "%@-ipad", name) as String
    
    }
    return SKTextureAtlas(named: name)
    }
    


}