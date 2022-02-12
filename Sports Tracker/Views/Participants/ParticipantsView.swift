//
//  ParticipantsView.swift
//  Sports Tracker Mock
//
//  Created by Isaac Allport on 04/12/2021.
//

import SwiftUI

struct ParticipantsView: View {
	@Binding var Races: [Race]
	@Environment(\.scenePhase) var scenePhase
	@State var sortDescriptor: String = ""
	
    var body: some View {
		List {
			ForEach(getParticipants()) { participant in
				Text(participant.name)
			}
		}
		.navigationTitle("Participants")
    }
}

extension ParticipantsView {
	// TODO: Add sorting and way of changing it
	private func getParticipants() -> [Participant] {
		var Participants: [Participant] = []
		for race in Races {
			for participant in race.participants {
				Participants.append(participant)
			}
		}
		return Participants
	}
}

struct ParticipantsView_Previews: PreviewProvider {
    static var previews: some View {
		ParticipantsView(Races: .constant(Race.data))
    }
}
