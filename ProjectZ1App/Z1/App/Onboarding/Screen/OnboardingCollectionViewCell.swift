//
//  OnboardingCollectionViewCell.swift
//  Z1 App IOS
//
//  Created by PHAT MENGHOR on 4/4/23.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    @IBOutlet var slideImageView: UIImageView!
    static let identifier = String(describing: OnboardingCollectionViewCell.self)

    func setImage(_ slide: OnboardingModel) {
        slideImageView.image = slide.image
    }
}
