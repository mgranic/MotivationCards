//
//  CategoryElementsModel.swift
//  Quotes_iOS
//
//  Created by Mate Granic on 06.10.2023..
//

import Foundation

struct CategoryElementsModel : Decodable {
    var category: String
    var listOfElements: String // TODO: this should be changed into list but for now use string untill that works
}
