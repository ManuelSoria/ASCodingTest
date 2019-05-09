//
//  SectionServiceTest.swift
//  CodingTestTests
//
//  Created by Manuel Alejandro Soria Hidalgo on 5/10/19.
//  Copyright © 2019 Manuel Alejandro Soria Hidalgo. All rights reserved.
//

import XCTest
@testable import CodingTest

class SectionServiceTest: XCTestCase {
    
    private var sectionService: SectionService!
    
    override func setUp() {
        sectionService = SectionService()
    }
    
    override func tearDown() {
        sectionService = nil
    }
    
    func testExperienceRetrieved() {
        whenTheServiceTryToRetrieveSections { [unowned self] listSections, sectionExpectation in
            self.thenTheSectionsIsRetrieved(listSections: listSections, expectation: sectionExpectation)
        }
        thenTheServiceFinishedToTryToRetrieve()
    }
    
    func whenTheServiceTryToRetrieveSections(callBack: @escaping ([Section]?, XCTestExpectation) -> Void) {
        let sectionExpectation = expectation(description: "SectionExpectation")
        sectionService.getSections { listSections in
            callBack(listSections, sectionExpectation)
        }
    }
    
    private func thenTheSectionsIsRetrieved(listSections: [Section]?, expectation: XCTestExpectation) {
        XCTAssertNotNil(listSections)
        XCTAssertTrue(listSections!.count > 0)
        expectation.fulfill()
    }
    
    private func thenTheServiceFinishedToTryToRetrieve() {
        waitForExpectations(timeout: 10) { error in
            if let error = error {
                XCTFail("Sections finish() not called: \(error)")
            }
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
