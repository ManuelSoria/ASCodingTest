//
//  MockSectionServiceWithoutResponse.swift
//  CodingTestTests
//
//  Created by Manuel Alejandro Soria Hidalgo on 5/10/19.
//  Copyright © 2019 Manuel Alejandro Soria Hidalgo. All rights reserved.
//

import Foundation
import CodingTest

class MockSectionServiceWithoutResponse: SectionServiceProtocol {
    private(set) var getHasBeenCalled: Bool = false
    
    func getSections(callBack: @escaping ([Section]?) -> Void) {
        getHasBeenCalled = true
        callBack(nil)
    }
}
