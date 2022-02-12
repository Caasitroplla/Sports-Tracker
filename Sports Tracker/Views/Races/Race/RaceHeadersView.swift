//
//  RaceHeadersView.swift
//  Sports Tracker Mock
//
//  Created by Isaac Allport on 05/12/2021.
//

import SwiftUI

struct RaceHeadersView: View {
    var body: some View {
		HStack {
			VStack {
				HStack {
					Text("Name")
						.font(.headline)
					Spacer()
				}
				HStack {
					Text("House")
					Spacer()
				}
			}
			Spacer()
			Text("Points")
				.foregroundColor(.gray)
			Spacer()
			VStack {
				HStack {
					Spacer()
					Text("Position")
				}
				HStack {
					Spacer()
					Text("Score")
				}
			}
		}
    }
}

struct RaceHeadersView_Previews: PreviewProvider {
    static var previews: some View {
		List {
			RaceHeadersView()
		}
    }
}
