//
//  SummaryServiceTest.swift
//  CodingTestTests
//
//  Created by Manuel Alejandro Soria Hidalgo on 5/9/19.
//  Copyright © 2019 Manuel Alejandro Soria Hidalgo. All rights reserved.
//

import XCTest
@testable import CodingTest

class SummaryServiceTest: XCTestCase {

    private var summaryService: SummaryService!
    
    override func setUp() {
        summaryService = SummaryService()
    }

    override func tearDown() {
        summaryService = nil
    }

    func testSummaryRetrieved() {
        whenTheServiceTryToRetrieveSummary { [unowned self] summary, summaryExpectation in
            self.thenTheSummaryIsRetrieved(summary: summary, expectation: summaryExpectation)
        }
        thenTheServiceFinishedToTryToRetrieve()
    }
    
    func whenTheServiceTryToRetrieveSummary(callBack: @escaping (Summary?, XCTestExpectation) -> Void) {
        let summaryExpectation = expectation(description: "SummaryExpectation")
        summaryService.getSummary { summary in
            callBack(summary, summaryExpectation)
        }
    }
    
    private func thenTheSummaryIsRetrieved(summary: Summary?, expectation: XCTestExpectation) {
        XCTAssertNotNil(summary)
        expectation.fulfill()
    }
    
    private func thenTheServiceFinishedToTryToRetrieve() {
        waitForExpectations(timeout: 10) { error in
            if let error = error {
                XCTFail("Summary finish() not called: \(error)")
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
