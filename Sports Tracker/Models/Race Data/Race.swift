//
//  Race.swift
//  Sports Tracker Mock
//
//  Created by Isaac Allport on 04/12/2021.
//

import SwiftUI

struct Race: Identifiable, Codable {
	let id: UUID
	var name: String
	var relay: String
	var gender: String
	var year: Int
	var participants: [Participant]
	
	init(id: UUID = UUID(), name: String, relay: String, gender: String, year: Int, participants: [Participant]){
		self.id = id
		self.name = name
		self.relay = relay
		self.gender = gender
		self.year = year
		self.participants = participants
	}
}

extension Race {
	static var data: [Race] {[
		Race(id: UUID(), name: "100m", relay: "No Relay", gender: "Male", year: 9, participants: [
			Participant(id: UUID(), name: "Jeff", house: "Fereby", score: 11.3, position: 1, points: 6),
			Participant(id: UUID(), name: "Bill", house: "Hicks", score: 12.4, position: 2, points: 5),
			Participant(id: UUID(), name: "Matt", house: "Townsend", score: 13.6, position: 3, points: 4)
		]),
		Race(id: UUID(), name: "200m", relay: "No Relay", gender: "Female", year: 9, participants: [
			Participant(id: UUID(), name: "Amelie", house: "Fereby", score: 25.6, position: 1, points: 6)
		])
	]}
}

extension Race {
	struct Data {
		var name: String = ""
		var relay: String = ""
		var gender: String = ""
		var year: Int = 9
		var participants: [Participant] = []
	}
	
	var data: Data {
		return Data(name: name, relay: relay, gender: gender, year: year, participants: participants)
	}
	
	mutating func update(from data: Data) {
		name = data.name
		relay = data.relay
		gender = data.gender
		year = data.year
		participants = data.participants
	}
}
