//
//  RaceView.swift
//  Sports Tracker Mock
//
//  Created by Isaac Allport on 04/12/2021.
//

import SwiftUI

struct RaceView: View {
	@State private var data: Race.Data = Race.Data()
	@Binding var race: Race
	@State var isPresenting: Bool = false
	var houseSettings: [House]
	var scoreSettings: [Score]
	
	let saveAction: () -> Void
	
    var body: some View {
		List {
			RaceHeadersView()
			ForEach(race.participants) { participant in
				RaceRowView(Participant: participant, houseSettings: houseSettings, scoreSettings: scoreSettings, relayType: race.relay) {
					saveAction()
				}
			}
		}
		.navigationTitle(race.name)
		.navigationBarItems(trailing:
			Button(action: {
				isPresenting = true
				data = race.data
			}, label: {
				Text("Edit")
			})
		)
		.fullScreenCover(isPresented: $isPresenting) {
			NavigationView {
				EditView(RaceData: $data, scoreSettings: scoreSettings)
					.navigationBarItems(leading:Button(action: {
						isPresenting = false
					}, label: {
						Text("Cancel")
					}), trailing: Button(action: {
						isPresenting = false
						race.update(from: data)
					}, label: {
						Text("Done")
					}))
					.navigationTitle(race.name)
			}
		}
    }
	
	private func binding(for participant: Participant) -> Binding<Participant> {
		guard let participantIndex = race.participants.firstIndex(where: { $0.id == participant.id }) else {
			fatalError("Can't find scrum in array")
		}
		return $race.participants[participantIndex]
	}
}

struct RaceView_Previews: PreviewProvider {
    static var previews: some View {
		RaceView(race: .constant(Race.data[0]), houseSettings: House.data, scoreSettings: Score.data, saveAction: {})
    }
}
