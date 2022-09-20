//
//  ContentView.swift
//  Korean Dishes
//
//  Created by Joshua Oh on 6/14/22.
//

import SwiftUI
import UIKit
import WikipediaKit

struct ContentView: View {
    let wikipedia = Wikipedia()

    var body: some View {


        TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
            FeaturedView().tabItem {
                VStack{
                    Image(systemName: "star.fill")
                    Text("Featured")
                }
            }.tag(1)
            ListView(dishes: data).tabItem {
                VStack {
                    Image(systemName: "list.bullet")
                    Text("List View")
                }
            }.tag(2)
           SettingsView().tabItem {
                VStack {
                    Image(systemName: "gearshape")
                    Text("Settings")
                }
            }.tag(3)
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(DishData())
    }
}
