//
//  SummaryViewProtocol.swift
//  CodingTest
//
//  Created by Manuel Alejandro Soria Hidalgo on 5/10/19.
//  Copyright © 2019 Manuel Alejandro Soria Hidalgo. All rights reserved.
//

import Foundation

public protocol SummaryViewProtocol: class {
    func showLoading()
    func hideLoading()
    func show(title: String)
    func show(summary: Summary?)
    func showError()
}
