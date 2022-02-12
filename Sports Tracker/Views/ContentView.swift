//
//  ContentView.swift
//  Sports Tracker Mock
//
//  Created by Isaac Allport on 04/12/2021.
//

import SwiftUI

struct ContentView: View {
	@Environment(\.scenePhase) var scenePhase
	
	@Binding var Races: [Race]
	@Binding var houseSettings: [House]
	@Binding var scoreSettings: [Score]
	
	let saveAction: () -> Void
	let saveHouseAction: () -> Void
	let saveScoreAction: () -> Void
	
	@State private var isPresenting: Bool = false
	
    var body: some View {
		List {
			NavigationLink(destination: {
				RacesView(Races: $Races, houseSettings: houseSettings, scoreSettings: scoreSettings){
					saveAction()
				}
			}, label: {
				Label("Races", systemImage: "list.dash")
			})
			
			NavigationLink(destination: {
				ParticipantsView(Races: $Races)
			}, label: {
				Label("Participants", systemImage: "person.2")
			})
			
			Section(header: Text("Results")) {
				
				NavigationLink(destination: {
					ResultsView(Races: $Races)
						.navigationTitle("Results")
				}, label: {
					Label("Results", systemImage: "chart.bar.xaxis")
				})
				
			}
			
			Section(header: Text("Tracker Settings")) {
				
				NavigationLink(destination: {
					HouseSettingsView(Houses: $houseSettings, saveHouseAction: {
						saveHouseAction()
					})
				}, label: {
					Label("Houses", systemImage: "house.fill")
				})
				
				NavigationLink(destination: {
					ScoreSettingsView(Scores: $scoreSettings, saveScoreAction: {
						saveScoreAction()
					})
				}, label: {
					Label("Scores", systemImage: "rosette")
				})
				
			}
			
		}
		.navigationTitle("Sports Tracker")
		.navigationBarItems(trailing: Button(action: {
			isPresenting = true
		}, label: {
			Image(systemName: "gearshape")
		}))
		.onChange(of: scenePhase) { phase in
			if phase == .inactive { saveAction() }
		}
		.sheet(isPresented: $isPresenting) {
			NavigationView {
				SettingsView()
					.navigationTitle("Settings")
					.navigationBarItems(trailing: Button("Done") {
						isPresenting = false
					})
			}
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		ContentView(Races: .constant(Race.data), houseSettings: .constant(House.data), scoreSettings: .constant(Score.data), saveAction: {}, saveHouseAction: {}, saveScoreAction: {})
			.previewInterfaceOrientation(.landscapeRight)
    }
}
