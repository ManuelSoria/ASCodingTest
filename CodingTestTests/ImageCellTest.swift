//
//  ImageCellTest.swift
//  CodingTestTests
//
//  Created by Manuel Alejandro Soria Hidalgo on 5/9/19.
//  Copyright © 2019 Manuel Alejandro Soria Hidalgo. All rights reserved.
//

import XCTest

@testable import CodingTest

class ImageCellMock: UITableViewCell, ImageCellProtocol {
    
    fileprivate var urlImage: String?
    
    func fill(urlImage: String?) {
        self.urlImage = urlImage
    }
    
}

class ImageCellTest: XCTestCase {
    
    var imageCellModel : CellProtocol?
    
    override func setUp() {
        imageCellModel = ImageCellModel(urlImage: "https://i.ibb.co/mFJVPpz/icom.jpg")
    }
    
    func testDrawCell() {
        let imageCell = ImageCellMock()
        imageCellModel?.drawCell(imageCell)
        XCTAssertEqual(imageCell.urlImage, "https://i.ibb.co/mFJVPpz/icom.jpg")
    }
    
}
