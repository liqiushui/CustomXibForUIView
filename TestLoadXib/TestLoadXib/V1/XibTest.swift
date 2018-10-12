//
//  XibTest.swift
//  TestLoadXib
//
//  Created by lunli on 2018/10/12.
//  Copyright © 2018年 lunli. All rights reserved.
//

import UIKit

@IBDesignable
class XibTest: XibElementContainer {
    @IBOutlet weak var testBtn: UIButton!
    
    @IBAction func click(_ sender: Any) {
        print("click")
    }
    
    
}
