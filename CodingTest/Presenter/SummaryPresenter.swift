//
//  SummaryPresenter.swift
//  CodingTest
//
//  Created by Manuel Alejandro Soria Hidalgo on 5/8/19.
//  Copyright © 2019 Manuel Alejandro Soria Hidalgo. All rights reserved.
//

import Foundation

public class SummaryPresenter {
    private unowned let summaryView: SummaryViewProtocol
    private let summaryService: SummaryServiceProtocol
    private let section: Section?
    
    public init(summaryView: SummaryViewProtocol, summaryService: SummaryServiceProtocol, section: Section?){
        self.summaryView = summaryView
        self.summaryService = summaryService
        self.section = section
    }
    
    public func onStart() {
        summaryView.show(title: section?.name ?? "")
        summaryView.showLoading()
        summaryService.getSummary { [weak self] summary in
            guard let strongSelf = self else { return }
            strongSelf.tryToShow(summary: summary)
            strongSelf.summaryView.hideLoading()
        }
    }
    
    private func tryToShow(summary: Summary?) {
        if let summary = summary {
            summaryView.show(summary: summary)
        } else {
            summaryView.showError()
        }
    }
    
}
