//
//  WindowManager.swift
//  ToDo
//
//  Created by Sahil Kapoor on 24/08/17.
//  Copyright © 2017 Sahil Kapoor. All rights reserved.
//

import UIKit

public final class AppWindow {
    
    static let shared = AppWindow()

    var window: UIWindow

    private init() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window.backgroundColor = UIColor.white
        window.setCornerRadius = 5
    }

    func prepare() {
        window.rootViewController = TabBarViewController()
        window.makeKeyAndVisible()
    }

 func makeRootViewController(_ viewController: UIViewController) {
        UIView.animate(withDuration: 0.5, animations: { () -> Void in
            if let rootViewController = self.window.rootViewController {
                rootViewController.view.alpha = 0.2
            }
        }) { (_) -> Void in
            self.window.rootViewController = viewController

            if let rootViewController = self.window.rootViewController {
                rootViewController.view.alpha = 0.2
            }

            UIView.animate(withDuration: 0.5) { () -> Void in
                if let rootViewController = self.window.rootViewController {
                    rootViewController.view.alpha = 1
                }
            }
        }
    }
}