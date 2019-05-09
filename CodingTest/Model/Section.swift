//
//  Section.swift
//  CodingTest
//
//  Created by Manuel Alejandro Soria Hidalgo on 5/10/19.
//  Copyright © 2019 Manuel Alejandro Soria Hidalgo. All rights reserved.
//

import Foundation

public struct Section: Codable {
    let name: String
    
    public init(name: String) {
        self.name = name
    }
}
