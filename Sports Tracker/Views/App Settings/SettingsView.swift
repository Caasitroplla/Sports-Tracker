//
//  SettingsView.swift
//  Sports Tracker Mock
//
//  Created by Isaac Allport on 05/12/2021.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
		List {
			Text("Reset to default data")
			Text("Change app accent color")
			
			Section("Info") {
				Text("This app was built by Isaac Allport for Chipping Campend School sports department. This application can be licenced to any school however the default data is only applicable to Chipping Campden School.")
					.font(.caption)
			}
		}
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
