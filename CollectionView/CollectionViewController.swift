//
//  CollectionViewController.swift
//  CollectionView
//
//  Created by Alberto Moral on 07/10/2017.
//  Copyright © 2017 Alberto Moral. All rights reserved.
//

import Foundation
import Cocoa

class CollectionViewController: NSViewController {
    var mainView: CollectionView { return self.view as! CollectionView }
    fileprivate var adapter: AdapterCollectionView?

    override func loadView() {
        let rect = NSRect(x: 0, y: 0, width: 200, height: 200)
        view = CollectionView(frame: rect)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
    }
    
    private func configureCollectionView() {
        adapter = AdapterCollectionView(collectionView: mainView.collectionView)
        let users = [User(name: "Alberto"),
                     User(name: "Felipe"),
                     User(name: "Aaron"),
                     User(name: "Laura"),
                     User(name: "Giuseppe")]
        adapter?.set(items: users)
    }
}
