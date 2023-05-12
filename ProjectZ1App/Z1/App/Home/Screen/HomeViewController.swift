//
//  HomeViewController.swift
//  Z1 App Clone
//
//  Created by MacBook Pro on 24/3/23.
//

import UIKit

class HomeViewController: Z1BaseViewController {
    @IBOutlet var slidecollectionView: UICollectionView!
    @IBOutlet var miniAppCollectionView: UICollectionView!
    @IBOutlet var saleCardCollectionView: UICollectionView!

    @IBOutlet var pageControl: UIPageControl!

    let listImageSlides = ["ImageSlide1", "rose0", "ImageSlide2", "rose0"]
    var listItemMiniApp = [
        MiniAppModel(image: "Buysell", title: "Buy/Sell"),
        MiniAppModel(image: "Rent", title: "Rent"),
        MiniAppModel(image: "IndicationPlus", title: "Indication Plus"),
        MiniAppModel(image: "News", title: "News"),
        MiniAppModel(image: "loan", title: "loan"),
        MiniAppModel(image: "ZillionUnited", title: "Zillion United"),
        MiniAppModel(image: "Services", title: "Services"),
        MiniAppModel(image: "More", title: "More"),
    ]
//
    var timer: Timer?
    var currentIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        APICaller().getDataAPIZpoin()

        configureNavbar()
        slidecollectionView.delegate = self
        slidecollectionView.dataSource = self
        startTimer()
        pageControl.numberOfPages = listImageSlides.count
//        setUpCollectionView()
    }

//    private func setUpCollectionView() {
//        miniAppCollectionView
//            .register(UICollectionViewCell.self,
//                      forCellWithReuseIdentifier: "MiniAppCollectionViewCell")
//
//        miniAppCollectionView.delegate = self
//        miniAppCollectionView.dataSource = self
//
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .vertical
//
//        layout.minimumLineSpacing = 8
//
//        layout.minimumInteritemSpacing = 4
//
//        miniAppCollectionView
//            .setCollectionViewLayout(layout, animated: true)
//    }

    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(imageSlideView), userInfo: nil, repeats: true)
    }

    @objc func imageSlideView() {
        if currentIndex == listImageSlides.count - 1 {
            currentIndex = -1
        } else {
            currentIndex += 1
            slidecollectionView.scrollToItem(at: IndexPath(item: currentIndex, section: 0), at: UICollectionView.ScrollPosition.centeredHorizontally, animated: true)
            pageControl.currentPage = currentIndex
        }
    }

    private func configureNavbar() {
        var image = UIImage(named: "Z1Logo")
        image = image?.withRenderingMode(.alwaysOriginal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .done, target: self, action: nil)

        var iconNotification = UIImage(named: "Notification")
        var iconFavorith = UIImage(named: "FavorithApp")
        iconNotification = iconNotification?.withRenderingMode(.alwaysOriginal)
        iconFavorith = iconFavorith?.withRenderingMode(.alwaysOriginal)
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: iconNotification, style: .done, target: self, action: nil),
            UIBarButtonItem(image: iconFavorith, style: .done, target: self, action: #selector(logoutUser)),
        ]
        navigationController?.navigationBar.tintColor = .white
    }

    @objc func logoutUser() {
        guard let assignmentViewController = UIStoryboard(name: "ZPoinAssignmentViewController", bundle: .main).instantiateViewController(withIdentifier: "ZPoinAssignmentViewController") as? ZPoinAssignmentViewController else {
            fatalError("Unable to Instantiate Quotes View Controller")
        }
        
        assignmentViewController.hidesBottomBarWhenPushed = true

        navigationController?.pushViewController(assignmentViewController, animated: true)
        print("clicked")
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case slidecollectionView:
            return listImageSlides.count
        case miniAppCollectionView:
            return listItemMiniApp.count
        case saleCardCollectionView:
            return 3
        default:
            return 0
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case slidecollectionView:
            let cell = slidecollectionView.dequeueReusableCell(withReuseIdentifier: "SlideHomePageCollectionViewCell", for: indexPath) as! SlideHomePageCollectionViewCell
            cell.imageSlide.layer.cornerRadius = 10
            cell.imageSlide.image = UIImage(named: listImageSlides[indexPath.row])
            return cell
        case miniAppCollectionView:
            let cell = miniAppCollectionView.dequeueReusableCell(withReuseIdentifier: "MiniAppCollectionViewCell", for: indexPath) as! MiniAppCollectionViewCell
            cell.setItemToMiniApp(item: listItemMiniApp[indexPath.row])
            return cell
        case saleCardCollectionView:
            let cell = saleCardCollectionView.dequeueReusableCell(withReuseIdentifier: "CardCollectionViewCell", for: indexPath) as! CardCollectionViewCell
//            cell.setItemToMiniApp(item: listItemMiniApp[indexPath.row])
            return cell
        default:
            return UICollectionViewCell()
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case slidecollectionView:
            return CGSize(width: slidecollectionView.frame.width, height: slidecollectionView.frame.height)
        case miniAppCollectionView:
            let lay = collectionViewLayout as! UICollectionViewFlowLayout

            let widthPerItem = collectionView.frame.width / 4 - lay.minimumInteritemSpacing
            return CGSize(width: widthPerItem - 8, height: 100)
        case saleCardCollectionView:
            return CGSize(width: saleCardCollectionView.frame.width, height: saleCardCollectionView.frame.height)
        default:
            return CGSize()
        }
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                          section: Int) -> UIEdgeInsets
    {
        switch collectionView {
        case slidecollectionView:
            return UIEdgeInsets()
        case miniAppCollectionView:
            return UIEdgeInsets(top: 1.0, left: 8.0, bottom: 1.0, right: 8.0)
        case saleCardCollectionView:
            return UIEdgeInsets(top: 0.0, left: 16, bottom: 0.0, right: 16.0)
        default:
            return UIEdgeInsets()
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        switch collectionView {
        case slidecollectionView:
            return 0
        case miniAppCollectionView:
            return 0
        case saleCardCollectionView:
            return 16
        default:
            return 0
        }
    }
}
