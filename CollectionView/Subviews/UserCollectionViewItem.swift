//
//  UserCollectionViewItem.swift
//  CollectionView
//
//  Created by Alberto Moral on 07/10/2017.
//  Copyright © 2017 Alberto Moral. All rights reserved.
//

import Cocoa

class UserCollectionViewItem: NSCollectionViewItem {
    
    let userCellView = UserCellView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.blue.cgColor
    }
    
    override func loadView() {
        view = userCellView
    }
    
    func configure(name: String) {
        userCellView.name = name
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        userCellView.flushData()
    }
}
