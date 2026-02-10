//
//  APIManager.swift
//  fittracker
//
//  Created by Matěj Heřman on 08.02.2026.
//

import Foundation
import Observation
import SwiftUI

//{
//  "success": true,
//  "metadata": {
//    "totalExercises": 150,
//    "totalPages": 15,
//    "currentPage": 1,
//    "previousPage": "/api/exercises?offset=0&limit=10",
//    "nextPage": "/api/exercises?offset=20&limit=10"
//  },
//  "data": [
//    {
//      "exerciseId": "string",
//      "name": "string",
//      "gifUrl": "string",
//      "targetMuscles": [
//        "string"
//      ],
//      "bodyParts": [
//        "string"
//      ],
//      "equipments": [
//        "string"
//      ],
//      "secondaryMuscles": [
//        "string"
//      ],
//      "instructions": [
//        "string"
//      ]
//    }
//  ]
//}

@Observable
final class APIManager {
    
    var exercises: [Exercise] = []
    
    @MainActor
    func fetchByExercise(Exercise: String) async {
        
        var components = URLComponents(string: "https://exercisedb.dev/api/v1/exercises/search")
        components?.queryItems = [
            URLQueryItem(name: "q", value: Exercise),
            URLQueryItem(name: "offset", value: "0"),
            URLQueryItem(name: "limit", value: "10")
        ]
        
        guard let url = components?.url else { return }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.timeoutInterval = 60
    
        do {
            
            let(data, response) = try await URLSession.shared.data(for: urlRequest)
            
            print("[DATA]: \(data, default: "null")")
            print("[RESPONSE]: \(response, default: "null")")
            
            let decodedResponse = try JSONDecoder().decode(ExerciseResponse.self, from: data)
            self.exercises = decodedResponse.data
            print("[TOTAL EXERCISES]: \(self.exercises.count, default: "null")")
            
            printExercises()
            
        } catch {
            print("[ERROR]: \(error, default: "null")")
        }
        
    }
    
    func printExercises() {
        
        for exercise in exercises {
            print(exercise.name)
            print(exercise.gifUrl)
        }

    }
}
