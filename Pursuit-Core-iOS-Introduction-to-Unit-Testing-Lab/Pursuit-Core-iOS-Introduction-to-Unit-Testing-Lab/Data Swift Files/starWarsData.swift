//
//  starWarsData.swift
//  Pursuit-Core-iOS-Introduction-to-Unit-Testing-Lab
//
//  Created by Jaheed Haynes on 12/4/19.
//  Copyright © 2019 Jaheed Haynes. All rights reserved.
//

import Foundation

struct StarWarsFilmsData: Codable   {
    let results: [StarWarsFilms]
}

struct StarWarsFilms: Codable {
    let title: String
    let openingCrawl: String
   
    enum CodingKeys: String, CodingKey  {
        case title // already established before so theres no need to to re-cast
        case openingCrawl = "opening_crawl"
    }
}

//--------------------------------------------------------------------------------------

extension StarWarsFilmsData   {
    static func getFilms() -> [StarWarsFilms] {
        var films = [StarWarsFilms]()
        
        guard let sourceURL = Bundle.main.url(forResource: "starWars", withExtension: "json")
            else {
                fatalError()
        }
        
        do  {
            let data = try Data(contentsOf: sourceURL)
            let starWarsData = try JSONDecoder().decode(StarWarsFilmsData.self, from: data)
            
            films = starWarsData.results
        }
        catch   {
            fatalError()
        }
        return films
    }
}
