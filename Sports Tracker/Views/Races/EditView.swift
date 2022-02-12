//
//  EditView.swift
//  Sports Tracker Mock
//
//  Created by Isaac Allport on 04/12/2021.
//

import SwiftUI

struct EditView: View {
	@Binding var RaceData: Race.Data
	@State private var newParticipant = ""
	@State private var year: String = ""
	var scoreSettings: [Score]
    
	var body: some View {
		List {
			Section(header: Text("Race Info")) {
				TextField("Name", text: $RaceData.name)
				
				Menu(RaceData.gender.isEmpty ? "Gender" : RaceData.gender) {
					Button(action: {
						RaceData.gender = "Male"
					}, label: {
						Text("Male")
							.foregroundColor(.blue)
					})
					Button(action: {
						RaceData.gender = "Female"
					}, label: {
						Text("Female")
							.foregroundColor(.pink)
					})
					Button(action: {
						RaceData.gender = "Unisex"
					}, label: {
						Text("Unisex")
							.gradientForeground(colors: [.blue, .pink])
					})
				}
				
				Menu("\(RaceData.relay)") {
					ForEach(scoreSettings) { race in
						Button(action: {
							RaceData.relay = race.raceType
						}, label: {
							Label(race.raceType, systemImage: race.imageName)
						})
					}
				}
				
				HStack {
					Text("Year")
					TextField("Year", text: $year)
						.keyboardType(.numberPad)
						.onAppear {
							year = String(RaceData.year)
						}
						.onSubmit {
							RaceData.year = Int(year) ?? 0
						}
					Spacer()
				}
			}
			Section(header: Text("Participants")) {
				ForEach(RaceData.participants) { participant in
					Text(participant.name)
				}
				.onDelete { indices in
					RaceData.participants.remove(atOffsets: indices)
				}
				HStack {
					TextField("New Participant", text: $newParticipant)
					Button(action: {
						withAnimation {
							let createdParticipant = Participant(id: UUID(), name: newParticipant, house: "", score: 0, position: 0, points: 0)
							RaceData.participants.append(createdParticipant)
							newParticipant = ""
						}
					}, label: {
						Image(systemName: "plus.circle.fill")
					})
						.disabled(newParticipant.isEmpty)
				}
			}
		}
		.listStyle(InsetGroupedListStyle())
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
		EditView(RaceData: .constant(Race.data[0].data), scoreSettings: Score.data)
    }
}
