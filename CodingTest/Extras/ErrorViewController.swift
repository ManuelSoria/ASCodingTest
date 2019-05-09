//
//  ErrorViewController.swift
//  CodingTest
//
//  Created by Manuel Alejandro Soria Hidalgo on 5/8/19.
//  Copyright © 2019 Manuel Alejandro Soria Hidalgo. All rights reserved.
//

import UIKit

protocol ErrorViewControllerDelegate: class{
    func didTapActionButton(controller: ErrorViewController)
    func didTapCancelButton(controller: ErrorViewController)
}

class ErrorViewController: GenericViewController {
    
    @IBOutlet private weak var actionButton: UIButton!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    weak var delegate: ErrorViewControllerDelegate?
    var showCancelButton = true
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBarColor(UIColor.lightGray)
        if showCancelButton {
            addCancelButtonWithClosure {
                [weak self]  in
                guard let self = self else { return; }
                self.delegate?.didTapCancelButton(controller: self)
            }
        }
        setupTexts()
    }
    
    private func setupTexts() {
        title = "Something is wrong..."
        descriptionLabel.text = "Sorry... Do you want to try again?"
        actionButton.setTitle("Retry", for: .normal)
    }
    
    
    
    @IBAction private func actionButtonDidTapped() {
        delegate?.didTapActionButton(controller: self)
    }
}

extension ErrorViewController: ScreenProtocol {
    public typealias DelegateType = ErrorViewControllerDelegate
    public static func getViewController(_ delegate: DelegateType? = nil) -> ErrorViewController {
        let controller = UIStoryboard(name: "ErrorViewController", bundle: Bundle(for: ErrorViewController.self)).instantiateViewController(withIdentifier: "ErrorViewController") as! ErrorViewController
        controller.delegate = delegate
        return controller
    }
}

extension ErrorViewController {
    public static func getConectionErrorStyledController(delegate: ErrorViewControllerDelegate, addCancelButton: Bool = true) -> ErrorViewController {
        let controller = ErrorViewController.getViewController(delegate)
        controller.showCancelButton = addCancelButton
        return controller
    }
}
