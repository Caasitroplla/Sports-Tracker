//
//  Score.swift
//  Sports Tracker Mock
//
//  Created by Isaac Allport on 04/12/2021.
//

import SwiftUI

class Score: Codable, Identifiable, Equatable {
	let id: UUID
	var raceType: String
	var scoresForPosition: [String]
	var imageName: String
	
	init(id: UUID = UUID(),raceType: String, scoresForPosition: [String], imageName: String){
		self.id = id
		self.raceType = raceType
		self.scoresForPosition = scoresForPosition
		self.imageName = imageName
	}
}

extension Score { // This enables Equatable protocol
	static func == (lhs: Score, rhs: Score) -> Bool {
		if lhs.id == rhs.id {
			return true
		} else {
			return false
		}
	}
}

extension Score {
	static var data: [Score] {
		[
			Score(raceType: "A Relay", scoresForPosition: ["6", "5", "4", "3", "2", "1"], imageName: "person.3"),
			Score(raceType: "B Relay", scoresForPosition: ["6", "5", "4", "3", "2", "1"], imageName: "person.3"),
			Score(raceType: "No Relay", scoresForPosition: ["6", "5", "4", "3", "2", "1"], imageName: "person")
		]
	}
}

extension Score {
	struct Data {
		var raceType: String = ""
		var scoresForPosition: [String] = []
		var imageName: String = ""
	}
	
	var data: Data {
		return Data(raceType: raceType, scoresForPosition: scoresForPosition, imageName: imageName)
	}
	
	func update(from data: Data) { // may required mutating prefix
		raceType = data.raceType
		scoresForPosition = data.scoresForPosition
		imageName = data.imageName
	}
}
