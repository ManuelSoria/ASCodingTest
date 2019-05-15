//
//  SectionServiceProtocol.swift
//  CodingTest
//
//  Created by Manuel Alejandro Soria Hidalgo on 5/10/19.
//  Copyright © 2019 Manuel Alejandro Soria Hidalgo. All rights reserved.
//

import Foundation

public protocol SectionServiceProtocol {
    func getSections(callBack: @escaping ([Section]?) -> Void)
}
