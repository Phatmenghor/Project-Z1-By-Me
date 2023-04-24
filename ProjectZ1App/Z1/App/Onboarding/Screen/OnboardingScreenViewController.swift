//
//  OnboardingScreenViewController.swift
//  Z1 App IOS
//
//  Created by PHAT MENGHOR on 4/4/23.
//

import UIKit

class OnboardingScreenViewController: UIViewController {
    @IBOutlet var collectionView: UICollectionView!

    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var nextBtn: UIButton!
    var slides: [OnboardingModel] = []
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1 {
                nextBtn.setTitle("Get Started", for: .normal)
            } else {
                nextBtn.setTitle("Next", for: .normal)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
        // Do any additional setup after loading the view.
        slides = [
            OnboardingModel(image: UIImage(imageLiteralResourceName: "onboarding1")),
            OnboardingModel(image: UIImage(imageLiteralResourceName: "onboarding2")),
            OnboardingModel(image: UIImage(imageLiteralResourceName: "onboarding3")),
            OnboardingModel(image: UIImage(imageLiteralResourceName: "onboarding4")),
            OnboardingModel(image: UIImage(imageLiteralResourceName: "onboarding5")),
        ]
        pageControl.numberOfPages = slides.count
    }

    @IBAction func nextButtonClicked(_ sender: UIButton) {
        print("Hello")
        if currentPage == slides.count - 1 {
            SceneDelegate.window?.rootViewController = MainTabbarViewController()
            SceneDelegate.window?.makeKeyAndVisible()
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
}

extension OnboardingScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        cell.setImage(slides[indexPath.row])

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
}
