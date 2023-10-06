//
//  CategoryElementsView.swift
//  Quotes_iOS
//
//  Created by Mate Granic on 06.10.2023..
//

import SwiftUI

struct CategoryElementsView: View {
    
    var selectedCategory: String = "";
    
    init(_ category: String) {
        self.selectedCategory = category
    }
    
    var body: some View {
        Text("Selected: *** \(selectedCategory) ***")
    }
}

struct CategoryElementsView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryElementsView("Dummy category")
    }
}
