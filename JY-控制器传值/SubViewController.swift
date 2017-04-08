//
//  SubViewController.swift
//  JY-控制器传值
//
//  Created by atom on 2017/3/25.
//  Copyright © 2017年 atom. All rights reserved.
//

import UIKit

protocol SubViewControllerDelegate: NSObjectProtocol {
    func vc(_ viewController: SubViewController, text: String?)
}

class SubViewController: UIViewController {
    weak var delegate: SubViewControllerDelegate?
    fileprivate var item: String?
    @IBOutlet weak var textLabel: UITextField!
    var backValueClusore:((_ text:String)->Void)?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(testLabel)
    }
    
    private lazy var testLabel: UITextField = {
        let textLabel = UITextField()
        textLabel.frame = CGRect(x: 100, y: 200, width: 100, height: 20)
        textLabel.backgroundColor = UIColor.lightGray
        textLabel.placeholder = "swift"
        textLabel.borderStyle = .roundedRect
        textLabel.clearButtonMode = .whileEditing
        textLabel.keyboardType = .emailAddress
        textLabel.returnKeyType = .done
        textLabel.textColor = UIColor.red
        
        textLabel.delegate = self
        return textLabel
    }()
    
    override func viewWillDisappear(_ animated: Bool) {
        //self.isEditing = false
        //print(textLabel.debugDescription)
        self.delegate?.vc(self, text: item)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension SubViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        //print(textField.text)
        item = textField.text
        
        textField.resignFirstResponder()
    }
}
