//
//  Participant.swift
//  Sports Tracker Mock
//
//  Created by Isaac Allport on 04/12/2021.
//

import SwiftUI

class Participant: Identifiable, Codable{
	let id: UUID
	var name: String
	var house: String
	var score: Double
	var position: Int
	var points: Int
	
	init(id: UUID = UUID(), name: String, house: String, score: Double, position: Int, points: Int) {
		self.id = id
		self.name = name
		self.house = house
		self.score = score
		self.position = position
		self.points = points
	}
}
