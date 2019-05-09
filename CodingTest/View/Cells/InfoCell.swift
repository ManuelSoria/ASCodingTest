//
//  InfoCell.swift
//  CodingTest
//
//  Created by Manuel Alejandro Soria Hidalgo on 5/8/19.
//  Copyright © 2019 Manuel Alejandro Soria Hidalgo. All rights reserved.
//

import UIKit

struct InfoCellModel: CellProtocol {
    var title: String?
    var resume: String?
    
    func cellForTableView(_ tableView: UITableView, atIndexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: InfoCell.cellIdentifier, for: atIndexPath)
    }
    
    func drawCell(_ cell: UITableViewCell) {
        if let cell = cell as? InfoCellProtocol {
            cell.fill(title: title, resume: resume)
        }
    }
}

class InfoCell: UITableViewCell, InfoCellProtocol {
    
    static let cellIdentifier = "InfoCell"
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var resumeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func fill(title: String?, resume: String?) {
        titleLabel.text = title ?? "Title not Avaliable!"
        resumeLabel.text = resume ?? "Resume Avaliable!"
    }
    
}
