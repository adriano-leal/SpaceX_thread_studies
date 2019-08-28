//
//  NetworkLayer.swift
//  SpaceX_threads
//
//  Created by Adriano Ramos on 28/08/19.
//  Copyright © 2019 Adriano Ramos. All rights reserved.
//

import Foundation

class NetworkLayer {
    
    let apiURL: String = "https://api.spacexdata.com/v3/launches"
    var rocket:[Rocket] = []
    
    let dispatchGroup = DispatchGroup()
    
    func fetchData(completion: @escaping () -> Void) {
        guard let url = URL(string: apiURL) else { return }
        URLSession.shared.dataTask(with: url) { (data, urlSession, err) in
            if let err = err { print(err) }
            guard let data = data else { return }
            do {
                
                let theRocket = try JSONDecoder().decode(Rocket.self, from: data)
                self.rocket.append(theRocket)
                
                completion()
//                self.dispatchGroup.leave()
                
            } catch let err {
                print(err)
            }
        }.resume()
    }
    
    
    func getImages(data: Data, completion: @escaping () -> Void) {
    }
    
}
