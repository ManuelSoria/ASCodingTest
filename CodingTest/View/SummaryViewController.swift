//
//  SummaryViewController.swift
//  CodingTest
//
//  Created by Manuel Alejandro Soria Hidalgo on 5/9/19.
//  Copyright © 2019 Manuel Alejandro Soria Hidalgo. All rights reserved.
//

import UIKit

class SummaryViewController: GenericViewController, SummaryViewProtocol{
    
    @IBOutlet private weak var summaryListTable: UITableView!
    private let estimatedRowHeight: CGFloat = 100.0
    fileprivate var summary: Summary!
    fileprivate var cells: [CellProtocol]!
    var section: Section!
    private var summaryService: SummaryService!
    private var summaryPresenter: SummaryPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeDependencies()
        self.summaryPresenter.onStart()
    }
    
    func initializeDependencies() {
        self.setupTableView()
        self.setupNavigationBarColor(UIColor.lightGray)
        cells = [CellProtocol]()
        summaryService = SummaryService()
        summaryPresenter = SummaryPresenter(summaryView: self, summaryService: summaryService, section: section)
    }
    
    private func setupTableView() {
        summaryListTable.rowHeight = UITableView.automaticDimension
        summaryListTable.estimatedRowHeight = estimatedRowHeight
        summaryListTable.register(cells: [ImageCell.self, InfoCell.self])
    }
    
    fileprivate func reloadData() {
        setupCells()
        summaryListTable.reloadData()
    }
    
    private func setupCells() {
        var cells = [CellProtocol]()
        cells.append(ImageCellModel(urlImage: summary.photo))
        cells.append(InfoCellModel(title: "Name:", resume: summary.name))
        cells.append(InfoCellModel(title: "Summary:", resume: summary.summary))
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
    
    func show(summary: Summary?) {
        self.summary = summary
        self.setupCells()
        self.summaryListTable.reloadData()
    }
    
    func showError() {
        let controller = ErrorViewController.getConectionErrorStyledController(delegate:self, addCancelButton: false)
        present(controller.embedInNavigationController(), animated: true, completion: nil)
    }
    
}

extension SummaryViewController: UITableViewDataSource {
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

extension SummaryViewController: ErrorViewControllerDelegate {
    func didTapActionButton(controller: ErrorViewController) {
        dismiss(animated: true) {
            [weak self] in
            guard let strongSelf = self else {return}
            strongSelf.summaryPresenter.onStart()
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

extension SummaryViewController: ScreenProtocol {
    public typealias DelegateType = SummaryViewController
    public static func getViewController(_ delegate: DelegateType? = nil) -> SummaryViewController {
        let controller = UIStoryboard(name: "SummaryViewController", bundle: Bundle(for: SummaryViewController.self)).instantiateViewController(withIdentifier: "SummaryViewController") as! SummaryViewController
        return controller
    }
}
