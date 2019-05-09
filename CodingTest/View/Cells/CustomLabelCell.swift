//
//  CustomLabelCell.swift
//  CodingTest
//
//  Created by Manuel Alejandro Soria Hidalgo on 5/8/19.
//  Copyright © 2019 Manuel Alejandro Soria Hidalgo. All rights reserved.
//

import UIKit

struct CustomLabelCellModel: CellProtocol {
    var companyName: String?
    
    func cellForTableView(_ tableView: UITableView, atIndexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: CustomLabelCell.cellIdentifier, for: atIndexPath)
    }
    
    func drawCell(_ cell: UITableViewCell) {
        if let cell = cell as? CustomLabelCellProtocol {
            cell.fill(companyName: companyName)
        }
    }
}

class CustomLabelCell: UITableViewCell, CustomLabelCellProtocol{
    
    static let cellIdentifier = "CustomLabelCell"
    @IBOutlet private weak var companyNameLabel: UILabel!
    @IBOutlet private weak var background: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func fill(companyName: String?) {
        companyNameLabel.text = companyName ?? "Company Name not Avaliable!"
    }

}
