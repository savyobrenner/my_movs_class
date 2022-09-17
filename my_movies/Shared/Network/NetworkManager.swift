//
//  NetworkManager.swift
//  my_movies
//
//  Created by Savyo Brenner on 16/09/22.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static let sharedInstance = NetworkManager()
    
    private lazy var manager: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        let manager = Alamofire.Session(configuration: configuration)
        return manager
    }()
    
    func request(request: MovsRouter, expectedType: Codable.Type, completion: @escaping (Codable) -> Void) {
        
        manager.request(request).responseJSON { (json: AFDataResponse<Any>) in
            guard let urlData = json.data else { return }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .useDefaultKeys
                let decodedData = try decoder.decode(expectedType.self, from: urlData)
                completion(decodedData)
                
            } catch {
                print("Error durante a requisição")
            }
        }

    }
}
