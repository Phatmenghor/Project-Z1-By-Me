//
//  ShadowUIView.swift
//  Z1 App IOS
//
//  Created by PHAT MENGHOR on 4/7/23.
//

import UIKit

class CardView: UIView{
    override init (frame: CGRect){
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder){
        super.init(coder: coder)
        initialSetup()
    }
    
    private func  initialSetup(){
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset  = .zero
        layer.cornerRadius = 10
        layer.shadowOpacity = 0.18
        cornerRadius = 15
    }
}
