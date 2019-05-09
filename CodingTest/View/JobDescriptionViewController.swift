//
//  JobDescriptionViewController.swift
//  CodingTest
//
//  Created by Manuel Alejandro Soria Hidalgo on 5/8/19.
//  Copyright © 2019 Manuel Alejandro Soria Hidalgo. All rights reserved.
//

import UIKit

class JobDescriptionViewController: GenericViewController, JobDescriptionViewProtocol {
    
    @IBOutlet private weak var descriptionTableView: UITableView!
    private let estimatedRowHeight: CGFloat = 100.0
    var experience: Experience!
    fileprivate var cells = [CellProtocol]()
    private var jobDescriptionPresenter: JobDescriptionPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeDependencies()
        self.jobDescriptionPresenter.onStart()
    }
    
    func initializeDependencies() {
        self.setupTableView()
        self.setupNavigationBarColor(UIColor.lightGray)
        cells = [CellProtocol]()
        jobDescriptionPresenter = JobDescriptionPresenter(descriptionView: self, experience: experience)
    }
    
    private func setupTableView() {
        descriptionTableView.rowHeight = UITableView.automaticDimension
        descriptionTableView.estimatedRowHeight = estimatedRowHeight
        descriptionTableView.register(cells: [ImageCell.self, InfoCell.self])
    }
    
    private func setupCells() {
        var cells = [CellProtocol]()
        cells.append(ImageCellModel(urlImage: experience.companyLogo))
        cells.append(InfoCellModel(title: "Role Name:", resume: experience.roleName))
        cells.append(InfoCellModel(title: "Main Responsabilities:", resume: experience.mainResposability))
        cells.append(InfoCellModel(title: "Achievements:", resume: experience.achievements))
        self.cells = cells
    }
    
    func show(title: String) {
        self.title = title
    }
    
    func show(experience: Experience) {
        self.experience = experience
        self.setupCells()
        self.descriptionTableView.reloadData()
    }
    
    func showError() {
        let controller = ErrorViewController.getConectionErrorStyledController(delegate:self, addCancelButton: false)
        present(controller.embedInNavigationController(), animated: true, completion: nil)
    }

}

extension JobDescriptionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = cells[indexPath.row]
        let cell = model.cellForTableView(tableView, atIndexPath: indexPath)
        model.drawCell(cell)
        return cell
    }
}

extension JobDescriptionViewController: ScreenProtocol {
    public typealias DelegateType = JobDescriptionViewController
    public static func getViewController(_ delegate: DelegateType? = nil) -> JobDescriptionViewController {
        let controller = UIStoryboard(name: "JobDescriptionViewController", bundle: Bundle(for: JobDescriptionViewController.self)).instantiateViewController(withIdentifier: "JobDescriptionViewController") as! JobDescriptionViewController
        return controller
    }
}

extension JobDescriptionViewController: ErrorViewControllerDelegate {
    func didTapActionButton(controller: ErrorViewController) {
        dismiss(animated: true) {
            [weak self] in
            guard let strongSelf = self else {return}
            strongSelf.navigationController?.popViewController(animated: true)
        }
    }
    
    func didTapCancelButton(controller: ErrorViewController) {
        dismiss(animated: true) {
            [weak self] in
            guard let strongSelf = self else {return}
            strongSelf.navigationController?.popViewController(animated: true)
        }
    }
    
    
}
