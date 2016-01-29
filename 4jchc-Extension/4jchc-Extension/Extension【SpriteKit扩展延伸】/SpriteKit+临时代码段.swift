//
//  临时代码段.swift
//  4jchc-Extension
//
//  Created by 蒋进 on 16/1/22.
//  Copyright © 2016年 sijichcai. All rights reserved.
//

import UIKit

import SpriteKit

struct PhysicsCatagory {
    
    static let Boognish : UInt32 = 0x1 << 1
    static let Ground : UInt32 = 0x1 << 2
    static let Wall : UInt32 = 0x1 << 3
    static let Guava : UInt32 = 0x1 << 4
    static let Pepper: UInt32 = 0x1 << 5
}
//func didBeginContact(contact: SKPhysicsContact){
//    //if bodys impact
//    var firstBody:SKPhysicsBody
//    var secondBody:SKPhysicsBody
//    if(contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask){
//        firstBody = contact.bodyA
//        secondBody = contact.bodyB
//    }
//    else{
//        firstBody = contact.bodyB
//        secondBody = contact.bodyA
//    }
//    if(firstBody.categoryBitMask == 1 && secondBody.categoryBitMask == 2){
//        //if impact:
//        //update score (delete and add label)
//        points++
//        self.childNodeWithName("Points")?.removeFromParent()
//        score.text = "Score: \(points)"
//        self.addChild(score)
//        //delete object
//        secondBody.node?.removeFromParent()
//        //wait a second and show object
//        let delay = SKAction.waitForDuration(1)
//        let generar = SKAction.runBlock({
//            self.addChild(self.target)
//        })
//        let secuency = SKAction.sequence([delay,generar])
//        self.runAction(secuency)
//    }
//}


class VJUtil {

    //MARK: - 得到相邻一对的碰撞体
    ///  得到相邻一对的碰撞体
    class func getBodyPair(contact: SKPhysicsContact) -> (SKPhysicsBody, SKPhysicsBody) {
        
        var firstBody: SKPhysicsBody
        var secondBody: SKPhysicsBody
        
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        }
        else {
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        
        return (firstBody, secondBody)
    }
    
}