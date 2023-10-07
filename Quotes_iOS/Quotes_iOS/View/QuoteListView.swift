//
//  QuoteListView.swift
//  Quotes_iOS
//
//  Created by Mate Granic on 07.10.2023..
//

import SwiftUI

struct QuoteListView: View {
    @State var listOfQuotes: [String] = []
    private var categoryElement: String
    
    init(_ cateEl: String) {
        self.categoryElement = cateEl
        
        // TODO: replace this with post request to server to get data. This post should be done in onAppear handler like in CategoryElementsView
        //dummyList: [String] = ["q1", "q2", "q3"]
        
        //quote in dummyList {
        //listOfQuotes.append(quote)
        //
        
        //ODO: remove this once you remove dummy list above, this is just for easier debugging
        //OfQuotes.append(cateEl)
    }
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(listOfQuotes, id: \.self) { quote in
                    Text("\(quote)")
                }
            }
        }
        .onAppear(perform: {
            getQuotesForElementFromWebApi(element: categoryElement)
        })
    }
    
    private func getQuotesForElementFromWebApi(element: String) {
        let url = URL(string: "http://192.168.1.80:5079/MotivationalQuoteApi/GetQuotesForCategoryElement")!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let jsonObject = ["category": "\(element)"]
        let jsonData = try! JSONSerialization.data(withJSONObject: jsonObject, options: [])
        urlRequest.httpBody = jsonData
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                print(error);
                return
            }

            //if let data = data {
            //    print("Category response *** \(data)")
            //}
            guard let response = response as? HTTPURLResponse else { return }
            
            // Check the response status code
            if response.statusCode != 200 {
                print("*****************************************************************")
                print("HTTP status code: \(response.statusCode)")
                print("*****************************************************************")
                return
            }
            
            // Get the response data
            let categoryResp = String(data: data!, encoding: .utf8)!
            print(categoryResp)
            
            let decoder = JSONDecoder()
            do {
                let listFromWeb = try decoder.decode(CategoryElementsModel.self, from: data!)
                for quote in listFromWeb.listOfElements {
                    listOfQuotes.append(quote)
                }
            } catch {
                print(error);
            }
        }
            .resume()
    }
}


struct QuoteListView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteListView("Nice")
    }
}
