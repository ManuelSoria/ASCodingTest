//
//  MainViewProtocol.swift
//  CodingTest
//
//  Created by Manuel Alejandro Soria Hidalgo on 5/10/19.
//  Copyright © 2019 Manuel Alejandro Soria Hidalgo. All rights reserved.
//

import Foundation

public protocol MainViewProtocol: class {
    func showLoading()
    func hideLoading()
    func show(title: String)
    func show(sections: [Section]?)
    func showError()
    func showSummary(section: Section)
    func showExperience(section: Section)
}
