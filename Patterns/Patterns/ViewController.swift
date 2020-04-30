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

        let storage: Storage = StorageImpl()
        storage.read()
        storage.write()

        let proxy: Storage = StorageProxy(storage: storage)
        proxy.read()
        proxy.write()
    }
}

