//
//  HomeEndpoint.swift
//  my_movies
//
//  Created by Savyo Brenner on 16/09/22.
//

import Alamofire

enum HomeEndpoint: RouterConfig {
    case popularMovies
    
    var endPoint: String {
        switch self {
        case .popularMovies:
            return "popular?"
        }
    }
    
    var parametersPath: String {
        switch self {
        case .popularMovies:
            return "api_key=\(EnviromentURL.apiKey.rawValue)&language=\(EnviromentURL.language.rawValue)&page=\(EnviromentURL.page.rawValue)"
        }
    }
    
    var params: APIParams {
        switch self {
        case .popularMovies:
            return [:]
        }
    }
    
    var headers: APIHeaders {
        switch self {
        case .popularMovies:
            return [:]
        }
    }
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .popularMovies:
            return .get
        }
    }
}
