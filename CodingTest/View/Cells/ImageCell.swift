//
//  ImageCell.swift
//  CodingTest
//
//  Created by Manuel Alejandro Soria Hidalgo on 5/8/19.
//  Copyright © 2019 Manuel Alejandro Soria Hidalgo. All rights reserved.
//

import UIKit
import Kingfisher

struct ImageCellModel: CellProtocol {
    var urlImage: String?
    
    func cellForTableView(_ tableView: UITableView, atIndexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: ImageCell.cellIdentifier, for: atIndexPath)
    }
    
    func drawCell(_ cell: UITableViewCell) {
        if let cell = cell as? ImageCellProtocol {
            cell.fill(urlImage: urlImage)
        }
    }
}

class ImageCell: UITableViewCell, ImageCellProtocol {
    
    static let cellIdentifier = "ImageCell"
    @IBOutlet private weak var logo: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func fill(urlImage: String?) {
        let url = URL(string: urlImage ?? "")
        logo.kf.setImage(
            with: url,
            placeholder: UIImage(named: "placeholder"),
            options: nil)
        { [weak self]
            result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(_):
                strongSelf.logo.contentMode = .scaleAspectFit
            case .failure(let error):
                print("Job failed: \(error.localizedDescription)")
            }
        }
    }
    
}
