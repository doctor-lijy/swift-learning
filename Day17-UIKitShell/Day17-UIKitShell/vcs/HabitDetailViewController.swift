//
//  HabitDetailViewController.swift
//  Day15-UIKitShell
//
//  Created by RD前端-dodo on 2026/6/1.
//

import UIKit

class HabitDetailViewController: UIViewController {
    
    var habitTitle: String = "123" {
        willSet {
            print("赋新值\(newValue)")
        } didSet {
            print("旧值是\(oldValue)，新值是：\(habitTitle)")
        }
    }
    
//    init(habitTitle: String) {
//        self.habitTitle = habitTitle
//        super.init(nibName: nil, bundle: nil)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
