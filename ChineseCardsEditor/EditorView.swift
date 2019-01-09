//
//  SelectorView.swift
//  ChineseCardsEditor
//
//  Created by Kevin Zhou on 8/11/17.
//  Copyright © 2017 Kevin Zhou. All rights reserved.
//

import Foundation
import UIKit

class EditorView:UIView, UITextFieldDelegate{
    var chineseEditor:UITextField!
    var englishEditor:UITextField!
    var addButton:UIButton!
    var audioButton:UIButton!
    var backButton:UIButton!
    var classNameLabel:UILabel!
    
    override init (frame : CGRect) {
        super.init(frame : frame)
        
        self.backgroundColor = UIColor.white
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(EditorView.dismissKeyboard))
        self.addGestureRecognizer(tap)
        
        classNameLabel = UILabel(frame: CGRect(x: self.frame.size.width/2-self.frame.size.width/4, y: self.frame.size.width/10, width: self.frame.size.width/2, height: self.frame.size.width/10))
        classNameLabel.text = "placeholder"
        classNameLabel.font = UIFont(name: "Helvetica", size: 25)
        classNameLabel.textColor = UIColor.black
        addSubview(classNameLabel)
        
        backButton = UIButton(frame: CGRect(x: 10, y: 10, width: 50, height: 50))
        let image = UIImage(named: "dismissIcon.png")
        
        backButton.setImage(image, for: UIControlState.normal)
        addSubview(backButton)
        backButton.addTarget(self, action: #selector(goBack), for: UIControlEvents.touchUpInside)
        
        chineseEditor = UITextField()
        chineseEditor.frame.size = CGSize(width: self.frame.size.width/4, height: self.frame.size.width/6)
        chineseEditor.frame.origin = CGPoint(x: self.frame.size.width/2-chineseEditor.frame.size.width/2, y: self.frame.size.height/5-chineseEditor.frame.size.height/2)
        chineseEditor.backgroundColor = UIColor.white
        chineseEditor.layer.borderColor = UIColor.black.cgColor
        chineseEditor.layer.borderWidth = 1
        chineseEditor.font = UIFont(name: "Helvetica", size: 25)
        chineseEditor.text = "Chinese"
        chineseEditor.textColor = UIColor.black
        self.addSubview(chineseEditor)
        chineseEditor.returnKeyType = UIReturnKeyType.done
        
        
        englishEditor = UITextField()
        englishEditor.frame.size = CGSize(width: self.frame.size.width/4, height: self.frame.size.width/6)
        englishEditor.frame.origin = CGPoint(x: self.frame.size.width/2-englishEditor.frame.size.width/2, y: self.frame.size.height/5*2-englishEditor.frame.size.height/2)
        englishEditor.backgroundColor = UIColor.white
        englishEditor.layer.borderColor = UIColor.black.cgColor
        englishEditor.font = UIFont(name: "Helvetica", size: 25)
        englishEditor.layer.borderWidth = 1
        englishEditor.text = "English"
        englishEditor.textColor = UIColor.black
        self.addSubview(englishEditor)
        englishEditor.returnKeyType = UIReturnKeyType.done
        
        chineseEditor.delegate = self
        englishEditor.delegate = self
        
        audioButton = UIButton()
        audioButton.setBackgroundImage(UIImage(named: "microphone.png"), for: UIControlState.normal)
        audioButton.frame.size = CGSize(width: self.frame.size.width/6, height: self.frame.size.width/6)
        audioButton.frame.origin = CGPoint(x: self.frame.size.width/2-audioButton.frame.size.width/2, y: self.frame.size.height/5*3-audioButton.frame.size.height/2)
        self.addSubview(audioButton)
        
        addButton = UIButton()
        addButton.setBackgroundImage(UIImage(named: "add.png"), for: UIControlState.normal)
        addButton.frame.size = CGSize(width: self.frame.size.width/6, height: self.frame.size.width/6)
        addButton.frame.origin = CGPoint(x: self.frame.size.width/2-addButton.frame.size.width/2, y: self.frame.size.height/5*4-addButton.frame.size.height/2)
        self.addSubview(addButton)
    }
    
    public func setName(name:String){
        classNameLabel.text = name
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.endEditing(true)
        return false
    }
    
    func goBack() {
        self.removeFromSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func dismissKeyboard() {
        self.endEditing(true)
    }
    
}
