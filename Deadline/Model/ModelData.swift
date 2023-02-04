//
//  ModelData.swift
//  Deadline
//
//  Created by Matthew Seah on 1/29/23.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var user: User = load("userData.json")
    @Published var milestones: [Milestone] = load("milestoneData.json")
    
    func addMilestone(startDate: Date, endDate: Date, title: String, isFavorite: Bool) {
        let newMilestone = Milestone(startDate: startDate, endDate: endDate, title: title, isFavorite: isFavorite)
        milestones.append(newMilestone)
        milestones.sort(by: { $0.endDate.compare($1.endDate) == .orderedDescending })
    }

    func removeMilestone(id: String) {
        if let index = milestones.firstIndex(where: { $0.id == id}) {
            milestones.remove(at: index)
        }
    }
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in the main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
