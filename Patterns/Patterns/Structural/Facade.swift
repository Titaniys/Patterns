//
//  Facade.swift
//  Patterns
//
//  Created by Вадим Чистяков on 11.06.2018.
//  Copyright © 2018 Вадим Чистяков. All rights reserved.
//

import UIKit

final class Facade {

	static func example() {
		let travelFacade = TravelSystemFacade()
		travelFacade.travelToLocal("London")
	}
}

final class PathFinder {
	
	func findCurrentLocation()  {
		print("Finding your location. Hmmm, here you are!")
	}
	
	func findLocalToTravel(_ local: String) {
		print("So you wanna travel to", local)
	}
	
	func makeARoute() {
		print("Okay, to travel to this location we are using google maps....")
	}
}

final class TravelEngine {
	
	func findTransport() {
		print("Okay, to travel there you will probabply need dragon! Arghhhhh")
	}
	
	func orderTransport()  {
		print("Maaaam, can I order a dragon?... Yes... Yes, green one... Yes, with fire!... No, not a dragon of death... Thank you!")
	}
	
	func travel() {
		print("Maaan, you are flying on dragon!")
	}
}

final class TicketPrintingSystem {
	func createTicket() {
		print("Connecting to our ticket system...")
	}
	
	func printingTicket() {
		print("Hmmm, ticket for traveling on the green dragon. Interesting...")
	}
}

final class TravelSystemFacade {
	
	func travelToLocal(_ local: String) {

		let pathFinder = PathFinder()
		pathFinder.findCurrentLocation()
		pathFinder.findLocalToTravel(local)
		pathFinder.makeARoute()

        let travelEngine = TravelEngine()
		travelEngine.findTransport()
		travelEngine.orderTransport()
		travelEngine.travel()

        let ticket = TicketPrintingSystem()
		ticket.createTicket()
		ticket.printingTicket()
	}
}




