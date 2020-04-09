//
//  ViewController.swift
//  Patterns
//
//  Created by Вадим Чистяков on 07.06.2018.
//  Copyright © 2018 Вадим Чистяков. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        let vc = TemplateCollectionViewController<TestProtocol, BaseSection>()
        let vm = BaseViewModel()

//        vc.box = ViewModelBox(vm)
        let newVC = NewTemp()
        newVC.viewModel = vm

        present(newVC, animated: true, completion: nil)
    }
}

