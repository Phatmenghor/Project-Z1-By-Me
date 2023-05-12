//
//  ZpoinTableViewCell.swift
//  ProjectZ1App
//
//  Created by PHAT MENGHOR on 5/3/23.
//

import UIKit

class ZpoinTableViewCell: UITableViewCell {
    
    @IBOutlet var shadowUiView: UIView!
    @IBOutlet var uiViewColorCard: UIView!
    @IBOutlet var viewCard: UIView!
    @IBOutlet var nameAccountBalance: UILabel!
    static  let identifier = "ZpoinTableViewCell"
    @IBOutlet var numberAccountBalance: UILabel!
    @IBOutlet var imageAccountBalance: UIImageView!
    @IBOutlet var moneyAccountBalance: UILabel!
    @IBOutlet var iconSelect: UIImageView!
    @IBOutlet var roleInAccountBalace: UILabel!
    
    static func nib() -> UINib {
        return UINib(nibName: "ZpoinTableViewCell", bundle: nil)
    }
    
    public func configure(with model: MyQRViewModel){
        nameAccountBalance.text = model.nameAccountBalance
        numberAccountBalance.text = model.numberAccountBalance
        imageAccountBalance.image = UIImage(named: model.imageAccountBalance)
        roleInAccountBalace.text = model.roleInAccountBalance
        moneyAccountBalance.text = model.moneyAccountBalance
        uiViewColorCard.backgroundColor = model.backgroundColor
        iconSelect.image = UIImage(named: model.iconSelect)
    }
    
 
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        shadowUiView.layer.cornerRadius = 10
        shadowUiView.dropShadow()
 
        viewCard.backgroundColor = .white
        viewCard.layer.cornerRadius = 10.0
        viewCard.clipsToBounds = true
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension UIView {
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 1, height: 1)
        layer.shadowRadius = 4
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }

    func dropShadowCard(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOpacity = 2
        layer.shadowOffset = .zero
        layer.shadowRadius = 1
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}
