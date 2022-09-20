import SwiftUI
import WikipediaKit

extension String {
    func load() -> UIImage {
        do {
            guard let url = URL(string: self) else {
                return UIImage()
            }
            let data: Data = try
                Data(contentsOf: url, options: .uncached)
            return UIImage(data: data) ?? UIImage()
        } catch {
            return UIImage()
        }
        
    }
}

struct DishView: View {
    let language = WikipediaLanguage("en")
    @State private var description = ""
    @State private var descriptionImage = ""
    @EnviromentObject var dishData: DishData
    var dishes: dish
    
    var dishIndex: Int {
        dishData.dishes.firstIndex(where: { $0.id == dishes.id })!
    }
    
    var body: some View {
        let _ = Wikipedia.shared.requestOptimizedSearchResults(language: language, term: dishes.englishName) { (searchResults, error) in
            guard error == nil else {return}
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
     
        
        VStack {
            Image(uiImage: descriptionImage.load())
                .resizable
                .aspectRatio(contentMode: .fit)
                .padding([.top, .leading, .trailing])
                .cornerRadius(10)
            ScrollView {
                VStack(alignment: .center){
                    HStack {
                        Text(dishes.englishName)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        FavoriteButton(isSet: $dishData.dishes[dishIndex].favorite)
                    }
                    Text(dishes.koreanName)
                        .font(.title3)
                        .padding(.bottom)
                        Text(description)
                            .padding()
                }
            }
            .padding
            .navigationTitle(dishes.englishName)
            .navigationBarTitleDisplayMode(.inline)
        }
        .background()
        
    }
}

struct DishView_Previews: PreviewProvider {
    
    static var dishData = DishData()
    
    static var previews: some View {
        DishView(dishes: DishData().dishes[0])
            .environmentObject(dishData)

    }
}

 
