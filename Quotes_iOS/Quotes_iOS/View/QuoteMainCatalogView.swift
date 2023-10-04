//
//  QuoteMainCatalogView.swift
//  Quotes_iOS
//
//  Created by Mate Granic on 02.10.2023..
//

import SwiftUI

struct QuoteMainCatalogView: View {
    var body: some View {
        VStack {
            ScrollView {
                ForEach(filterList, id: \.self) { filterType in
                    // TODO: this has to be some navigation link. Navigate to same view but show different data based on some parameter
                    Button(action: {filterSelected(filter: filterType)}) {
                        Text(filterType)
                    }
                }
            }
        }
    }
    
    private func filterSelected(filter: String) {
        print("String received is \(filter)")
    }
}

struct QuoteMainCatalogView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteMainCatalogView()
    }
}
