//
//  jokeData.swift
//  Pursuit-Core-iOS-Introduction-to-Unit-Testing-Lab
//
//  Created by Jaheed Haynes on 12/4/19.
//  Copyright © 2019 Jaheed Haynes. All rights reserved.
//

import Foundation

struct JokesData: Decodable  {
    let id: Int
    let type: String
    let setup: String
    let punchline: String
    
    static func getJokes() -> [JokesData]  {
        
        var jokes = [JokesData]()
        
        guard let sourceURL = Bundle.main.url(forResource: "joke", withExtension: "json")
            else    {
                fatalError()
        }
        
        do  {
            let data = try Data(contentsOf: sourceURL)
            let jokeData = try JSONDecoder().decode([JokesData].self, from: data)
            jokes = jokeData
            
        } catch {
            fatalError()
        }
        
        return jokes
    }
}
