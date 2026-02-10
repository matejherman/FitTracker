//
//  ContentView.swift
//  fittracker
//
//  Created by Matěj Heřman on 08.02.2026.
//

import SwiftUI

struct ContentView: View {
    
    let apiManager = APIManager()
    
    var body: some View {
        VStack {
            
            Text("Zde se stahuji cviky")
        }
        .padding()
        .task{
            await apiManager.fetchByExercise(Exercise: "bench press")
        }
    }
}

#Preview {
    
    ContentView()
}
