//
//  ScoreView.swift
//  Sports Tracker Mock
//
//  Created by Isaac Allport on 04/12/2021.
//

import SwiftUI

struct ScoreView: View {
	@Binding var score: Score
	@State var isPresented: Bool = false
	@State private var data: Score.Data = Score.Data()
	let saveScoreAction: () -> Void
    var body: some View {
		List {
			Section("Race Type Info") {
				HStack {
					Text(score.raceType)
					Spacer()
					Text("Relay name")
				}
				HStack {
					Text("Image name")
					Spacer()
					Image(systemName: score.imageName)
				}
			}
			
			Section("Points For Position") {
				HStack {
					Text("Points awarded")
					Spacer()
					Text("Position")
				}
				ForEach(score.scoresForPosition, id: \.self) { scoreForPosition in
					HStack {
						Text(String(scoreForPosition))
						Spacer()
						Text(getPosition(item: scoreForPosition))
					}
				}
			}
		}
		.navigationTitle(score.raceType)
		.navigationBarItems(trailing: Button(action: {
			isPresented = true
			data = score.data
		}, label: {
			Text("Edit")
		}))
		.fullScreenCover(isPresented: $isPresented) {
			NavigationView {
				EditScoreView(scoreData: $data)
					.navigationTitle(score.raceType)
					.navigationBarItems(leading: Button("Cancel") {
						isPresented = false
					}, trailing: Button("Done") {
						isPresented = false
						score.update(from: data)
					})
			}
		}
    }
	
	func getPosition(item: String) -> String {
		var index: Int = score.scoresForPosition.firstIndex(of: item) ?? 0
		index += 1
		return String(index)
	}
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
		ScoreView(score: .constant(Score.data[0]), saveScoreAction: {})
    }
}
