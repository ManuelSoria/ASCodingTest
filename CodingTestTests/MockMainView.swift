//
//  MockMainView.swift
//  CodingTestTests
//
//  Created by Manuel Alejandro Soria Hidalgo on 5/10/19.
//  Copyright © 2019 Manuel Alejandro Soria Hidalgo. All rights reserved.
//

import Foundation
import CodingTest

class MockMainView: MainViewProtocol {
    private(set) var showTitleHasBeenCalled: Bool = false
    private(set) var showLoadingHasBeenCalled: Bool = false
    private(set) var hideLoadingHasBeenCalled: Bool = false
    private(set) var showSectionsHasBeenCalled: Bool = false
    private(set) var showsErrorHasBeenCalled: Bool = false
    private(set) var showsSummaryHasBeenCalled: Bool = false
    private(set) var showsExperienceHasBeenCalled: Bool = false
    
    func showLoading() {
        showLoadingHasBeenCalled = true
    }
    
    func hideLoading() {
        hideLoadingHasBeenCalled = true
    }
    
    func show(title: String) {
        showTitleHasBeenCalled = true
    }
    
    func show(sections: [Section]?) {
        showSectionsHasBeenCalled = true
    }
    
    func showError() {
        showsErrorHasBeenCalled = true
    }
    
    func showSummary(section: Section) {
        showsSummaryHasBeenCalled = true
    }
    
    func showExperience(section: Section) {
        showsExperienceHasBeenCalled = true
    }
    
    
}
