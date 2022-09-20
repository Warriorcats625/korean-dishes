//
//  Korean_DishesApp.swift
//  Korean Dishes
//
//  Created by Joshua Oh on 6/14/22.
//

import SwiftUI
import WikipediaKit

@main
struct Korean_DishesApp: App {
    @StateObject private var dishdata = DishData()
    
    init() {
        WikipediaNetworking.appAuthorEmailForAPI = "jjoh858@icloud.com"
    }
    
    let wikipedia = Wikipedia()
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
