//
//  Rocket.swift
//  SpaceX_threads
//
//  Created by Adriano Ramos on 27/08/19.
//  Copyright © 2019 Adriano Ramos. All rights reserved.
//   let rocket = try? newJSONDecoder().decode(Rocket.self, from: jsonData)

import Foundation

// MARK: - RocketElement
struct RocketElement: Codable {
    let flightNumber: Int
    let missionName: String
    let missionID: [String]
    let launchYear: String
    let launchDateUTC: String
    let launchDateLocal: Date
    let rocket: RocketClass
    let ships: [String]
    let launchSuccess: Bool?
    let links: Links
    
    enum CodingKeys: String, CodingKey {
        case flightNumber = "flight_number"
        case missionName = "mission_name"
        case missionID = "mission_id"
        case launchYear = "launch_year"
        case launchDateUTC = "launch_date_utc"
        case launchDateLocal = "launch_date_local"
        case rocket, ships
        case launchSuccess = "launch_success"
        case links
    }
}

struct Links: Codable {
    let flickrImages: [String]
    
    enum CodingKeys: String, CodingKey {
        case flickrImages = "flickr_images"
    }
}

struct RocketClass: Codable {
    let rocketID: String
    let rocketName: String
    
    enum CodingKeys: String, CodingKey {
        case rocketID = "rocket_id"
        case rocketName = "rocket_name"
    }
}
