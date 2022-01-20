//
//  CountryCell.swift
//  RxSwiftMVVMCountries
//
//  Created by Ömer Faruk KISIK on 16.01.2022.
//

import UIKit
import RxCocoa
import RxSwift
import Kingfisher

class CountryCell: UICollectionViewCell {

    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func bindModel(country: Country){
        nameLabel.text = country.name.common
        flagImageView.kf.setImage(with: URL(string: country.flags.png))
    }

}
