//
//  UIBarButtonExtension.swift
//  CodingTest
//
//  Created by Manuel Alejandro Soria Hidalgo on 5/8/19.
//  Copyright © 2019 Manuel Alejandro Soria Hidalgo. All rights reserved.
//

import UIKit

public typealias closure = @convention(block) () -> ()
private var closureKey: Void?

extension UIBarButtonItem {
    public convenience init(title: String?, style: UIBarButtonItem.Style, closure: @escaping closure) {
        self.init(title: title, style: style, target: nil, action: #selector(self.callActionClosure(_:)))
        self.target = self
        self.handleEvent(closure)
    }
    
    public func handleEvent(_ closure: @escaping closure) {
        let dealObject: AnyObject = unsafeBitCast(closure, to: AnyObject.self)
        objc_setAssociatedObject(self, &closureKey, dealObject, .OBJC_ASSOCIATION_COPY_NONATOMIC)
    }
    
    @objc fileprivate func callActionClosure(_ btn: AnyObject!) {
        let closureObject: AnyObject = objc_getAssociatedObject(self, &closureKey) as AnyObject
        let closureAction = unsafeBitCast(closureObject, to: closure.self)
        closureAction()
    }
    
    public func setupStandardUIStates() {
        setup(font: UIFont.systemFont(ofSize: 16))
        
    }
    
    public func setup(font: UIFont) {
        setTitleTextAttributes([NSAttributedString.Key.font: font,
                                NSAttributedString.Key.foregroundColor: UIColor.white],
                               for: .normal)
        setTitleTextAttributes([NSAttributedString.Key.font: font],
                               for: .highlighted)
        setTitleTextAttributes([NSAttributedString.Key.font: font,
                                NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.5)],
                               for: .disabled)
    }
    
}
