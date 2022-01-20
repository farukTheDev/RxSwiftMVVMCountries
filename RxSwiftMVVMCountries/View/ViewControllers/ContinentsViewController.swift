//
//  ContinentsViewController.swift
//  RxSwiftMVVMCountries
//
//  Created by Ömer Faruk KISIK on 16.01.2022.
//

import UIKit
import RxSwift
import RxCocoa

class ContinentsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = ContinentsViewModel()
    let bag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        bindTableData()
    }
    
    func bindTableData() {
        viewModel.continents.bind(
            to: tableView.rx.items(
                cellIdentifier: "cell",
                cellType: UITableViewCell.self)) { row, item, cell in
            cell.textLabel?.text = item.rawValue
        }.disposed(by: bag)
        
        tableView.rx.modelSelected(Continent.self).bind { item in
            let countriesViewModel = CountriesViewModel.init(continent: item)
            self.navigationController?.pushViewController(
                CountriesViewController.init(
                    viewModel: countriesViewModel
               ), animated: true)
        }.disposed(by: bag)
        
        viewModel.setItems()
    }

}

