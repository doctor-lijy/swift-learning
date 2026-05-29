//
//  ViewController.swift
//  Day10-AsyncTask
//
//  Created by RD前端-dodo on 2026/5/28.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        do {
            let content = try readFile(name: "data.text")
            print(content)
        } catch {
            print("error:\(error)")
        }
        
        let content = try? readFile(name: "data.text")
        if let content = content {
            print("\(content)")
        } else {
            print("nil")
        }
        
    }
    
    func processFile() throws {
        let content = try readFile(name: "data.text")
        print(content)
    }
    
    func loadUserAvatar() -> UIImage? {
        let data = try? Data(contentsOf: URL(string: "xxxx") ?? URL(fileURLWithPath: ""))
        return data.flatMap { UIImage(data: $0)
        }
    }


}

