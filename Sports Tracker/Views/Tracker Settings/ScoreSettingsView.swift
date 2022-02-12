//
//  ScoreSettingsView.swift
//  Sports Tracker Mock
//
//  Created by Isaac Allport on 04/12/2021.
//

import SwiftUI

struct ScoreSettingsView: View {
	@Binding var Scores: [Score]
	@State var newRaceType: String = ""
	@Environment(\.scenePhase) var scenePhase
	let saveScoreAction: () -> Void
	
    var body: some View {
		List {
			ForEach(Scores) { score in
				NavigationLink(destination: {
					ScoreView(score: binding(for: score), saveScoreAction: {
						saveScoreAction()
					})
				}, label: {
					Label(score.raceType, systemImage: score.imageName)
				})
			}
			HStack {
				TextField("New Race Type Name", text: $newRaceType)
				Spacer()
				Button(action: {
					withAnimation {
						let newScore = Score(raceType: newRaceType, scoresForPosition: [], imageName: "person")
						Scores.append(newScore)
						newRaceType = ""
					}
				}, label: {
					Image(systemName: "plus.circle.fill")
				})
					.disabled(newRaceType.isEmpty)
			}
		}
		.navigationTitle("Scores Settings")
		.onChange(of: scenePhase) { phase in
			if phase == .inactive {
				saveScoreAction()
			}
		}
    }
	
	private func binding(for score: Score) -> Binding<Score> {
		guard let scoreIndex = Scores.firstIndex(where: { $0.id == score.id }) else {
			fatalError("Can't find scrum in array")
		}
		return $Scores[scoreIndex]
	}
}

struct ScoreSettingsView_Previews: PreviewProvider {
    static var previews: some View {
		ScoreSettingsView(Scores: .constant(Score.data), saveScoreAction: {})
    }
}
