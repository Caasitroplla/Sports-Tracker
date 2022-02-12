//
//  HouseSettingsView.swift
//  Sports Tracker Mock
//
//  Created by Isaac Allport on 04/12/2021.
//

import SwiftUI

struct HouseSettingsView: View {
	@Binding var Houses: [House]
	@State var newHouse: String = ""
	@Environment(\.scenePhase) var scenePhase
	let saveHouseAction: () -> Void
    var body: some View {
		List {
			ForEach(Houses) { house in
				HStack {
					TextField("House", text: $Houses[Houses.firstIndex(of: house)!].name)
					Spacer()
					ColorPicker("", selection: $Houses[Houses.firstIndex(of: house)!].color)
				}
			}
			.onDelete { IndexSet in
				Houses.remove(atOffsets: IndexSet)
			}
			HStack {
				TextField("New House", text: $newHouse)
				Button(action: {
					withAnimation {
						let createdHouse = House(name: newHouse, color: .random)
						Houses.append(createdHouse)
						newHouse = ""
					}
				}, label: {
					Image(systemName: "plus.circle.fill")
				})
					.disabled(newHouse.isEmpty)
			}
		}
		.navigationTitle("House Settings")
		.onChange(of: scenePhase) { phase in
			if phase == .inactive { saveHouseAction() }
		}
    }
}

struct HouseSettingsView_Previews: PreviewProvider {
    static var previews: some View {
		HouseSettingsView(Houses: .constant(House.data), saveHouseAction: {})
    }
}
