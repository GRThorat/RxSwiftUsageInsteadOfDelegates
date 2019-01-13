//
//  EditViewController.swift
//  RxSwiftUsageInsteadOfDelegates
//
//  Created by gaurav thorat on 05/01/19.
//  Copyright © 2019 gaurav thorat. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class EditViewController: UIViewController {

    @IBOutlet weak var detailTextField: UITextField!
    var detailString = PublishSubject<String>()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func submitClicked(_ sender: UIButton) {
        detailString.onNext(detailTextField.text!)
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

extension EditViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
