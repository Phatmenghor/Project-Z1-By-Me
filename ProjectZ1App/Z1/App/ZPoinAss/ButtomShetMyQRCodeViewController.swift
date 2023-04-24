//
//  ButtomShetMyQRCodeViewController.swift
//  ProjectZ1App
//
//  Created by PHAT MENGHOR on 4/22/23.
//

import UIKit

class ButtomShetMyQRCodeViewController: UIViewController {

    @IBOutlet weak var cardLoyaltyBalance: UIView!
    @IBOutlet weak var cardMainBalance: UIView!
    
    var hasSetPointOrigin = false
    var pointOrigin: CGPoint?
    @IBOutlet var viewButtomShet: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        view.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor

        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureRecognizerAction))
        view.addGestureRecognizer(panGesture)
        
        cardLoyaltyBalance.dropShadow()
        cardMainBalance.dropShadow()
        cardLoyaltyBalance.backgroundColor = .white
        cardMainBalance.backgroundColor = .white
        cardLoyaltyBalance.layer.cornerRadius = 10
       
        cardLoyaltyBalance.layer.masksToBounds = false

        cardMainBalance.layer.cornerRadius = 10
        viewButtomShet.roundCorners(.allCorners, radius: 10)
//        subscribeButton.roundCorners(.allCorners, radius: 10)
    }
    
    override func viewDidLayoutSubviews() {
        if !hasSetPointOrigin {
            hasSetPointOrigin = true
            pointOrigin = self.view.frame.origin
        }
    }
    @objc func panGestureRecognizerAction(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        
        // Not allowing the user to drag the view upward
        guard translation.y >= 0 else { return }
        
        // setting x as 0 because we don't want users to move\ the frame side ways!! Only want straight up or down
        view.frame.origin = CGPoint(x: 0, y: self.pointOrigin!.y + translation.y)
    
        if sender.state == .ended {
            let draggedToDismiss = (translation.y > view.frame.size.height/3.0)
            let dragVelocity = sender.velocity(in: view)
            if (dragVelocity.y >= 1300) || draggedToDismiss {
                self.dismiss(animated: true, completion: nil)
            } else {
                // Set back to original position of the view controller
                UIView.animate(withDuration: 0.3) {
                    self.view.frame.origin = self.pointOrigin ?? CGPoint(x: 0, y: 400)
                }
            }
        }
    }
    
}
