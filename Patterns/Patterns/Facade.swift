//
//  Facade.swift
//  Patterns
//
//  Created by Вадим Чистяков on 11.06.2018.
//  Copyright © 2018 Вадим Чистяков. All rights reserved.
//

import UIKit

class Facade: NSObject {

	static func example() {
		let travelFacade = TravelSystemFacade()
		travelFacade.travelToLocal("London")
	}
}

class PathFinder: NSObject {
	
	func findCurrentLocation()  {
		print("Finding your location. Hmmm, here you are!")
	}
	
	func findLocalToTravel(_ local: String) {
		print("So you wanna travell to", local)
	}
	
	func makeARoute() {
		print("Okay, to travell to this location we are using google maps....")
	}
}

class TravelEngine: NSObject {
	
	func findTransport() {
		print("Okay, to travell there you will probabply need dragon!Arghhhhh")
	}
	
	func orderTransport()  {
		print("Maaaam, can I order a dragon?... Yes... Yes, green one... Yes, with fire!... No, not a dragon of death... Thank you!")
	}
	
	func travel() {
		print("Maaan, you are flying on dragon!")
	}
}

class TicketPrintingSystem: NSObject {
	
	func createTicket() {
		print("Connecting to our ticketing system...")
	}
	
	func printingTicket() {
		print("Hmmm, ticket for travelling on the green dragon.Interesting...")
	}
}

class TravelSystemFacade: NSObject {
	
	func travelToLocal(_ local: String) {
		let pathFinder = PathFinder()
		let travelEngine = TravelEngine()
		let ticket = TicketPrintingSystem()
		
		pathFinder.findCurrentLocation()
		pathFinder.findLocalToTravel(local)
		pathFinder.makeARoute()
		
		travelEngine.findTransport()
		travelEngine.orderTransport()
		travelEngine.travel()
		
		ticket.createTicket()
		ticket.printingTicket()
	}
}




