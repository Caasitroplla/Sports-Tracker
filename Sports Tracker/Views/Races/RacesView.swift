//
//  RacesView.swift
//  Sports Tracker Mock
//
//  Created by Isaac Allport on 04/12/2021.
//

import SwiftUI

struct RacesView: View {
	@Environment(\.scenePhase) var scenePhase
	@Binding var Races: [Race]
	@State private var isPresented = false
	@State private var newRaceData = Race.Data()
	var houseSettings: [House]
	var scoreSettings: [Score]
	let saveAction: () -> Void
    var body: some View {
		List {
			ForEach(Races) { Race in
				// TODO: Separate with headers for each year
				NavigationLink(destination: {
					RaceView(race: binding(for : Race), houseSettings: houseSettings, scoreSettings: scoreSettings) {
						saveAction()
					}
				}, label: {
					CardView(Race: Race, scoreSettings: Score.data)
				})
			}
			Section("Year 7") {
				
			}
			Section("Year 8") {
				
			}
			Section("Year 9") {
				
			}
			Section("Year 10") {
				
			}
			Section("Year 11") {
				
			}
			Text("Will sort this out but weird atm")
				.font(.caption)
		}
		.navigationTitle("Races")
		.navigationBarItems(trailing:
			Button(action: {
				isPresented = true
			}, label: {
				Image(systemName: "plus")
			})
		)
		.sheet(isPresented: $isPresented) {
			NavigationView {
				EditView(RaceData: $newRaceData, scoreSettings: scoreSettings)
					.navigationBarItems(leading: Button("Dismiss") {
						isPresented = false
					}, trailing: Button("Add") {
						let newRace = Race(id: UUID(), name: newRaceData.name, relay: newRaceData.relay, gender: newRaceData.gender, year: newRaceData.year, participants: newRaceData.participants)
						Races.append(newRace)
						isPresented = false
					})
			}
		}
		.onChange(of: scenePhase) { phase in
			if phase == .inactive { saveAction() }
		}
    }
	
	private func binding(for Race: Race) -> Binding<Race> {
		guard let raceIndex = Races.firstIndex(where: { $0.id == Race.id }) else {
			fatalError("Can't find scrum in array")
		}
		return $Races[raceIndex]
	}
}

struct RacesView_Previews: PreviewProvider {
    static var previews: some View {
		RacesView(Races: .constant(Race.data), houseSettings: House.data, scoreSettings: Score.data, saveAction: {})
    }
}
