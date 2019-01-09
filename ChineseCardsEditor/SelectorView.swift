//
//  SelectorView.swift
//  ChineseCardsEditor
//
//  Created by Kevin Zhou on 8/11/17.
//  Copyright © 2017 Kevin Zhou. All rights reserved.
//

import Foundation
import UIKit
class SelectorView:UIView, UITextFieldDelegate{
    var addView:UIView!
    var addButton:UIButton!
    var nameEditor:UITextField!
    
    override init (frame : CGRect) {
        super.init(frame:frame)
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(EditorView.dismissKeyboard))
        self.addGestureRecognizer(tap)
        
        addView = UIView()
        addView.frame = CGRect(x: 0, y: self.frame.size.width/11, width: self.frame.size.width, height: self.frame.size.width/8)
        
        addButton = UIButton()
        addButton.setBackgroundImage(UIImage(named: "add.png"), for: UIControlState.normal)
        addButton.frame.size = CGSize(width: self.frame.size.width/8, height: self.frame.size.width/8)
        addButton.frame.origin = CGPoint(x: self.frame.size.width/8*6, y: 0)
        addButton.addTarget(self, action: #selector(addClass), for: UIControlEvents.touchUpInside)
        addView.addSubview(addButton)
        
        nameEditor = UITextField()
        nameEditor.frame.size = CGSize(width: self.frame.size.width/2, height: self.frame.size.width/8)
        nameEditor.frame.origin = CGPoint(x: self.frame.size.width/8, y: addButton.frame.origin.y)
        nameEditor.backgroundColor = UIColor.white
        nameEditor.layer.borderColor = UIColor.black.cgColor
        nameEditor.layer.borderWidth = 1
        nameEditor.font = UIFont(name: "Helvetica", size: 25)
        nameEditor.text = "Set Class Name"
        nameEditor.textColor = UIColor.black
        addView.addSubview(nameEditor)
        nameEditor.returnKeyType = UIReturnKeyType.done
        
        nameEditor.delegate = self
        
        addSubview(addView)
        self.isUserInteractionEnabled = true
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.endEditing(true)
        return false
    }
    
    func resetNameEditor() {
        nameEditor.text = "Set Class Name"
    }
    
    func addClass() {
        if nameEditor.text != "Set Class Name"{
            let newClass = UIButton(frame: CGRect(x: self.frame.size.width/4, y: self.frame.size.width/8*CGFloat(self.subviews.count+1), width: self.frame.size.width/2, height: self.frame.size.width/8))
            newClass.setTitle(nameEditor.text, for: UIControlState.normal)
            newClass.setTitleColor(UIColor.black, for: UIControlState.normal)
            newClass.layer.borderWidth = 1
            newClass.tag = self.subviews.count
            newClass.layer.borderColor = UIColor.black.cgColor
            newClass.isUserInteractionEnabled = true
            newClass.backgroundColor = UIColor.white
            newClass.addTarget(self, action: #selector(goToEditor), for: UIControlEvents.touchUpInside)
            resetNameEditor()
            addSubview(newClass)
        }
    }
    
    func dismissKeyboard() {
        self.endEditing(true)
    }
    
    func goToEditor() {
        let editorView = EditorView(frame: self.frame)
        editorView.setName(name: )
        self.addSubview(editorView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
