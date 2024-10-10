//
//  MovieAPITarget.swift
//  TCAMovie
//
//  Created by 정의찬 on 10/6/24.
//

import Foundation
import Moya

enum MovieAPITarget {
    case getMovieList(list: Int, value: String)
}

extension MovieAPITarget: TargetType {
    
    
    var baseURL: URL {
        return URL(string: "https://yts-proxy.now.sh")!
    }
    
    var path: String {
        switch self {
        case .getMovieList:
            return "/list_movies.json"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getMovieList:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getMovieList(let count, let value):
            return .requestParameters(parameters: ["list": count, "sort_by": value], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
}
