//
//  ExperienceTest.swift
//  CodingTestTests
//
//  Created by Manuel Alejandro Soria Hidalgo on 5/9/19.
//  Copyright © 2019 Manuel Alejandro Soria Hidalgo. All rights reserved.
//

import XCTest
@testable import CodingTest

class ExperienceTest: XCTestCase {

    func testExperienceCodable() {
        let testJson = "{\"companyName\" : \"Icom Systems\", \"roleName\" : \"Tech Leader Mobile\", \"mainResposability\": \"Manage mobile teams\", \"achievements\" : \"Upload 26 apps to the App Store\", \"companyLogo\" : \"https://i.ibb.co/mFJVPpz/icom.jpg\" }"
        let jsonDecoder = JSONDecoder()
        guard let jsonData = testJson.data(using: .utf8), let summary = try? jsonDecoder.decode(Experience.self, from: jsonData) else {
            XCTFail()
            return
        }
        XCTAssertEqual(summary.companyName, "Icom Systems")
        XCTAssertEqual(summary.roleName, "Tech Leader Mobile")
        XCTAssertEqual(summary.mainResposability, "Manage mobile teams")
        XCTAssertEqual(summary.achievements, "Upload 26 apps to the App Store")
        XCTAssertEqual(summary.companyLogo, "https://i.ibb.co/mFJVPpz/icom.jpg")
    }
}
