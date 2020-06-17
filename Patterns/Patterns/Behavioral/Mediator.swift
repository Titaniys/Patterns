//
//  Mediator.swift
//  Patterns
//
//  Created by Чистяков Вадим Евгеньевич on 17.06.2020.
//  Copyright © 2020 Вадим Чистяков. All rights reserved.
//

import Foundation

protocol Mediator {
	func notify(_ sender: Sender, event: Event)
}

protocol Sender {}

struct Event {
	let name: String
}

final class Button {
	private let mediator: Mediator
	private let event: Event

	init(mediator: Mediator, event: Event) {
		self.mediator = mediator
		self.event = event
	}

	func click() {
		mediator.notify(self, event: event)
	}
}

extension Button: Sender {}

final class Label {
	private let mediator: Mediator
	private let event: Event

	init(mediator: Mediator, event: Event) {
		self.mediator = mediator
		self.event = event
	}

	func changed() {
		mediator.notify(self, event: event)
	}
}

extension Label: Sender {}

final class InterfaceMediator: Mediator {

	func notify(_ sender: Sender, event: Event) {
		if sender is Button {
			print("button was clicked and send event \(event.name)")
		}
		if sender is Label {
			print("label was changed and send event \(event.name)")
		}
	}

}

class TestMediator {

	static func test() {
		let mediator = InterfaceMediator()
		let labelEvent = Event(name: "labelEvent")
		let label = Label(mediator: mediator, event: labelEvent)

		let buttonEvent = Event(name: "buttonEvent")
		let button = Button(mediator: mediator, event: buttonEvent)

		label.changed()
		button.click()
	}

}
