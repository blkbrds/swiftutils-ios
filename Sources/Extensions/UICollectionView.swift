//
//  UICollectionView.swift
//  SwiftUtils
//
//  Created by DaoNV on 10/22/15.
//  Copyright © 2016 Asian Tech Co., Ltd. All rights reserved.
//

import UIKit

extension UICollectionView {
    open func register<T: UICollectionViewCell>(_ aClass: T.Type) {
        let name = String(describing: aClass)
        if Bundle(for: aClass).path(forResource: name, ofType: "xib") != nil {
            let nib = UINib(nibName: name, bundle: nil)
            register(nib, forCellWithReuseIdentifier: name)
        } else {
            register(aClass, forCellWithReuseIdentifier: name)
        }
    }

    open func register<T: UICollectionReusableView>(header aClass: T.Type) {
        let name = String(describing: aClass)
        let kind = UICollectionElementKindSectionHeader
        if Bundle(for: aClass).path(forResource: name, ofType: "xib") != nil {
            let nib = UINib(nibName: name, bundle: nil)
            register(nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: name)
        } else {
            register(aClass, forSupplementaryViewOfKind: kind, withReuseIdentifier: name)
        }
    }

    open func register<T: UICollectionReusableView>(footer aClass: T.Type) {
        let name = String(describing: aClass)
        let kind = UICollectionElementKindSectionFooter
        if Bundle(for: aClass).path(forResource: name, ofType: "xib") != nil {
            let nib = UINib(nibName: name, bundle: nil)
            register(nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: name)
        } else {
            register(aClass, forSupplementaryViewOfKind: kind, withReuseIdentifier: name)
        }
    }

    open func dequeue<T: UICollectionViewCell>(_ aClass: T.Type, forIndexPath indexPath: IndexPath) -> T {
        let name = String(describing: aClass)
        guard let cell = dequeueReusableCell(withReuseIdentifier: name, for: indexPath) as? T else {
            fatalError("\(name) is not registed")
        }
        return cell
    }

    open func dequeue<T: UICollectionReusableView>(header aClass: T.Type, forIndexPath indexPath: IndexPath) -> T {
        let name = String(describing: aClass)
        guard let cell = dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: name, for: indexPath) as? T else {
            fatalError("\(name) is not registed")
        }
        return cell
    }

    open func dequeue<T: UICollectionReusableView>(footer aClass: T.Type, forIndexPath indexPath: IndexPath) -> T {
        let name = String(describing: aClass)
        guard let cell = dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionFooter, withReuseIdentifier: name, for: indexPath) as? T else {
            fatalError("\(name) is not registed")
        }
        return cell
    }
}
