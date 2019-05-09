//
//  LoaderView.swift
//  CodingTest
//
//  Created by Manuel Alejandro Soria Hidalgo on 5/8/19.
//  Copyright © 2019 Manuel Alejandro Soria Hidalgo. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

public protocol LoaderViewDelegate: class {
    var loaderView: LoaderView? { get set }
    
    func showLoader()
    func hideLoader()
    var isInteractionEnabled: Bool { get }
    var isLoaderActive: Bool { get }
}

extension LoaderViewDelegate where Self: UIViewController {
    
    public func showLoader() {
        loaderView = LoaderView.getLoaderForView(self.view)
        self.view.bringSubviewToFront(loaderView!)
        loaderView!.animate()
        UIApplication.disableInteraction()
    }
    
    public func hideLoader() {
        if isInteractionEnabled == false {
            UIApplication.shared.endIgnoringInteractionEvents()
        }
        loaderView?.endAnimation()
        UIApplication.enableInteraction()
    }
}

extension LoaderViewDelegate {
    public var isInteractionEnabled: Bool { return true }
    public var isLoaderActive: Bool { return loaderView?.isAnimating ?? false }
}

public class LoaderView: UIView {
    
    private static let loaderViewTag = 1000
    private let loaderWidthHeight = 50
    private var loader: NVActivityIndicatorView!
    var isAnimating: Bool { return loader.isAnimating }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        loader = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: loaderWidthHeight, height: loaderWidthHeight),
                                           type: .ballRotateChase,
                                           color: UIColor.blue)
        addSubview(loader)
        loader.translatesAutoresizingMaskIntoConstraints = false
        addConstraint(NSLayoutConstraint(item: loader,
                                         attribute: NSLayoutConstraint.Attribute.centerX,
                                         relatedBy: NSLayoutConstraint.Relation.equal,
                                         toItem: self,
                                         attribute: NSLayoutConstraint.Attribute.centerX,
                                         multiplier: 1,
                                         constant: 0))
        addConstraint(NSLayoutConstraint(item: loader,
                                         attribute: NSLayoutConstraint.Attribute.centerY,
                                         relatedBy: NSLayoutConstraint.Relation.equal,
                                         toItem: self,
                                         attribute: NSLayoutConstraint.Attribute.centerY,
                                         multiplier: 1,
                                         constant: 0))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    public class func getLoaderForView(_ view: UIView) -> LoaderView {
        var maskView = view.viewWithTag(LoaderView.loaderViewTag) as? LoaderView
        if maskView == nil{
            maskView = LoaderView(frame: view.bounds)
            maskView!.tag = LoaderView.loaderViewTag
            view.addSubview(maskView!)
        }
        return maskView!
    }
    
    public func animate() {
        if !loader.isAnimating{
            loader.startAnimating()
        }
    }
    
    public func endAnimation() {
        loader.stopAnimating()
        removeFromSuperview()
    }
}
