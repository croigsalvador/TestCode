//
//  TripNetworkProviderImpl.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 4/1/24.
//

import Foundation
import Combine

struct TripNetworkProviderImpl: TripNetworkProvider {
    
    let session: URLSession
    
    func fetchtTrips() -> AnyPublisher<[TripApiModel], Error> {
        session.dataTaskPublisher(for: TripRouter.fetchTrips.request)
            .map({ data, response in
                if let jsonString = String(data: data, encoding: .utf8) {
                       print("JSON String: \(jsonString)")
                   }
                   return data
                print("Response \(response) \(data)")
                return data
            }).tryMap { data -> [TripApiModel] in
                do {
                    return try JSONDecoder().decode([TripApiModel].self, from: data)
                } catch {
                    print("Decoding error: \(error)")
                    throw error
                }
            }
               .receive(on: DispatchQueue.main)
               
               .eraseToAnyPublisher()
    }
}
