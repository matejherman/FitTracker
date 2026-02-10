//
//  Exercise.swift
//  fittracker
//
//  Created by Matěj Heřman on 08.02.2026.
//
//

import Foundation

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

struct Exercise: Identifiable, Encodable {
    
    
    let exerciseId : String
    let name : String
    let gifUrl : String
    let targetMuscles : [String]
    let bodyParts : [String]
    let equipments : [String]
    let secondaryMuscles : [String]
    let instructions : [String]
    var id: String {exerciseId}
    
}

extension Exercise : Decodable {
    
    enum CodingKeys: CodingKey {
        case exerciseId
        case name
        case gifUrl
        case targetMuscles
        case bodyParts
        case equipments
        case secondaryMuscles
        case instructions
    }
    
    init(from decoder : any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.exerciseId = try container.decode(String.self, forKey: .exerciseId)
        self.name = try container.decode(String.self, forKey: .name)
        self.gifUrl = try container.decode(String.self, forKey: .gifUrl)
        self.targetMuscles = try container.decode([String].self, forKey: .targetMuscles)
        self.bodyParts = try container.decode([String].self, forKey: .bodyParts)
        self.equipments = try container.decode([String].self, forKey: .equipments)
        self.secondaryMuscles = try container.decode([String].self, forKey: .secondaryMuscles)
        self.instructions = try container.decode([String].self, forKey: .instructions)
    }
}
