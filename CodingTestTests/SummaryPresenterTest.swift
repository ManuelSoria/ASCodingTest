//
//  SummaryPresenterTest.swift
//  CodingTestTests
//
//  Created by Manuel Alejandro Soria Hidalgo on 5/10/19.
//  Copyright © 2019 Manuel Alejandro Soria Hidalgo. All rights reserved.
//

import XCTest
@testable import CodingTest

class SummaryPresenterTest: XCTestCase {
    private var mockSummaryServiceWithResponse: MockSummaryServiceWithResponse!
    private var mockSummaryServiceWithoutResponse: MockSummaryServiceWithoutResponse!
    private var mockSummaryView: MockSummaryView!
    private var summaryPresenter: SummaryPresenter!

    func testOnStartWithSummary() {
        givenASummaryServiceWithResponse()
        givenASummaryView()
        givenASummaryPresenterWith(summaryService: mockSummaryServiceWithResponse)
        whenTheServicePresenterStarts()
        thenTheTitleIsDisplayed()
        thenTheSummaryViewShowsLoading()
        thenTryToRetrieveSummary()
        thenTheSummaryViewHidesLoading()
        thenTheSummaryViewShowsTheSummary()
    }
    
    func testOnStartWithoutSummary() {
        givenASummaryServiceWithoutResponse()
        givenASummaryView()
        givenASummaryPresenterWith(summaryService: mockSummaryServiceWithoutResponse)
        whenTheServicePresenterStarts()
        thenTheTitleIsDisplayed()
        thenTheSummaryViewShowsLoading()
        thenTryToRetrieveSummaryFromEmptyRepository()
        thenTheSummaryViewHidesLoading()
        thenTheSummaryViewShowsAnError()
    }
    
    private func givenASummaryServiceWithResponse() {
        mockSummaryServiceWithResponse = MockSummaryServiceWithResponse()
    }
    
    private func givenASummaryServiceWithoutResponse() {
        mockSummaryServiceWithoutResponse = MockSummaryServiceWithoutResponse()
    }
    
    private func givenASummaryView() {
        mockSummaryView = MockSummaryView()
    }
    
    private func givenASummaryPresenterWith(summaryService: SummaryServiceProtocol) {
        summaryPresenter = SummaryPresenter(summaryView: mockSummaryView, summaryService: summaryService, section: Section(name: "Summary"))
    }
    
    private func whenTheServicePresenterStarts() {
        summaryPresenter.onStart()
    }
    
    private func thenTheTitleIsDisplayed() {
        XCTAssertTrue(mockSummaryView.showTitleHasBeenCalled)
    }
    
    private func thenTryToRetrieveSummary() {
        XCTAssertTrue(mockSummaryServiceWithResponse.getHasBeenCalled)
    }
    
    private func thenTheSummaryViewShowsLoading() {
        XCTAssertTrue(mockSummaryView.showLoadingHasBeenCalled)
    }
    
    private func thenTheSummaryViewHidesLoading() {
        XCTAssertTrue(mockSummaryView.hideLoadingHasBeenCalled)
    }
    
    private func thenTheSummaryViewShowsTheSummary() {
        XCTAssertTrue(mockSummaryView.showSummaryHasBeenCalled)
    }
    
    private func thenTryToRetrieveSummaryFromEmptyRepository() {
        XCTAssertTrue(mockSummaryServiceWithoutResponse.getHasBeenCalled)
    }
    
    private func thenTheSummaryViewShowsAnError() {
        XCTAssertTrue(mockSummaryView.showsErrorHasBeenCalled)
    }
    
}
