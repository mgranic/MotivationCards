//
//  CategoryElementsModel.swift
//  Quotes_iOS
//
//  Created by Mate Granic on 06.10.2023..
//

import Foundation

struct CategoryElementsModel : Decodable {
    var category: String
    var listOfElements: [String]
}
