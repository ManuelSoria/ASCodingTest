//
//  InfoCellTest.swift
//  CodingTestTests
//
//  Created by Manuel Alejandro Soria Hidalgo on 5/9/19.
//  Copyright © 2019 Manuel Alejandro Soria Hidalgo. All rights reserved.
//

import XCTest
@testable import CodingTest

class InfoCellMock: UITableViewCell, InfoCellProtocol {
    
    fileprivate var title: String?
    fileprivate var resume: String?

    func fill(title: String?, resume: String?) {
        self.title = title
        self.resume = resume
    }
    
}

class InfoCellTest: XCTestCase {

    var infoCellModel : CellProtocol?
    
    override func setUp() {
        infoCellModel = InfoCellModel(title: "Role Name", resume: "Tech Leader Mobile")
    }
    
    func testDrawCell() {
        let infoCell = InfoCellMock()
        infoCellModel?.drawCell(infoCell)
        XCTAssertEqual(infoCell.title, "Role Name")
        XCTAssertEqual(infoCell.resume, "Tech Leader Mobile")
    }

}
