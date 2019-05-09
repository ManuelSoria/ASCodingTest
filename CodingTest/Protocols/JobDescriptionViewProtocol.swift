//
//  JobDescriptionViewProtocol.swift
//  CodingTest
//
//  Created by Manuel Alejandro Soria Hidalgo on 5/10/19.
//  Copyright © 2019 Manuel Alejandro Soria Hidalgo. All rights reserved.
//

import Foundation

public protocol JobDescriptionViewProtocol: class {
    func show(title: String)
    func show(experience: Experience)
    func showError()
}
