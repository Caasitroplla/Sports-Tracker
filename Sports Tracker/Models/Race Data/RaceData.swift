//
//  RaceData.swift
//  Sports Tracker Mock
//
//  Created by Isaac Allport on 04/12/2021.
//

import Foundation

class RaceData: ObservableObject {
	
	private static var documentsFolder: URL {
		do {
			return try FileManager.default.url(for: .documentDirectory,
											   in: .userDomainMask,
											   appropriateFor: nil,
											   create: false)
		} catch {
			fatalError("Can't find documents directory.")
		}
	}
	
	private static var fileURL: URL {
		 return documentsFolder.appendingPathComponent("races.data")
	 }
	
	@Published var Races: [Race] = []
	
	func load() {
		DispatchQueue.global(qos: .background).async { [weak self] in
			guard let data = try? Data(contentsOf: Self.fileURL) else {
				#if DEBUG
				DispatchQueue.main.async {
					self?.Races = Race.data
				}
				#endif
				return
			}
			guard let loadingRaces = try? JSONDecoder().decode([Race].self, from: data) else {
				fatalError("Can't decode saved scrum data.")
			}
			DispatchQueue.main.async {
				self?.Races = loadingRaces
			}
		}
	}
	
	func save() {
		DispatchQueue.global(qos: .background).async { [weak self] in
			guard let Races = self?.Races else { fatalError("Self out of scope") }
			guard let data = try? JSONEncoder().encode(Races) else { fatalError("Error encoding data") }
			do {
				let outfile = Self.fileURL
				try data.write(to: outfile)
			} catch {
				fatalError("Can't write to file")
			}
		}
	}
	
}
