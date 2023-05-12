//
//  ButtomShetMyQRCodeViewController.swift
//  ProjectZ1App
//
//  Created by PHAT MENGHOR on 4/22/23.
//

import UIKit

protocol MyQRViewControllerDelegate {
    
    func didSelectItem(
        nameAccounntBalance: String,
        numeberAccountBalance: String,
        imageMYQR: String,
        nameUserAccountBalance: String,
        imageAccountBalance: String
    )
    
}

class ButtomShetMyQRCodeViewController: UIViewController {
  
    @IBOutlet var tableView: UITableView!

    var listZpoin = [MyQRViewModel]()
    var delegate: MyQRViewControllerDelegate?
    var hasSetPointOrigin = false
    var pointOrigin: CGPoint?    
    override func viewDidLoad() {
        super.viewDidLoad()
        addItemToListModel()
        tableView.tableFooterView = UIView()
        
        tableView.register(ZpoinTableViewCell.nib(), forCellReuseIdentifier: ZpoinTableViewCell.identifier)
//        addItemToListModel()
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureRecognizerAction))
        view.addGestureRecognizer(panGesture)
        print("djksdfhsgdhjkd\(listZpoin.count)")
        
    }
    
    func addItemToListModel(){
          
        let firth = MyQRViewModel(nameUserAccountBalance: "John Doe", imageAccountBalance: "LoyaltyBalance", nameAccountBalance: "Loyalty Balance", numberAccountBalance: "030  222 111", roleInAccountBalance: "Coupon", moneyAccountBalance: "100.00", iconSelect: "circle",imageMyQR: "QRCode",isSelect: true,backgroundColor: .orange)
        let second = MyQRViewModel(nameUserAccountBalance: "John tah", imageAccountBalance: "MainBalance", nameAccountBalance: "Main Balance", numberAccountBalance: "010  040 444", roleInAccountBalance: "Main", moneyAccountBalance: "2,000.00", iconSelect: "Radio",imageMyQR: "QRCode",isSelect: true,backgroundColor: .blue)
    
        listZpoin.append(firth)
        listZpoin.append(second)
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

extension ButtomShetMyQRCodeViewController : UITableViewDelegate, UITableViewDataSource{
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listZpoin.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
      let cell = tableView.dequeueReusableCell(withIdentifier: ZpoinTableViewCell.identifier,for: indexPath) as! ZpoinTableViewCell
        
        if listZpoin[indexPath.row].isSelect == true {
            cell.iconSelect.image = UIImage(named: "circle")
            listZpoin[indexPath.row].isSelect = false
        }else{
            cell.iconSelect.image = UIImage(named: "Radio")
            listZpoin[indexPath.row].isSelect = true
        }
        
        if indexPath.row == 0 {
            cell.iconSelect.image = UIImage(named: "Radio")
            dismiss(animated: true)
            delegate?.didSelectItem(nameAccounntBalance: listZpoin[indexPath.row].nameAccountBalance, numeberAccountBalance: listZpoin[indexPath.row].numberAccountBalance, imageMYQR: listZpoin[indexPath.row].imageMyQR, nameUserAccountBalance: listZpoin[indexPath.row].nameUserAccountBalance,imageAccountBalance: listZpoin[indexPath.row].imageAccountBalance)
        } else {
            cell.iconSelect.image = UIImage(named: "Radio")
            dismiss(animated: true)
            delegate?.didSelectItem(nameAccounntBalance: listZpoin[indexPath.row].nameAccountBalance, numeberAccountBalance: listZpoin[indexPath.row].numberAccountBalance, imageMYQR: listZpoin[indexPath.row].imageMyQR, nameUserAccountBalance: listZpoin[indexPath.row].nameUserAccountBalance,imageAccountBalance: listZpoin[indexPath.row].imageAccountBalance)
        }
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ZpoinTableViewCell.identifier,for: indexPath) as! ZpoinTableViewCell
        cell.configure(with: listZpoin[indexPath.row])
        let selectedView = UIView()
           selectedView.backgroundColor = UIColor.white.withAlphaComponent(1) // Set the desired background color and opacity
           cell.selectedBackgroundView = selectedView // Assign the selected view to the cell's selectedBackgroundView property
        return cell
    }
    
}
