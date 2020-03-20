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
		
        let app = LoggisticApp()

        app.example(distance: 900)
        app.example(distance: 1100)
        app.example(distance: 1000)
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

