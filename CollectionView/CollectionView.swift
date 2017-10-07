//
//  CollectionView.swift
//  CollectionView
//
//  Created by Alberto Moral on 07/10/2017.
//  Copyright © 2017 Alberto Moral. All rights reserved.
//

import Cocoa

class CollectionView: BaseView {
    var scrollViewCollectionView = NSScrollView()
    
    lazy var collectionView: NSCollectionView = {
        let flowLayout = NSCollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let collection = NSCollectionView()
        collection.collectionViewLayout = flowLayout
        collection.isSelectable = true
        collection.register(UserCollectionViewItem.self, forItemWithIdentifier: NSUserInterfaceItemIdentifier(rawValue: "UserCollectionViewItem"))
        return collection
    }()
    
    override func addSubviews() {
        scrollViewCollectionView.documentView = collectionView
        [scrollViewCollectionView].forEach(addSubview)
    }
    
    override func addConstraints() {
        scrollViewCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([scrollViewCollectionView.topAnchor.constraint(equalTo: scrollViewCollectionView.superview!.topAnchor),
                                     scrollViewCollectionView.leadingAnchor.constraint(equalTo: scrollViewCollectionView.superview!.leadingAnchor),
                                     scrollViewCollectionView.trailingAnchor.constraint(equalTo: scrollViewCollectionView.superview!.trailingAnchor),
                                     scrollViewCollectionView.bottomAnchor.constraint(equalTo: scrollViewCollectionView.superview!.bottomAnchor)
            ])
    }
}
