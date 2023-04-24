//
//  MiniAppCollectionViewCell.swift
//  Z1 App IOS
//
//  Created by PHAT MENGHOR on 4/7/23.
//

import UIKit

class MiniAppCollectionViewCell: UICollectionViewCell {
    @IBOutlet var nameMiniAppLabel: UILabel!
    @IBOutlet var imageMiniApp: UIImageView!

    func setItemToMiniApp(item: MiniAppModel) {
        nameMiniAppLabel.text = item.title
        imageMiniApp.image = UIImage(named: item.image)
    }
}
