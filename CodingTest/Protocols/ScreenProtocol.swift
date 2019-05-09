//
//  ScreenProtocol.swift
//  CodingTest
//
//  Created by Manuel Alejandro Soria Hidalgo on 5/8/19.
//  Copyright © 2019 Manuel Alejandro Soria Hidalgo. All rights reserved.
//

public protocol ScreenProtocol {
    associatedtype DelegateType
    associatedtype ControllerType = Self
    static func getViewController(_ delegate: DelegateType?) -> ControllerType
}
