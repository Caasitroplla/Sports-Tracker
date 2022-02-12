//
//  House.swift
//  Sports Tracker Mock
//
//  Created by Isaac Allport on 04/12/2021.
//

import SwiftUI

class House: Codable, Identifiable, Equatable {
	static func == (lhs: House, rhs: House) -> Bool {
		if lhs.id == rhs.id {
			return true
		} else {
			return false
		}
	}
	
	let id: UUID
	var name: String
	var color: Color
	
	init(id: UUID = UUID(), name: String, color: Color) {
		self.id = id
		self.name = name
		self.color = color
	}
}

extension House {
	static var data: [House] {
		[
			House(id: UUID(), name: "Fereby", color: Color(.blue)),
			House(id: UUID(), name: "Hicks", color: Color(.red)),
			House(id: UUID(), name: "Townsend", color: Color(.green))
		]
	}
}

extension House {
	struct Data {
		var name: String = ""
		var color: Color = .random
	}
	
	var data: Data {
		return Data(name: name, color: color)
	}
	
	func update(from data: Data) { // might need mutating prefix later
		name = data.name
		color = data.color
	}
}
