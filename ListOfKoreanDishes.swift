//
//  ListOfKoreanDishes.swift
//  Korean Dishes
//
//  Created by Joshua Oh on 6/14/22.
//

import Foundation
import SwiftUI
import Combine


struct dish: Identifiable {
    var id: Int
    var englishName: String
    var koreanName: String
    var favorite: Bool
}

let data = [
    dish.init(id: 1001, englishName: "Bibimbap", koreanName: "비빔밥", favorite: true),
    dish.init(id: 1002, englishName: "Baechu Kimchi", koreanName: "배추김치", favorite: false),
    dish.init(id: 1003, englishName: "Kkakdugi", koreanName: "깍두기", favorite: false),
    dish.init(id: 1004, englishName: "Baek Kimchi", koreanName: "백김치", favorite: false),
    dish.init(id: 1005, englishName: "Budae Jjigae", koreanName: "부대찌개", favorite: false),
    dish.init(id: 1006, englishName: "Bulgogi", koreanName: "불고기", favorite: false),
    dish.init(id: 1007, englishName: "Galbi", koreanName: "갈비", favorite: false),
    dish.init(id: 1008, englishName: "Samgyeopsal", koreanName: "삼겹살", favorite: false),
    dish.init(id: 1009, englishName: "Tteokgugk", koreanName: "떡국", favorite: false),
    dish.init(id: 1010, englishName: "Kongnamul", koreanName: "콩나물", favorite: false)
]


final class DishData: ObservableObject {
    @Published var dishes: [dish] = data
}


