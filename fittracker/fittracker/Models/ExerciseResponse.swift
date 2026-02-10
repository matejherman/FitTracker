//
//  ExerciseResponse.swift
//  fittracker
//
//  Created by Matěj Heřman on 09.02.2026.
//

import Foundation

struct ExerciseResponse: Decodable {
    
    let success: Bool
    let data: [Exercise]
}
