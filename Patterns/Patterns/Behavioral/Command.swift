//
//  Command.swift
//  Patterns
//
//  Created by Чистяков Вадим Евгеньевич on 10.06.2020.
//  Copyright © 2020 Вадим Чистяков. All rights reserved.
//

import Foundation

protocol Command {
	func execute()
}

class Receiver {
	func doExecution(_ text: String) {
		print("Receiver's got a command and executed task \(text)")
	}
}

final class SimpleCommand: Command {
	func execute() {
		print("Do simple executing")
	}
}

final class ComplexCommand: Command {

	private let receiver: Receiver
	private let mode: String

	init(receiver: Receiver, mode: String) {
		self.receiver = receiver
		self.mode = mode
	}
	func execute() {
		receiver.doExecution(mode)
	}

}

final class Invoker {

	private let simpleCommand: Command
	private let complexCommand: Command

	init(simpleCommand: Command, complexCommand: Command) {
		self.simpleCommand = simpleCommand
		self.complexCommand = complexCommand
	}

	func invokeWork() {
		simpleCommand.execute()

		print("I'm watching you, I'm watching you")
		print("All the things I'll do")

		complexCommand.execute()
	}

}

class TestCommandPattern {

	static func test() {
		let simpleCommand = SimpleCommand()

		let receiver = Receiver()
		let complexCommand = ComplexCommand(receiver: receiver, mode: "test mode")

		let invoker = Invoker(simpleCommand: simpleCommand, complexCommand: complexCommand)
		invoker.invokeWork()
	}
}
