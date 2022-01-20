//
//  CountriesViewController.swift
//  RxSwiftMVVMCountries
//
//  Created by Ömer Faruk KISIK on 16.01.2022.
//

import UIKit
import RxSwift
import RxCocoa

class CountriesViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var viewModel: CountriesViewModel!
    var bag = DisposeBag()
    
    init(viewModel: CountriesViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
       fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "CountryCell", bundle: nil),
                                forCellWithReuseIdentifier: "CountryCell")
        collectionView.rx.setDelegate(self).disposed(by:bag)
        bindCollectionData()
    }
    
    
    func bindCollectionData(){
        
        viewModel.countries.observe(on: MainScheduler.init()).bind(
            to: collectionView.rx.items(
                cellIdentifier: "CountryCell",
                cellType: CountryCell.self)){ row, item, cell in
            cell.bindModel(country: item)
        }.disposed(by: bag)
        
        viewModel.fetchCountries().subscribe(
            onNext: { [weak self] response in
                self?.viewModel.countries.onNext(response)
            },
            onError: { error in
                print("Error -> \(error)")
            }
        ).disposed(by: bag)
    }


}

extension CountriesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width / 2 - 20,
                      height: self.view.frame.width / 2 - 20)
    }
}
