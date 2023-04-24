//
//  SplashScreenViewController.swift
//  Z1 App By Menghor
//
//  Created by MacBook Pro on 3/4/23.
//

import UIKit

class SplashScreenViewController: UIViewController, UIWindowSceneDelegate {
    @IBOutlet var bottomLabel: UILabel!
    @IBOutlet var textWelcomeLabel: UILabel!
    @IBOutlet var welcomeLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        textWelcomeLabel.text = ""

        let textWelcome = "Welcome To Z1 By Menghor"

        var charIndex = 0.0

        for welcome in textWelcome {
            Timer.scheduledTimer(withTimeInterval: 0.2 * charIndex, repeats: false) { _ in self.textWelcomeLabel.text?.append(welcome)
            }
            charIndex += 1
        }

        guard let onboardingScreenViewController = UIStoryboard(name: "OnboardingScreenViewController", bundle: .main).instantiateViewController(withIdentifier: "OnboardingScreenViewController") as? OnboardingScreenViewController else {
            fatalError("Unable to Instantiate Quotes View Controller")
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
//            let main = MainTabbarViewController()
            SceneDelegate.window?.rootViewController = onboardingScreenViewController
            SceneDelegate.window?.makeKeyAndVisible()
        }
    }
}
