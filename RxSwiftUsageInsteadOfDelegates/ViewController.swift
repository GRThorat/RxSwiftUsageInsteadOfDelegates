//
//  ViewController.swift
//  RxSwiftUsageInsteadOfDelegates
//
//  Created by gaurav thorat on 05/01/19.
//  Copyright © 2019 gaurav thorat. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {

    @IBOutlet weak var detailTextLabel: UILabel!
    var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func editButtonClicked(_ sender: UIButton) {
        sender.rx.tap.throttle(0.5, latest: false, scheduler: MainScheduler.instance)
            .subscribe(onNext: { _ in
                let editController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EditViewController") as? EditViewController
                editController?.detailString.subscribe(onNext: { tempDetailString in
                    self.detailTextLabel.text = tempDetailString
                    editController?.dismiss(animated: true, completion: nil)
                })
                .disposed(by: self.disposeBag)
                self.present(editController!, animated: true, completion: nil)
            })
        .disposed(by: disposeBag)
    }
    
}

