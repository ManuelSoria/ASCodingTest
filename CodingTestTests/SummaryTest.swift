//
//  SummaryTest.swift
//  CodingTestTests
//
//  Created by Manuel Alejandro Soria Hidalgo on 5/9/19.
//  Copyright © 2019 Manuel Alejandro Soria Hidalgo. All rights reserved.
//

import XCTest
@testable import CodingTest

class SummaryTest: XCTestCase {

    func testSummaryCodeable() {
        let testJson = "{\"name\": \"Alex Soria\", \"photo\": \"https://i.ibb.co/1XWd3f5/IMG-7117.jpg\", \"summary\": \"I'm an iOS developer with 10 years of experience. I have worked in a lot of projects from entertainment to banking and I have almost 30 apps in the app store. I'm technology and dog lover.\"}"
        let jsonDecoder = JSONDecoder()
        guard let jsonData = testJson.data(using: .utf8), let summary = try? jsonDecoder.decode(Summary.self, from: jsonData) else {
            XCTFail()
            return
        }
        XCTAssertEqual(summary.name, "Alex Soria")
        XCTAssertEqual(summary.photo, "https://i.ibb.co/1XWd3f5/IMG-7117.jpg")
        XCTAssertEqual(summary.summary, "I'm an iOS developer with 10 years of experience. I have worked in a lot of projects from entertainment to banking and I have almost 30 apps in the app store. I'm technology and dog lover.")
    }

}
