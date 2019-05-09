//
//  SectionPresenter.swift
//  CodingTest
//
//  Created by Manuel Alejandro Soria Hidalgo on 5/10/19.
//  Copyright © 2019 Manuel Alejandro Soria Hidalgo. All rights reserved.
//

import Foundation

public class SectionPresenter {
    private unowned let mainView: MainViewProtocol
    private let sectionService: SectionServiceProtocol
    
    public init(mainView: MainViewProtocol, sectionService: SectionServiceProtocol) {
        self.mainView = mainView
        self.sectionService = sectionService
    }
    
    public func onStart() {
        mainView.show(title: "Main Menu")
        mainView.showLoading()
        sectionService.getSections { [weak self] listSections in
            guard let strongSelf = self else { return }
            strongSelf.tryToShow(listSections: listSections)
            strongSelf.mainView.hideLoading()
        }
    }
    
    private func tryToShow(listSections: [Section]?) {
        if let listSections = listSections {
            mainView.show(sections: listSections)
        } else {
            mainView.showError()
        }
    }
    
    public func onSelected(section: Section) {
        if section.name != "" {
            if section.name == "Summary" {
                mainView.showSummary(section: section)
            } else if section.name == "Experience" {
                mainView.showExperience(section: section)
            } else {
                mainView.showError()
            }
        } else {
            mainView.showError()
        }
    }
    
}
