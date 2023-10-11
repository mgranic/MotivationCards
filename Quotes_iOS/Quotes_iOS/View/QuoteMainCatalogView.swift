//
//  QuoteMainCatalogView.swift
//  Quotes_iOS
//
//  Created by Mate Granic on 02.10.2023..
//

import SwiftUI

struct QuoteMainCatalogView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(filterList, id: \.self) { filterType in
                    // TODO: this has to be some navigation link. Navigate to same view but show different data based on some parameter
                    NavigationLink(destination: CategoryElementsView(filterType)) {
                        Text(filterType)
                    }
                }
            }
            .navigationTitle("Search quotes")
        }
    }
}

struct QuoteMainCatalogView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteMainCatalogView()
    }
}
