//
//  UserCellView.swift
//  CollectionView
//
//  Created by Alberto Moral on 07/10/2017.
//  Copyright © 2017 Alberto Moral. All rights reserved.
//

import Cocoa

class UserCellView: BaseView {
    
    fileprivate let nameField: NSTextField = {
        let textField = NSTextField()
        textField.backgroundColor = NSColor.gray
        textField.maximumNumberOfLines = 1
        textField.isBordered = false
        textField.isEditable = false
        textField.alignment = .center
        return textField
    }()
    
    override func addSubviews() {
        [nameField].forEach(addSubview)
    }
    
    override func addConstraints() {
        nameField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([nameField.topAnchor.constraint(equalTo: nameField.superview!.topAnchor),
            nameField.leadingAnchor.constraint(equalTo: nameField.superview!.leadingAnchor),
            nameField.bottomAnchor.constraint(equalTo: nameField.superview!.bottomAnchor),
            nameField.trailingAnchor.constraint(equalTo: nameField.superview!.trailingAnchor)])
    }
    
    func flushData() {
        nameField.stringValue = ""
    }
}

extension UserCellView {
    var name: String? {
        get {
            return nameField.stringValue
        }
        set(newValue) {
            nameField.stringValue = newValue ?? ""
        }
    }
}
