//
//  ViewController.swift
//  ChineseCardsEditor
//
//  Created by Kevin Zhou on 8/11/17.
//  Copyright © 2017 Kevin Zhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var selectorView:SelectorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectorView = SelectorView(frame: self.view.frame)
        self.view.addSubview(selectorView)
        
        self.view.isUserInteractionEnabled = true
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

