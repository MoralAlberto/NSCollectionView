//
//  File.swift
//  CollectionView
//
//  Created by Alberto Moral on 07/10/2017.
//  Copyright © 2017 Alberto Moral. All rights reserved.
//

import Cocoa

class AdapterCollectionView: NSObject {
    fileprivate static let numberOfSections = 1
    fileprivate static let itemId = "UserCollectionViewItem"
    
    fileprivate var items = [User]() {
        didSet {
            collectionView.reloadData()
        }
    }
    private var collectionView: NSCollectionView
    
    init(collectionView: NSCollectionView) {
        self.collectionView = collectionView
        super.init()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
    func set(items: [User]) {
        self.items = items
    }
}

extension AdapterCollectionView: NSCollectionViewDataSource, NSCollectionViewDelegate {
    func numberOfSectionsInCollectionView(collectionView: NSCollectionView) -> Int {
        return AdapterCollectionView.numberOfSections
    }
    
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let item = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: AdapterCollectionView.itemId), for: indexPath)
        guard let collectionViewItem = item as? UserCollectionViewItem else { return item }
        
        let name = items[indexPath.item].name
        collectionViewItem.configure(name: name)
        
        return item
    }
    
    func collectionView(_ collectionView: NSCollectionView, didSelectItemsAt indexPaths: Set<IndexPath>) {
        let name = items[(indexPaths.first?.item)!].name
        Swift.print("Name \(name)")
    }
}

extension AdapterCollectionView: NSCollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> NSSize {
        return NSSize(width: 200, height: 100)
    }

}
