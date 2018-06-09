//
//  FactoryMethod.swift
//  Patterns
//
//  Created by Вадим Чистяков on 09.06.2018.
//  Copyright © 2018 Вадим Чистяков. All rights reserved.
//

import UIKit

class FactoryMethod: NSObject {

}

class Product: NSObject {
	var name : NSString?
	var price : Int?
	
	func getPriceTotalPrice(_ sum : Int) -> Int {
		if let price = price {
			return price + sum
		}
		return sum
	}
	
	func saveObject()  {
		print("I am saving an object in to product database")
	}
}


class Toy: Product {
	override func saveObject() {
		print("I am saving a toy in to product database")
	}
}


class Dress: Product {
	override func saveObject() {
		print("I am saving a dress in to product database")
	}
}


class ProductGenerator: NSObject {
	
	func getProduct(_ inputPrice: Int) -> Product? {
		
		if (inputPrice < 100 && inputPrice > 0) {
			let toy = Toy()
			return toy
		} else if inputPrice >= 100 {
			let dress = Dress()
			return dress
		}
		return nil
	}
	
	func saveExpenses(_ inputPrice: Int) {
		let pg = ProductGenerator()
		let product = pg.getProduct(inputPrice)
		
		product?.saveObject()
	}
}



