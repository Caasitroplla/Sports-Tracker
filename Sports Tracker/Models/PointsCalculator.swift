//
//  PointsCalculator.swift
//  Sports Tracker Mock
//
//  Created by Isaac Allport on 05/12/2021.
//

import Foundation

func calculatePoints(raceType: String, raceSettings: [Score], position: Int) -> String{
	for score in raceSettings {
		if score.raceType == raceType {
			if position < score.scoresForPosition.count {
				return score.scoresForPosition[position - 1]
			} else {
				return "0"
			}
		}
	}
	return "0"
}
