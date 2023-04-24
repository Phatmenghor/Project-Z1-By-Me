//
//  MyQRViewController.swift
//  ProjectZ1App
//
//  Created by PHAT MENGHOR on 4/18/23.
//

import UIKit

class MyQRViewController: UIViewController {
    
    @IBOutlet weak var arrowToShowButtomShet: UIImageView!
    @IBOutlet weak var viewCard: UIView!
    @IBOutlet weak var viewCardScan: UIView!
    @IBOutlet weak var cardUIViewShare: UIView!
    @IBOutlet weak var cardUIViewDownload: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        self.viewCard.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        self.view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        title = "My QR"
        
        viewCard.layer.masksToBounds = true
        
        cardUIViewShare.backgroundColor = .systemGray4
        cardUIViewDownload.backgroundColor = .systemGray4
        cardUIViewDownload.layer.cornerRadius = 10
        cardUIViewShare.layer.cornerRadius = 10
        
        viewCardScan.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
            arrowToShowButtomShet.isUserInteractionEnabled = true
            arrowToShowButtomShet.addGestureRecognizer(tapGestureRecognizer)
        }

    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let slideVC = ButtomShetMyQRCodeViewController()
        slideVC.modalPresentationStyle = .custom
        slideVC.transitioningDelegate = self
        self.present(slideVC, animated: true, completion: nil)
    }
    
}


extension MyQRViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        PresentationController(presentedViewController: presented, presenting: presenting)
    }
}

extension UIView {
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = .zero
        layer.shadowRadius = 1
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
