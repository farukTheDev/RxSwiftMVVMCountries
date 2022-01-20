//
//  Repositories.swift
//  RxSwiftMVVMCountries
//
//  Created by Ömer Faruk KISIK on 16.01.2022.
//

import Alamofire
import RxSwift

class Repositories {
    
    static func getCountriesByContinent(continent: Continent) -> Observable<[Country]>{
    
        return Observable.create{ observer -> Disposable in
            AF.request("https://restcountries.com/v3.1/region/\(continent.rawValue)",
                       method: .get,
                       headers: NetworkUtils.headers
            ).responseJSON { response in
                debugPrint(response)
                switch response.result {
                case .success(_):
                    do {
                        let result = try JSONDecoder().decode([Country].self,
                                                           from: response.data!)
                        observer.onNext(result)
                    } catch let error {
                        observer.onError(error)
                        print(error)
                    }
                case .failure(let error):
                    print("Request Error -> \(error)")
                    observer.onError(error)
                }
            }
            return Disposables.create()
        }
    }
}
