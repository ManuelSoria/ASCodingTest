//
//  Summary.swift
//  CodingTest
//
//  Created by Manuel Alejandro Soria Hidalgo on 5/8/19.
//  Copyright © 2019 Manuel Alejandro Soria Hidalgo. All rights reserved.
//

import Foundation

public struct Summary: Codable {
    let name : String
    let photo : String
    let summary: String
    
    public init(name: String, photo: String, summary: String) {
        self.name = name
        self.photo = photo
        self.summary = summary
    }
}
