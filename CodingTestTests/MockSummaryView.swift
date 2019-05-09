//
//  MockSummarView.swift
//  CodingTestTests
//
//  Created by Manuel Alejandro Soria Hidalgo on 5/10/19.
//  Copyright © 2019 Manuel Alejandro Soria Hidalgo. All rights reserved.
//

import Foundation
import CodingTest

class MockSummaryView: SummaryViewProtocol {
    
    private(set) var showTitleHasBeenCalled: Bool = false
    private(set) var showLoadingHasBeenCalled: Bool = false
    private(set) var hideLoadingHasBeenCalled: Bool = false
    private(set) var showSummaryHasBeenCalled: Bool = false
    private(set) var showsErrorHasBeenCalled: Bool = false
    
    func showLoading() {
        showLoadingHasBeenCalled = true
    }
    
    func hideLoading() {
        hideLoadingHasBeenCalled = true
    }
    
    func show(title: String) {
        showTitleHasBeenCalled = true
    }
    
    func showError() {
        showsErrorHasBeenCalled = true
    }
    
    func show(summary: Summary?) {
        showSummaryHasBeenCalled = true
    }
    
}
