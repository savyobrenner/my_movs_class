//
//  MovsRouter.swift
//  my_movies
//
//  Created by Savyo Brenner on 16/09/22.
//

import Foundation
import Alamofire

enum MovsRouter: URLRequestConvertible {
    case homeEndpoint(route: HomeEndpoint)
    
    func getRoute() -> RouterConfig {
        switch self {
        case .homeEndpoint(let route):
            return route
        }
    }
    
    func hasHeaders() -> Bool {
        return getHeaders() != nil
    }

    func getHeaders() -> APIHeaders {
        return getRoute().headers
    }

    func getParams() -> APIParams {
        return getRoute().params
    }

    func asURLRequest() throws -> URLRequest {
        return try getRoute().asURLRequest()
    }
}

