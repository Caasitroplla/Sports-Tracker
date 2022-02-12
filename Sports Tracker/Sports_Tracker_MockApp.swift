//
//  Sports_Tracker_MockApp.swift
//  Sports Tracker Mock
//
//  Created by Isaac Allport on 04/12/2021.
//

import SwiftUI

@main
struct Sports_Tracker_MockApp: App {
	@ObservedObject private var data = RaceData()
	@ObservedObject private var houseSettings = HouseData()
	@ObservedObject private var scoreSettings = ScoreData()
	@Environment(\.scenePhase) var scenePhase
	
    var body: some Scene {
        WindowGroup {
			NavigationView {
				ContentView(Races: $data.Races, houseSettings: $houseSettings.Houses, scoreSettings: $scoreSettings.Scores) {
					data.save()
				} saveHouseAction: {
					houseSettings.save()
				} saveScoreAction: {
					scoreSettings.save()
				}
			}
			.onAppear {
				data.load()
				houseSettings.load()
				scoreSettings.load()
			}
        }
    }
}
