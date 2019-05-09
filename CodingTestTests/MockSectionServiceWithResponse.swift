//
//  MockSectionServiceWithResponse.swift
//  CodingTestTests
//
//  Created by Manuel Alejandro Soria Hidalgo on 5/10/19.
//  Copyright © 2019 Manuel Alejandro Soria Hidalgo. All rights reserved.
//

import Foundation
import CodingTest

class MockSectionServiceWithResponse: SectionServiceProtocol {
    private(set) var getHasBeenCalled: Bool = false
    
    func getSections(callBack: @escaping ([Section]?) -> Void) {
        getHasBeenCalled = true
        let sections = [
            Section(name: "Experience"),
            Section(name: "Summary")
        ]
        callBack(sections)
    }
}

