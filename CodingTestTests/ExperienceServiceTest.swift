//
//  ExperienceServiceTest.swift
//  CodingTestTests
//
//  Created by Manuel Alejandro Soria Hidalgo on 5/10/19.
//  Copyright © 2019 Manuel Alejandro Soria Hidalgo. All rights reserved.
//

import XCTest
@testable import CodingTest

class ExperienceServiceTest: XCTestCase {
    
    private var experienceService: ExperienceService!

    override func setUp() {
        experienceService = ExperienceService()
    }

    override func tearDown() {
        experienceService = nil
    }

    func testExperienceRetrieved() {
        whenTheServiceTryToRetrieveExperience { [unowned self] listExperience, experienceExpectation in
            self.thenTheExperienceIsRetrieved(listExperience: listExperience, expectation: experienceExpectation)
        }
        thenTheServiceFinishedToTryToRetrieve()
    }
    
    func whenTheServiceTryToRetrieveExperience(callBack: @escaping ([Experience]?, XCTestExpectation) -> Void) {
        let experienceExpectation = expectation(description: "ExperienceExpectation")
        experienceService.getExperience { listExperience in
            callBack(listExperience, experienceExpectation)
        }
    }
    
    private func thenTheExperienceIsRetrieved(listExperience: [Experience]?, expectation: XCTestExpectation) {
        XCTAssertNotNil(listExperience)
        XCTAssertTrue(listExperience!.count > 0)
        expectation.fulfill()
    }
    
    private func thenTheServiceFinishedToTryToRetrieve() {
        waitForExpectations(timeout: 10) { error in
            if let error = error {
                XCTFail("List Experience finish() not called: \(error)")
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
