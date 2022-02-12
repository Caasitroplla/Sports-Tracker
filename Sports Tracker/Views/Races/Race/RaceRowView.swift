//
//  RaceRowView.swift
//  Sports Tracker Mock
//
//  Created by Isaac Allport on 04/12/2021.
//

import SwiftUI

struct RaceRowView: View {
	var Participant: Participant
	var houseSettings: [House]
	var scoreSettings: [Score]
	var relayType: String
	@State var position: String = ""
	@State var score: String = ""
	@State var name: String = ""
	let saveAction: () -> Void
	
    var body: some View {
		HStack {
			VStack {
				HStack {
					TextField("Name", text: $name)
						.submitLabel(.continue)
						.onAppear {
							name = Participant.name
						}
						.onSubmit {
							Participant.name = name
							saveAction()
						}
					Spacer()
				}
				HStack {
					Menu(Participant.house.isEmpty ? "Houseless" : Participant.house) {
						ForEach(houseSettings) { house in
							Button(action: {
								Participant.house = house.name
								saveAction()
							}, label: {
								Text(house.name)
									.foregroundColor(house.color)
							})
						}
					}
					.foregroundColor(findAccentColor(houseSettings: houseSettings, houseName: Participant.house))
					Spacer()
				}
			}
			Text("\(Participant.points)")
				.foregroundColor(.gray)
			Spacer()
			VStack(alignment: .trailing) {
				HStack {
					Spacer()
					
					TextField("Position", text: $position)
						.keyboardType(.numberPad)
						.submitLabel(.continue)
						.onAppear {
							position = String(Participant.position)
						}
						.onSubmit {
							Participant.position = Int(position) ?? 0
							position = String(Participant.position)
							//Participant.points = calculatePoints(raceType: <#T##String#>, raceSettings: scoreSettings, position: Participant.position)
							saveAction()
						}
						.multilineTextAlignment(.trailing)
				}
				HStack {
					Spacer()
					
					TextField("Score", text: $score)
						.keyboardType(.decimalPad)
						.submitLabel(.continue)
						.onAppear {
							score = String(Participant.score)
						}
						.onSubmit {
							Participant.score = Double(score) ?? 0
							score = String(Participant.score)
							saveAction()
						}
						.multilineTextAlignment(.trailing)
				}
			}
		}
    }
	func findAccentColor(houseSettings: [House], houseName: String) -> Color{
		for house in houseSettings {
			if house.name == houseName {
				return house.color
			}
		}
		return Color(.black)
	}
}

struct RaceRowView_Previews: PreviewProvider {
    static var previews: some View {
		NavigationView {
			RaceRowView(Participant: Participant(id: UUID(), name: "Jeeff", house: "Fereby", score: 12.2, position: 1, points: 6), houseSettings: House.data, scoreSettings: Score.data, relayType: "A Relay", saveAction: {})
		}
		.navigationViewStyle(StackNavigationViewStyle())
    }
}
