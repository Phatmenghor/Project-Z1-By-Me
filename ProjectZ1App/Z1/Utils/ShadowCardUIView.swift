//
//  ShadowCardUIView.swift
//  Z1 App IOS
//
//  Created by PHAT MENGHOR on 4/11/23.
//

import Foundation
import UIKit

class ShadowCardView: UIView{
    override init (frame: CGRect){
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder){
        super.init(coder: coder)
        initialSetup()
    }
    
    private func  initialSetup(){
        layer.shadowColor = UIColor.red.cgColor
        layer.shadowOffset  = .zero
        layer.cornerRadius = 10
        layer.shadowOpacity = 0.38
        cornerRadius = 10
    }
}
