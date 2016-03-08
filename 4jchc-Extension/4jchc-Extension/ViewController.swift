//
//  ViewController.swift
//  4jchc-Extension
//
//  Created by 蒋进 on 16/1/10.
//  Copyright © 2016年 sijichcai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        GCD()
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        

         printLog("ddjdj")
        
        printLog(" 4的毫秒=\(4.milliseconds)")
        printLog("2秒=\(2.seconds)")
    }
    
    func GCD(){
        
        //Creamos un objeto NSBlockOperation con un bloque que muestra por pantalla los numeros del 0-9999
        let operation1 = NSBlockOperation(
            block: { () -> Void in
                for var i = 0; i < 9; i++ {
                    printLog("\n operation1-\(i)")
                }
        })
        
        //Creamos otro objeto NSBlockOperation que muestre el caracter '*'
        let operation2 = NSBlockOperation(
            block: { () -> Void in
                for var i = 0; i < 9; i++ {
                    printLog("\n operation2-\(i)*")
                }
        })
        
        /* Y ejecutamos el metodo addDependency introduciendo como parametro el primer operation que creamos anteriormente */
        operation2.addDependency(operation1)
        
        //Creamos una NSOperationQueue y le añadimos nuestro objeto operation
        let myQueue = NSOperationQueue.mainQueue()
        myQueue.addOperations([operation1, operation2], waitUntilFinished: false)
        
        //Se ejecuta en el hilo principal
        for var i = 0; i < 9; i++ {
            printLog("a")
        }
    }
    
}

