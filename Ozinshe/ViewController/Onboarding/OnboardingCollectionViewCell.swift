//
//  OnboardingCollectionViewCell.swift
//  Ozinshe
//
//  Created by Nazerke Sembay on 09.06.2023.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var slideImageView: UIImageView!
    
    
    func setup(_ slide: Slide){
        descriptionLabel.text = slide.description
        titleLabel.text = slide.title
        slideImageView.image = UIImage(named: slide.slideImage)
    }
}
