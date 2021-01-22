//
//  CitiesModel.swift
//  WindyData
//
//  Created by ait belarbi mohamed amine on 16/01/2021.
//

import Foundation

public struct CitiesModel: Decodable {
    public let cities: [CityModel]?
    
    init(cities: [CityModel]) {
        self.cities = cities
    }
    
    enum CodingKeys: String, CodingKey {
        case cities = "data"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        cities = try container.decode([CityModel].self, forKey: .cities)
    }
}


public struct CityModel: Decodable {
    public let name: String
    public let country: String
    public let countryCode: String
    public let latitude: Double
    public let longitude: Double
    
    init(name: String,
         country: String,
         countryCode: String,
         latitude: Double,
         longitude: Double) {
        self.name = name
        self.country = country
        self.countryCode = countryCode
        self.latitude = latitude
        self.longitude = longitude
    }
    
    enum CodingKeys: String, CodingKey {
        case name, country, countryCode, latitude, longitude
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        country = try container.decode(String.self, forKey: .country)
        countryCode = try container.decode(String.self, forKey: .countryCode)
        latitude = try container.decode(Double.self, forKey: .latitude)
        longitude = try container.decode(Double.self, forKey: .longitude)
    }
}
