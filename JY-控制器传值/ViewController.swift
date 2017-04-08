//
//  ViewController.swift
//  JY-控制器传值
//
//  Created by atom on 2017/3/25.
//  Copyright © 2017年 atom. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let item = "swift"
    
    override func viewWillAppear(_ animated: Bool) {
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let subVC = SubViewController()
        subVC.delegate = self
        self.navigationController?.pushViewController(subVC, animated: true)
        self.show(subVC, sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.blue
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: SubViewControllerDelegate {
    func vc(_ viewController: SubViewController, text: String?) {
        print(text.debugDescription)
    }
}

