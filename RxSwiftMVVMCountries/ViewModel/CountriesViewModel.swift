//
//  ContinentCellViewModel.swift
//  RxSwiftMVVMCountries
//
//  Created by Ömer Faruk KISIK on 16.01.2022.
//

import Foundation
import RxSwift
import RxCocoa

class CountriesViewModel {
    
    var continent: Continent!
    var countries = PublishSubject<[Country]>()
    var bag = DisposeBag()
    
    init(continent: Continent) {
        self.continent = continent
    }
    
    func fetchCountries() -> Observable<[Country]> {
        return Repositories.getCountriesByContinent(continent: continent)
    }
}
