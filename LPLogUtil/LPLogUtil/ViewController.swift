//
//  ViewController.swift
//  LPLogUtil
//
//  Created by 张立鹏 on 2020/4/19.
//  Copyright © 2020 masterlipeng. All rights reserved.
//

import UIKit

enum Sexual {
    case Unknown
    case Male
    case Famale
}

struct Person: CustomStringConvertible {
    var name: String = ""
    var age: Int = 0
    var sex: Sexual = .Unknown
    
    func toString() -> String {
        return "My name is \(name), I'm \(age) years old."
    }
    
    var description: String {
        get {
            return "My name is \(name), I'm \(age) years old."
        }
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        let msgCount = 16
        let lipeng = Person(name: "立鹏", age: 28, sex: .Male)
//        Log.log(.I, "Log message \(msgCount)")
        Log.d("Log message: \(lipeng)")
        Log.e(lipeng)
        Log.w(lipeng.toString())
        
        Log.d(18)
        
        Log.d(.none)
        
        print("Log message: \(lipeng)")
        print(lipeng)
        print(lipeng.toString())
    }


}

