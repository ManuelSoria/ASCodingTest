//
//  UITableViewExtension.swift
//  CodingTest
//
//  Created by Manuel Alejandro Soria Hidalgo on 5/8/19.
//  Copyright © 2019 Manuel Alejandro Soria Hidalgo. All rights reserved.
//

import UIKit

extension UITableView {
    
    public func register(_ cellClass: AnyClass, in bundle: Bundle? = nil) {
        register(cellClass,
                 in: bundle,
                 reusableString: String(describing: cellClass.self))
    }
    
    public func register(_ cellClass: AnyClass, in bundle: Bundle? = nil, reusableString: String) {
        register(UINib(nibName: String(describing: cellClass.self),
                       bundle: Bundle(for: cellClass.self)),
                 forCellReuseIdentifier: reusableString)
    }
    
    public func register(cells: [AnyClass]) {
        cells.forEach({ self.register($0) })
    }
    
}
