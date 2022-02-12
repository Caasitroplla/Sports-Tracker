//
//  CardView.swift
//  Sports Tracker Mock
//
//  Created by Isaac Allport on 04/12/2021.
//

import SwiftUI

struct CardView: View {
	var Race: Race
	var scoreSettings: [Score]
    var body: some View {
		HStack {
			Text(Race.name)
				.font(.headline)
			Spacer()
			ForEach(scoreSettings) { raceType in
				if raceType.raceType == Race.relay {
					if Race.gender.lowercased() == "male" {
						Image(systemName: raceType.imageName)
							.foregroundColor(.blue)
					} else if Race.relay.lowercased() == "female" {
						Image(systemName: raceType.imageName)
							.foregroundColor(.pink)
					} else {
						Image(systemName: raceType.imageName)
							.gradientForeground(colors: [.blue, .pink])
					}
				}
			}
		}
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
		CardView(Race: Race(name: "100m", relay: "c", gender: "Male", year: 9, participants: []), scoreSettings: Score.data)
			.previewLayout(.sizeThatFits)
    }
}

extension View {
	// Enables the gradients for unisex races
	public func gradientForeground(colors: [Color]) -> some View {
		self.overlay(LinearGradient(gradient: .init(colors: colors),
									startPoint: .topLeading,
									endPoint: .bottomTrailing))
			.mask(self)
	}
}
