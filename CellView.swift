//
//  CellView.swift
//  Korean Dishes
//
//  Created by Joshua Oh on 8/5/22.
//

import SwiftUI
import WikipediaKit

struct CellView: View {
    var dishes: dish
    
    @State private var description = ""
    @State private var descriptionImage = ""
    @EnvironmentObject var dishData: DishData



    var body: some View {
        let _ = Wikipedia.shared.requestOptimizedSearchResults(language: WikipediaLanguage("en"), term: dishes.englishName) { (searchResults, error) in

            guard error == nil else { return }
            guard let searchResults = searchResults else { return }
            self.description.removeAll()
            self.descriptionImage.removeAll()
            for articlePreview in searchResults.items {
                if let image = articlePreview.imageURL {
                    descriptionImage.append("\(image)")
                }
                description.append(articlePreview.displayText)
                break
            }
        }
        
        NavigationLink(destination: DishView(dishes: dishes)) {
            HStack{
                Image(uiImage: descriptionImage.load())
                    .resizable()
                    .scaledToFit()
                    .scaledToFill()
                    .frame(width: 75, height: 50)
                    .cornerRadius(3.0)
                
                VStack(alignment: .leading){
                    Text(dishes.englishName)
                    Text(dishes.koreanName)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                Spacer()
                if dishes.favorite {
                    Image(systemName: "star.fill")
                }
            }
            
        }

        .padding()
        
    }
}

struct CellView_Previews: PreviewProvider {
    
    static var dishes = DishData().dishes
    
    static var previews: some View {
        CellView(dishes: data[0])
    }
}
