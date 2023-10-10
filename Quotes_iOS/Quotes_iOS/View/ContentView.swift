//
//  ContentView.swift
//  Quotes_iOS
//
//  Created by Mate Granic on 20.09.2023..
//

import SwiftUI

struct ContentView: View {
    @State var motivationalQuote: String = "Empty"
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.blue, .green]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Text("\(motivationalQuote)")
                        .padding()
                        .onAppear(perform: getMotivationalQuote)
                    Button(action: getMotivationalQuote) {
                        Text("Next quote")
                        Image(systemName: "chevron.right")
                    } /*{
                       Image(systemName: "plus.circle.fill")
                       .accessibilityLabel("Add attendee")
                       }*/
                }
            }
            .toolbar {

                Menu {
                    NavigationLink(destination: PersonalDataView()) {
                        Text("Settings")
                            .foregroundColor(.red)
                    }
                    
                    NavigationLink(destination: QuoteMainCatalogView()) {
                        Text("Quotes catalog")
                            .foregroundColor(.red)
                    }
                } label: {
                    Label("Menu", systemImage: "ellipsis.circle")
                        .foregroundColor(.black)
                }
            }
        }
    }
    
    private func getMotivationalQuote() {
        print("button pressed")
        
        // Create a URL object for the GET request
        let url = URL(string: "http://192.168.1.80:5079/MotivationalQuoteApi/GetMotivationalQuotePost")!
        
        // Create a URLRequest object
        var request = URLRequest(url: url)
        
        // Set the HTTP method to GET
        request.httpMethod = "POST"
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let jsonObject: [String: Any] = ["gender": "gender value", "age": 34]
        let jsonData = try! JSONSerialization.data(withJSONObject: jsonObject, options: [])
        request.httpBody = jsonData
        
        // Make the HTTP request
        URLSession.shared.dataTask(with: request) { data, response, error in
            // Check for errors
            if let error = error {
                print(error)
                return
            }
            
            guard let response = response as? HTTPURLResponse else { return }
            
            // Check the response status code
            if response.statusCode != 200 {
                print("*****************************************************************")
                print("HTTP status code: \(response.statusCode)")
                print("*****************************************************************")
                return
            }
            
            // Get the response data
            motivationalQuote = String(data: data!, encoding: .utf8)!
            //let value = responseString.substring(from: 9)
            //let x = data!
            print(motivationalQuote)
            
        }.resume()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
