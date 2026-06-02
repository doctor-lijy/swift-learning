//
//  AppTabBarController.swift
//  Day15-UIKitShell
//
//  Created by RD前端-dodo on 2026/6/1.
//

import UIKit

class AppTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        viewControllers = [
            makeNave(root: HabitListViewController(), title: "123", icon: "list.bullet"),
            makeNave(root: StatsplaceholderViewController(), title: "234", icon: "chart.bar"),
            makeNave(root: SettingPlacehlderViewController(), title: "456", icon: "gearshape")
        ]
        tabBar.tintColor = .systemBlue
    }
    
    private func makeNave (root: UIViewController, title: String, icon: String) -> UINavigationController {
        root.title = title
        let nav = UINavigationController(rootViewController: root)
        nav.tabBarItem = UITabBarItem(title: title, image: UIImage(named: icon), selectedImage: nil)
        nav.navigationBar.prefersLargeTitles = true
        return nav
    }
    

}
