//
//  UIApplicationExtension.swift
//  CodingTest
//
//  Created by Manuel Alejandro Soria Hidalgo on 5/8/19.
//  Copyright © 2019 Manuel Alejandro Soria Hidalgo. All rights reserved.
//

import Foundation
import UIKit

public extension UIApplication {
    
    public static func enableInteraction() {
        if let window = shared.windows.first {
            window.isUserInteractionEnabled = true
        }
    }
    
    public static func disableInteraction() {
        if let window = shared.windows.first {
            window.isUserInteractionEnabled = false
        }
    }
}
