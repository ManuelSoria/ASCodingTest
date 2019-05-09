//
//  MockSummaryServiceWithResponse.swift
//  CodingTestTests
//
//  Created by Manuel Alejandro Soria Hidalgo on 5/10/19.
//  Copyright © 2019 Manuel Alejandro Soria Hidalgo. All rights reserved.
//

import Foundation
import CodingTest

class MockSummaryServiceWithResponse: SummaryServiceProtocol {
    private(set) var getHasBeenCalled: Bool = false
    
    func getSummary(callBack: @escaping (Summary?) -> Void) {
        getHasBeenCalled = true
        let summary = Summary(name: "Alex Soria", photo: "https://i.ibb.co/1XWd3f5/IMG-7117.jpg", summary: "I'm an iOS developer with 10 years of experience. I have worked in a lot of projects from entertainment to banking and I have almost 30 apps in the app store. I'm technology and dog lover.")
        callBack(summary)
    }
}

