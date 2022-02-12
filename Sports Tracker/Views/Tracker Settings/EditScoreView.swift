//
//  EditScoreView.swift
//  Sports Tracker Mock
//
//  Created by Isaac Allport on 05/12/2021.
//

import SwiftUI

struct EditScoreView: View {
	@Binding var scoreData: Score.Data
    var body: some View {
		List {
			Section("Scotr info") {
				HStack {
					TextField("Relay name", text: $scoreData.raceType)
					Spacer()
					Text("Relay name")
				}
				HStack {
					Menu("Image Name") {
						Button(action: {
							scoreData.imageName = "person.3"
						}, label: {
							Label("person.3", systemImage: "person.3")
						})
						Button(action: {
							scoreData.imageName = "person"
						}, label: {
							Label("person", systemImage: "person")
						})
					}
					Spacer()
					Image(systemName: scoreData.imageName)
				}
			}
			Section("Scores for positions") {
				HStack {
					Text("Score")
					Spacer()
					Text("Position")
				}
				ForEach(scoreData.scoresForPosition, id: \.self) { points in
					HStack {
						TextField("Score", text: $scoreData.scoresForPosition[scoreData.scoresForPosition.firstIndex(of: points)!])
						Spacer()
						Text(getPosition(item: points))
					}
				}
				Button(action: {
					scoreData.scoresForPosition.append("0")
				}, label: {
					Label("New score for position", systemImage: "plus.circle.fill")
				})
			}
		}
    }
	
	func getPosition(item: String) -> String {
		var index: Int = scoreData.scoresForPosition.firstIndex(of: item) ?? 0
		index += 1
		return String(index)
	}
}

struct EditScoreView_Previews: PreviewProvider {
    static var previews: some View {
		EditScoreView(scoreData: .constant(Score.data[0].data))
    }
}
