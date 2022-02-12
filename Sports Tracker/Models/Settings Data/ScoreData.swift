//
//  ScoreData.swift
//  Sports Tracker Mock
//
//  Created by Isaac Allport on 04/12/2021.
//

import Foundation

class ScoreData: ObservableObject {
	
	private static var documentsFolder: URL {
		do {
			return try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
		} catch {
			fatalError("Can't find documents directory.")
		}
	}
	
	private static var fileURL: URL {
		return documentsFolder.appendingPathComponent("tracker.score.settings.data")
	}
	
	@Published var Scores: [Score] = []
	
	func load() {
		DispatchQueue.global(qos: .background).async { [weak self] in
			guard let data = try? Data(contentsOf: Self.fileURL) else {
				#if DEBUG
				DispatchQueue.main.async {
					self?.Scores = Score.data
				}
				#endif
				return
			}
			guard let loadedScores = try? JSONDecoder().decode([Score].self, from: data) else {
				fatalError("Can't decode saved scrum data.")
			}
			DispatchQueue.main.async {
				self?.Scores = loadedScores
			}
		}
	}
	
	func save() {
		DispatchQueue.global(qos: .background).async { [weak self] in
			guard let Scores = self?.Scores else { fatalError("Self out of scope") }
			guard let data = try? JSONEncoder().encode(Scores) else { fatalError("Error encoding data") }
			do {
				let outfile = Self.fileURL
				try data.write(to: outfile)
			} catch {
				fatalError("Can't write to file")
			}
		}
	}
}
