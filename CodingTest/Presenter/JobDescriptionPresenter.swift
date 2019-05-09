//
//  JobDescriptionPresenter.swift
//  CodingTest
//
//  Created by Manuel Alejandro Soria Hidalgo on 5/10/19.
//  Copyright © 2019 Manuel Alejandro Soria Hidalgo. All rights reserved.
//

import Foundation

public class JobDescriptionPresenter {
    private unowned let descriptionView: JobDescriptionViewProtocol
    private let experience: Experience?
    
    public init(descriptionView: JobDescriptionViewProtocol, experience: Experience?){
        self.descriptionView = descriptionView
        self.experience = experience
    }
    
    public func onStart() {
        if let experience = experience {
            descriptionView.show(title: experience.companyName)
            descriptionView.show(experience: experience)
        } else {
            descriptionView.showError()
        }
        
    }
}
