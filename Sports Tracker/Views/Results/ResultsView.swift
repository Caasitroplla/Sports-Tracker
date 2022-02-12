//
//  ResultsView.swift
//  Sports Tracker Mock
//
//  Created by Isaac Allport on 04/12/2021.
//

import SwiftUI

struct ResultsView: View {
	@Binding var Races: [Race]
    var body: some View {
		VStack {
			Text(calculateHousePoints(house: "Fereby"))
				.font(.system(size: 128))
				.foregroundColor(.blue)
			Text("Fereby")
				.font(.headline)
			
			Spacer()
			
			Text(calculateHousePoints(house: "Hicks"))
				.font(.system(size: 128))
				.foregroundColor(.red)
			Text("Hicks")
				.font(.headline)
			
			Spacer()
			
			Text(calculateHousePoints(house: "Townsend"))
				.font(.system(size: 128))
				.foregroundColor(.green)
			Text("Townsend")
				.font(.headline)
		}
    }
}

extension ResultsView {
	func calculateHousePoints(house: String) -> String {
		var total: Int = 0
		for race in Races {
			for participant in race.participants {
				if participant.house == house {
					total += participant.points
				}
			}
		}
		return String(total)
	}
}


struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
		ResultsView(Races: .constant(Race.data))
    }
}
