//
//  ExperienceServiceProtocol.swift
//  CodingTest
//
//  Created by Manuel Alejandro Soria Hidalgo on 5/10/19.
//  Copyright © 2019 Manuel Alejandro Soria Hidalgo. All rights reserved.
//

import Foundation

protocol ExperienceServiceProtocol {
    func getExperience(callBack: @escaping ([Experience]?) -> Void)
}
