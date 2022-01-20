//
//  ContinentsViewModel.swift
//  RxSwiftMVVMCountries
//
//  Created by Ömer Faruk KISIK on 16.01.2022.
//

import Foundation
import RxSwift
import RxCocoa

struct ContinentsViewModel {
    
    var continents = PublishSubject<[Continent]>()
    
    func setItems(){
        continents.onNext([Continent.Africa,
                           Continent.Americas,
                           Continent.Asia,
                           Continent.Europe,
                           Continent.Oceania])
        continents.onCompleted()
    }
    
    
}
