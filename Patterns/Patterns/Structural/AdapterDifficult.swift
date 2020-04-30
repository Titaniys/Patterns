//
//  AdapterDifficult.swift
//  Patterns
//
//  Created by Вадим Чистяков on 11.06.2018.
//  Copyright © 2018 Вадим Чистяков. All rights reserved.
//

import UIKit

class AdapterDifficult: NSObject {

	static func example() {
		
		let adapter = AdapterDifficult()
		
		let europeanCharger = EuropeanNotebookCharger()
		let usaCharger = USANotebookCharger()
		
		let usaChargerAdapter = USANotebookChargerAdapter().initWithUSANotebookCharger(usaCharger)
		
		
		adapter.makeTheNotebookCharge(europeanCharger)
		adapter.makeTheNotebookCharge(usaChargerAdapter)
	}
	
	func makeTheNotebookCharge(_ charger: Charger)  {
		charger.charge()
	}
}

class Charger: NSObject {
	func charge() {
		print("C'mon I am charging")
	}
}

protocol EuropeanNotebookChargerDelegate {
	func chargetNotebookRoundHoles(_ charge: Charger)
}

class EuropeanNotebookCharger: Charger, EuropeanNotebookChargerDelegate {
	
	override init() {
		super.init()
		self.delegate = self
	}
	
	var delegate : EuropeanNotebookChargerDelegate?
	
	override func charge() {
		delegate?.chargetNotebookRoundHoles(self)
		super.charge()
	}
	func chargetNotebookRoundHoles(_ charge: Charger) {
		print("Charging with 220 and round holes!")
	}
}

class USANotebookCharger: NSObject {
	func chargeNotebookRectHoles()  {
		print("Charge Notebook Rect Holes")
	}
}

class USANotebookChargerAdapter: Charger, EuropeanNotebookChargerDelegate {
	
	var usaCharger : USANotebookCharger?
	
	func initWithUSANotebookCharger(_ charger: USANotebookCharger) -> USANotebookChargerAdapter {
		self.usaCharger = charger
		return self
	}
	
	func chargetNotebookRoundHoles(_ charge: Charger) {
		usaCharger?.chargeNotebookRectHoles()
	}
	
	override func charge() {
		let europeanCharger = EuropeanNotebookCharger()
		europeanCharger.delegate = self
		europeanCharger.charge()
	}
}










