//
//  WindyService.swift
//  WindyDataSDK
//
//  Created by ait belarbi mohamed amine on 16/01/2021.
//

import Foundation
import Alamofire

public final class WindyService {
    
    private var host: String = "http://geodb-free-service.wirefreethought.com/v1/geo/cities?limit=5&offset=0&namePrefix="
    
    private var apiKey = "cbc6b22ef31b876b2374e0c3530eefb7"
    public init() {}
    
    public func getCities(prefix: String,
                   success: @escaping ((CitiesModel?) -> Void),
                   errorCompilation: (() -> Void)? = nil) {
        let url: String = "\(host)\(prefix)"
        AF.request(url,
                   method: .get)
            .responseDecodable(of: CitiesModel.self,
                               completionHandler: { response in
                                success(response.value)
            })
    }
}
