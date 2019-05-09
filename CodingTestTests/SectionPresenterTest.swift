//
//  SectionPresenterTest.swift
//  CodingTestTests
//
//  Created by Manuel Alejandro Soria Hidalgo on 5/10/19.
//  Copyright © 2019 Manuel Alejandro Soria Hidalgo. All rights reserved.
//

import XCTest
@testable import CodingTest

class SectionPresenterTest: XCTestCase {
    private var mockSectionServiceWithResponse: MockSectionServiceWithResponse!
    private var mockSectionServiceWithoutResponse: MockSectionServiceWithoutResponse!
    private var mockMainView: MockMainView!
    private var sectionPresenter: SectionPresenter!

    func testOnStartWithSections() {
        givenASectionServiceWithResponse()
        givenAMainView()
        givenASectionPresenterWith(sectionService: mockSectionServiceWithResponse)
        whenTheServicePresenterStarts()
        thenTheTitleIsDisplayed()
        thenTheMainViewShowsLoading()
        thenTryToRetrieveSections()
        thenTheMainViewHidesLoading()
        thenTheMainViewShowsTheSections()
    }
    
    func testOnStartWithoutSections() {
        givenASectionServiceWithoutResponse()
        givenAMainView()
        givenASectionPresenterWith(sectionService: mockSectionServiceWithoutResponse)
        whenTheServicePresenterStarts()
        thenTheTitleIsDisplayed()
        thenTheMainViewShowsLoading()
        thenTryToRetrieveSectionsFromEmptyRepository()
        thenTheMainViewHidesLoading()
        thenTheSectionViewShowsAnError()
    }
    
    func testOnMainWhenSummarySelected() {
        givenASectionServiceWithResponse()
        givenAMainView()
        givenASectionPresenterWith(sectionService: mockSectionServiceWithResponse)
        whenASectionWithNameSummaryIsSelected()
        thenTheSummaryIsShown()
    }
    
    func testOnMainWhenExperienceSelected() {
        givenASectionServiceWithResponse()
        givenAMainView()
        givenASectionPresenterWith(sectionService: mockSectionServiceWithResponse)
        whenASectionWithNameExperienceIsSelected()
        thenTheExperienceIsShown()
    }
    
    func testOnMainWithSelectionHasNotName() {
        givenASectionServiceWithResponse()
        givenAMainView()
        givenASectionPresenterWith(sectionService: mockSectionServiceWithResponse)
        whenASectionWithoutNameIsSelected()
        thenTheSectionViewShowsAnError()
    }
    
    private func givenASectionServiceWithResponse() {
        mockSectionServiceWithResponse = MockSectionServiceWithResponse()
    }
    
    private func givenASectionServiceWithoutResponse() {
        mockSectionServiceWithoutResponse = MockSectionServiceWithoutResponse()
    }
    
    private func givenAMainView() {
        mockMainView = MockMainView()
    }
    
    private func givenASectionPresenterWith(sectionService: SectionServiceProtocol) {
        sectionPresenter = SectionPresenter(mainView: mockMainView, sectionService: sectionService)
    }
    
    private func whenTheServicePresenterStarts() {
        sectionPresenter.onStart()
    }
    
    func whenASectionWithNameSummaryIsSelected() {
        sectionPresenter.onSelected(section: Section(name: "Summary"))
    }
    
    func whenASectionWithNameExperienceIsSelected() {
        sectionPresenter.onSelected(section: Section(name: "Experience"))
    }
    
    func whenASectionWithoutNameIsSelected() {
        sectionPresenter.onSelected(section: Section(name: ""))
    }
    
    private func thenTheTitleIsDisplayed() {
        XCTAssertTrue(mockMainView.showTitleHasBeenCalled)
    }
    
    private func thenTryToRetrieveSections() {
        XCTAssertTrue(mockSectionServiceWithResponse.getHasBeenCalled)
    }
    
    private func thenTheMainViewShowsLoading() {
        XCTAssertTrue(mockMainView.showLoadingHasBeenCalled)
    }
    
    private func thenTheMainViewHidesLoading() {
        XCTAssertTrue(mockMainView.hideLoadingHasBeenCalled)
    }
    
    private func thenTheMainViewShowsTheSections() {
        XCTAssertTrue(mockMainView.showSectionsHasBeenCalled)
    }
    
    private func thenTryToRetrieveSectionsFromEmptyRepository() {
        XCTAssertTrue(mockSectionServiceWithoutResponse.getHasBeenCalled)
    }
    
    private func thenTheSectionViewShowsAnError() {
        XCTAssertTrue(mockMainView.showsErrorHasBeenCalled)
    }
    
    private func thenTheSummaryIsShown() {
        XCTAssertTrue(mockMainView.showsSummaryHasBeenCalled)
    }
    
    private func thenTheExperienceIsShown() {
        XCTAssertTrue(mockMainView.showsExperienceHasBeenCalled)
    }

}
