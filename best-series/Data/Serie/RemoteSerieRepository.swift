//
//  RemoteSerieRepository.swift
//  best-series
//
//  Created by Lucas de Oliveira on 10/20/19.
//  Copyright © 2019 Lucas de Oliveira. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class RemoteSerieRepository: SerieRepository {
    func getBestSeriesList(page: Int, and onCompletion: @escaping (SerieListEntity?) -> Void, onError: @escaping () -> Void) {
        let path = API_BASE_URL + "/discover/tv"
        
        let parameters: Parameters = [
            "api_key": API_KEY,
            "sort_by": "popularity.desc",
            "page": page
        ]
        
        Alamofire.request(path, parameters: parameters).debugLog().responseJSON { response in
            if(response.response?.statusCode == 200){
                guard let result = response.result.value else {
                    onError()
                    return
                }
                
                let serieList = Mapper<SerieListEntity>().map(JSONObject: result)
                onCompletion(serieList)
            } else {
                onError()
            }
        }
    }
    
    func getSerieDetail(serieId: Int, and onCompletion: @escaping (SerieEntity?) -> Void, onError: @escaping () -> Void) {
        let path = API_BASE_URL + "/tv/" + String(serieId)
        
        let parameters: Parameters = [
            "api_key": API_KEY
        ]
        
        Alamofire.request(path, parameters: parameters).debugLog().responseJSON { response in
            if(response.response?.statusCode == 200){
                guard let result = response.result.value else {
                    onError()
                    return
                }
                
                let serieDetail = Mapper<SerieEntity>().map(JSONObject: result)
                onCompletion(serieDetail)
            } else {
                onError()
            }
        }
    }
    
    func getSimilarSeries(id: Int, and onCompletion: @escaping (SerieListEntity?) -> Void, onError: @escaping () -> Void) {
        
    }
}

extension Request {
    public func debugLog() -> Self {
        #if DEBUG
            debugPrint("=======================================")
            debugPrint(self)
            debugPrint("=======================================")
        #endif
        return self
    }
}
