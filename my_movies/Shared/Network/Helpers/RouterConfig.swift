//
//  RouterConfig.swift
//  my_movies
//
//  Created by Savyo Brenner on 16/09/22.
//

import Foundation
import Alamofire

typealias APIParams = [String: Any]?
typealias APIHeaders = [String: String]?

protocol RouterConfig: URLRequestConvertible {
    
    var endPoint: String { get }
    
    var url: URL { get }
    
    var params: APIParams { get }
    
    var headers: APIHeaders { get }
    
    var method: HTTPMethod { get }
    
    var parametersPath: String { get }
    
}

enum EnviromentURL: String {
    case baseUrl = "https://api.themoviedb.org/3/movie/"
    case apiKey = "b621e030f5e5548ff84999cf7b668c13"
    case language = "en-US"
    case page = "1"
}

extension RouterConfig {
    var baseURL: String {
        return EnviromentURL.baseUrl.rawValue
    }
    
    var url: URL {
        return URL(string: "\(baseURL)/\(endPoint)/\(parametersPath)")!
    }
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = headers
        return try URLEncoding.default.encode(urlRequest, with: params)
    }
}
