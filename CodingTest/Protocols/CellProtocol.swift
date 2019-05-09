//
//  CellProtocol.swift
//  CodingTest
//
//  Created by Manuel Alejandro Soria Hidalgo on 5/8/19.
//  Copyright © 2019 Manuel Alejandro Soria Hidalgo. All rights reserved.
//

import UIKit

public protocol CellProtocol {
    func cellForTableView(_ tableView: UITableView, atIndexPath: IndexPath) -> UITableViewCell
    func drawCell(_ cell: UITableViewCell) //optional
}

protocol CustomLabelCellProtocol {
    func fill(companyName: String?)
}

protocol InfoCellProtocol {
    func fill(title: String?, resume: String?)
}

protocol ImageCellProtocol {
    func fill(urlImage: String?)
}
