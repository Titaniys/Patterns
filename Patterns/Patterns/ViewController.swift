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
		
		let prototype = Prototype()
		prototype.prototypeExample()
		
		
		let productGen = ProductGenerator()
		productGen.saveExpenses(100)
		productGen.saveExpenses(1)
		productGen.saveExpenses(0)
		productGen.saveExpenses(200)
		
	}


}

