//
//  ExperiencePresenter.swift
//  CodingTest
//
//  Created by Manuel Alejandro Soria Hidalgo on 5/8/19.
//  Copyright © 2019 Manuel Alejandro Soria Hidalgo. All rights reserved.
//

import Foundation

class ExperiencePresenter {
    private unowned let experienceView: ExperienceViewProtocol
    private let experienceService: ExperienceServiceProtocol
    private let section: Section?
    
    public init(experienceView: ExperienceViewProtocol, experienceService: ExperienceServiceProtocol, section: Section?){
        self.experienceView = experienceView
        self.experienceService = experienceService
        self.section = section
    }
    
    public func onStart() {
        experienceView.show(title: section?.name ?? "")
        experienceView.showLoading()
        experienceService.getExperience { [weak self] listExperience in
            guard let strongSelf = self else { return }
            strongSelf.tryToShow(listExperience: listExperience)
            strongSelf.experienceView.hideLoading()
        }
    }
    
    private func tryToShow(listExperience: [Experience]?) {
        if let listExperience = listExperience {
            experienceView.show(listExperience: listExperience)
        } else {
            experienceView.showError()
        }
    }
    
    public func onSelected(experience: Experience) {
        if experience.companyLogo != "" {
            experienceView.showDetailExperience(experience: experience)
        } else {
            experienceView.showError()
        }
    }
    
}
