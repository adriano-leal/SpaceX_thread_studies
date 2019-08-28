//
//  HomeViewModel.swift
//  SpaceX_threads
//
//  Created by Adriano Ramos on 27/08/19.
//  Copyright © 2019 Adriano Ramos. All rights reserved.
//

import Foundation


class HomeViewModel {
    
    var networkLayer: NetworkLayer = NetworkLayer()
    var dispatchGroup = DispatchGroup()
    
    
    func getRockets() {
        dispatchGroup.enter()
        networkLayer.fetchData {
            print("Im here")
            self.dispatchGroup.leave()
        }
    }
    
    func getFlightNumber(pos: Int) -> String {
        return networkLayer.rocket[pos].flightNumber.description
    }
    
    func getDetails(pos: Int) -> String {
        return networkLayer.rocket[pos].details ?? "No data provided."
    }
    
    func getMissionId(pos: Int) -> [String] {
        return networkLayer.rocket[pos].missionID
    }
    
    func getRocketName(pos: Int) -> String {
        return networkLayer.rocket[pos].rocket.rocketName
    }
    
    func getLaunchDate(pos: Int) -> String {
        return networkLayer.rocket[pos].launchDateUTC
    }
}
