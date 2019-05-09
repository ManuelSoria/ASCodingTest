//
//  CustomLabelCellTest.swift
//  CodingTestTests
//
//  Created by Manuel Alejandro Soria Hidalgo on 5/9/19.
//  Copyright © 2019 Manuel Alejandro Soria Hidalgo. All rights reserved.
//

import XCTest
@testable import CodingTest

class CustomLabelCellMock: UITableViewCell, CustomLabelCellProtocol {
    fileprivate var companyName: String?
    
    func fill(companyName: String?) {
        self.companyName = companyName
    }
}

class CustomLabelCellTest: XCTestCase {
    var customLabelCellModel : CellProtocol?
    
    override func setUp() {
        customLabelCellModel = CustomLabelCellModel(companyName: "Globant")
    }

    func testDrawCell() {
        let customLabelCell = CustomLabelCellMock()
        customLabelCellModel?.drawCell(customLabelCell)
        XCTAssertEqual(customLabelCell.companyName, "Globant")
    }

}
