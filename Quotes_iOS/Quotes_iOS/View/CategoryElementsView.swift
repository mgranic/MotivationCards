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
            .onAppear(perform: {
                getUniqueElementsFromWebApi(category: selectedCategory)
            })
    }
    
    private func getUniqueElementsFromWebApi(category: String) {
        let url = URL(string: "http://192.168.1.80:5079/MotivationalQuoteApi/GetUniqueCategoryElements")!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let jsonObject = ["category": "\(category)"]
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
                let categoryElements = try decoder.decode(CategoryElementsModel.self, from: data!)
                print("*****************************************************************")
                print("Decoded response categry is: \(categoryElements.category)")
                
                for eleme in categoryElements.listOfElements {
                    print("element is ... \(eleme)")
                }
                //print("Decoded response list is: \(categoryElements.listOfElements)")
                print("*****************************************************************")
            } catch {
                print(error);
            }
        }
            .resume()
    }
}

struct CategoryElementsView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryElementsView("Dummy category")
    }
}
