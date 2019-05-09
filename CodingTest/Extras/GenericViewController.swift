//
//  GenericViewController.swift
//  CodingTest
//
//  Created by Manuel Alejandro Soria Hidalgo on 5/8/19.
//  Copyright © 2019 Manuel Alejandro Soria Hidalgo. All rights reserved.
//

import UIKit

class GenericViewController: UIViewController {
    
    public var loaderView: LoaderView?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target: nil, action: nil)
    }
    
}

extension GenericViewController: LoaderViewDelegate {
    
}

extension UIViewController {
    public func setupNavigationBarColor(_ barColor: UIColor) {
        navigationController?.navigationBar.barTintColor = barColor
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16) , NSAttributedString.Key.foregroundColor : UIColor.white
        ]
    }
    
    public func addCancelButtonWithClosure(_ action: @escaping closure)  {
        let backbutton = UIBarButtonItem(title: "Cancel", style: .plain, closure: action)
        backbutton.setupStandardUIStates()
        navigationItem.leftBarButtonItem = backbutton
    }
    
    public func embedInNavigationController() -> UINavigationController{
        return UINavigationController(rootViewController: self)
    }
    
}
