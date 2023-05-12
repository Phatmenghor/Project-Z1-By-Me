//
//  ZPoinAssignmentViewController.swift
//  ProjectZ1App
//
//  Created by PHAT MENGHOR on 5/2/23.
//

import UIKit



class ZPoinAssignmentViewController: Z1BaseViewController, MyQRViewControllerDelegate{
    
    func didSelectItem(nameAccounntBalance: String, numeberAccountBalance: String, imageMYQR: String, nameUserAccountBalance: String, imageAccountBalance: String) {
        accountBalance.text = nameAccounntBalance
        numberBalance.text = numeberAccountBalance
        imageScanAccount.image = UIImage(named: imageMYQR)
        nameAccount.text = nameUserAccountBalance
        self.imageAccountBalance.image = UIImage(named: imageAccountBalance)
    }
    
    @IBOutlet var accountBalance: UILabel!
    @IBOutlet var numberBalance: UILabel!
    @IBOutlet var imageScanAccount: UIImageView!
    @IBOutlet var imageAccountBalance: UIImageView!
    @IBOutlet var viewCardScan: UIView!
    @IBOutlet var nameAccount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setColor()
      
//        getData()
        title = "My QR"
        navigationController?.navigationBar.tintColor = .black
        imageScanAccount.image = UIImage(named: "QRCode")
        
        viewCardScan.layer.cornerRadius = 15
        viewCardScan.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMinXMaxYCorner,.layerMaxXMaxYCorner]

    }
    
//    private func getData(){
//        APICaller.shared.getDataAPIZPoin { _ in
//
//        }
//    }
    
    func setColor(){
        self.view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        viewCardScan.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
    }
    
    @objc func showMiracle() {
        let slideVC = ButtomShetMyQRCodeViewController()
        slideVC.delegate = self
        slideVC.modalPresentationStyle = .custom
        slideVC.transitioningDelegate = self
        self.present(slideVC, animated: true, completion: nil)
    }

    @IBAction func buttonShowButtomSheet(_ sender: UIButton) {
        showMiracle()
    }
}

extension ZPoinAssignmentViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        PresentationController(presentedViewController: presented, presenting: presenting)
    }
}
