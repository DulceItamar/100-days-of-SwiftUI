//
//  Mission.swift
//  Moonshot
//
//  Created by Dulce Itamar Vigueras Ballesteros on 13/08/23.
//

import Foundation




struct Mission: Codable, Identifiable {
    
    struct CrewRole: Codable{
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo\(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var formattedLauchDate: String {
                let formatter = DateFormatter()
                formatter.dateStyle = .medium
                formatter.locale = Locale(identifier: "US")
        
        return formatter.string(for: launchDate) ?? "N/A"

//        return launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
    
    var largeFormattedLaunchDate: String {

        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.locale = Locale(identifier: "US")

        return formatter.string(for: launchDate) ?? "N/A"
        
//        return launchDate?.formatted(date: .long, time: .omitted) ?? "N/A"
    }
}
