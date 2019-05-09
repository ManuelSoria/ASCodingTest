//
//  MockSummaryServiceWithoutResponse.swift
//  CodingTestTests
//
//  Created by Manuel Alejandro Soria Hidalgo on 5/10/19.
//  Copyright © 2019 Manuel Alejandro Soria Hidalgo. All rights reserved.
//

import Foundation
import CodingTest

class MockSummaryServiceWithoutResponse: SummaryServiceProtocol {
    private(set) var getHasBeenCalled: Bool = false
    
    func getSummary(callBack: @escaping (Summary?) -> Void) {
        getHasBeenCalled = true
        callBack(nil)
    }
}
