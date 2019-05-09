//
//  ViewController.swift
//  CodingTest
//
//  Created by Manuel Alejandro Soria Hidalgo on 5/8/19.
//  Copyright © 2019 Manuel Alejandro Soria Hidalgo. All rights reserved.
//

import UIKit

class ListExperienceViewController: GenericViewController, ExperienceViewProtocol {
    
    @IBOutlet private weak var experienceListTable: UITableView!
    private let estimatedRowHeight: CGFloat = 100.0
    fileprivate var listExperience: [Experience]!
    fileprivate var cells: [CellProtocol]!
    var section: Section!
    private var experienceService: ExperienceService!
    private var experiencePresenter: ExperiencePresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeDependencies()
        self.experiencePresenter.onStart()
    }
    
    func initializeDependencies() {
        self.setupTableView()
        self.setupNavigationBarColor(UIColor.lightGray)
        cells = [CellProtocol]()
        experienceService = ExperienceService()
        experiencePresenter = ExperiencePresenter(experienceView: self, experienceService: experienceService, section: section)
    }
    
    private func setupTableView() {
        experienceListTable.rowHeight = UITableView.automaticDimension
        experienceListTable.estimatedRowHeight = estimatedRowHeight
        experienceListTable.register(cells: [CustomLabelCell.self])
    }
    
    private func setupCells() {
        var cells = [CellProtocol]()
        for experience in listExperience {
            cells.append(CustomLabelCellModel(companyName: experience.companyName))
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
    
    func show(listExperience: [Experience]?) {
        self.listExperience = listExperience
        self.setupCells()
        self.experienceListTable.reloadData()
    }
    
    func showError() {
        let controller = ErrorViewController.getConectionErrorStyledController(delegate:self, addCancelButton: false)
        present(controller.embedInNavigationController(), animated: true, completion: nil)
    }
    
    func showDetailExperience(experience: Experience) {
        let controller = JobDescriptionViewController.getViewController()
        controller.experience = experience
        navigationController?.pushViewController(controller, animated: true)
    }
}

extension ListExperienceViewController: UITableViewDataSource {
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

extension ListExperienceViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        experiencePresenter.onSelected(experience: listExperience[indexPath.row])
    }
}

extension ListExperienceViewController: ErrorViewControllerDelegate {
    func didTapActionButton(controller: ErrorViewController) {
        dismiss(animated: true) {
            [weak self] in
            guard let strongSelf = self else {return}
            strongSelf.experiencePresenter.onStart()
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

extension ListExperienceViewController: ScreenProtocol {
    public typealias DelegateType = ListExperienceViewController
    public static func getViewController(_ delegate: DelegateType? = nil) -> ListExperienceViewController {
        let controller = UIStoryboard(name: "ListExperienceViewController", bundle: Bundle(for: ListExperienceViewController.self)).instantiateViewController(withIdentifier: "ListExperienceViewController") as! ListExperienceViewController
        return controller
    }
}

