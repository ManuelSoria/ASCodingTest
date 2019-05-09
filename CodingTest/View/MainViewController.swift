//
//  MainViewController.swift
//  CodingTest
//
//  Created by Manuel Alejandro Soria Hidalgo on 5/8/19.
//  Copyright © 2019 Manuel Alejandro Soria Hidalgo. All rights reserved.
//

import UIKit

class MainViewController: GenericViewController, MainViewProtocol{
    
    @IBOutlet private weak var mainListTable: UITableView!
    private let estimatedRowHeight: CGFloat = 100.0
    fileprivate var cells: [CellProtocol]!
    private var listSections: [Section]!
    private var sectionService: SectionService!
    private var sectionPresenter: SectionPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeDependencies()
        self.sectionPresenter.onStart()
    }
    
    func initializeDependencies() {
        self.setupTableView()
        self.setupNavigationBarColor(UIColor.lightGray)
        cells = [CellProtocol]()
        sectionService = SectionService()
        sectionPresenter = SectionPresenter(mainView: self, sectionService: sectionService)
    }
    
    private func setupTableView() {
        mainListTable.rowHeight = UITableView.automaticDimension
        mainListTable.estimatedRowHeight = estimatedRowHeight
        mainListTable.register(cells: [CustomLabelCell.self])
    }
    
    private func setupCells() {
        var cells = [CellProtocol]()
        for section in listSections {
            cells.append(CustomLabelCellModel(companyName: section.name))
        }
        self.cells = cells
    }
    
    func showLoading() {
        self.showLoader()
    }
    
    func hideLoading() {
        self.hideLoader()
    }
    
    func show(title: String) {
        self.title = title
    }
    
    func show(sections: [Section]?) {
        self.listSections = sections
        self.setupCells()
        self.mainListTable.reloadData()
    }
    
    func showError() {
        let controller = ErrorViewController.getConectionErrorStyledController(delegate:self, addCancelButton: false)
        present(controller.embedInNavigationController(), animated: true, completion: nil)
    }
    
    func showSummary(section: Section) {
        let controller = SummaryViewController.getViewController()
        controller.section = section
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func showExperience(section: Section) {
        let controller = ListExperienceViewController.getViewController()
        controller.section = section
        navigationController?.pushViewController(controller, animated: true)
    }
}

extension MainViewController: UITableViewDataSource {
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

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        sectionPresenter.onSelected(section: listSections[indexPath.row])
    }
}

extension MainViewController: ErrorViewControllerDelegate {
    func didTapActionButton(controller: ErrorViewController) {
        dismiss(animated: true) {
            [weak self] in
            guard let strongSelf = self else {return}
            strongSelf.sectionPresenter.onStart()
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
