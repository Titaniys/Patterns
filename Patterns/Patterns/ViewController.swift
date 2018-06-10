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
		
		exampleAbstractFactory()
		
		let builder = Builder()
		builder.example()
		
	}


	func exampleAbstractFactory() {
		
		let abstractFactory = AbstractFactory()
		abstractFactory.isThirdWorld = true
		
		let factory = abstractFactory.getFactory()
		let genIphone = factory.getIphone()
		let genIpad = factory.getIpad()
		
		print("china:", genIphone.osName!, genIphone.productName!)
		print("chinaIpad:", genIpad.osName!, genIpad.productName!, genIpad.screenSize!)
		
		abstractFactory.isThirdWorld = false
		let newFac = abstractFactory.getFactory()
		let iphone = newFac.getIphone()
		let ipad = newFac.getIpad()
		
		print("usa:", iphone.osName!, iphone.productName!)
		print("usa:", ipad.osName!, ipad.productName!, ipad.screenSize!)
		
	}
}

