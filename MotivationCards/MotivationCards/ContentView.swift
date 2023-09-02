//
//  ContentView.swift
//  MotivationCards
//
//  Created by Mate Granic on 26.08.2023..
//

import SwiftUI

struct ContentView: View {
    @State var motivationalQuote: String = "Empty"
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Motivational quote is: \(motivationalQuote)")
                .onAppear {
                    // Create a URL object for the GET request
                    let url = URL(string: "https://192.168.1.80:5079/MotivationalQuoteApi/GetMotivationalQuote/radi1234")!
                    
                    // Create a URLRequest object
                    var request = URLRequest(url: url)
                    
                    // Set the HTTP method to GET
                    request.httpMethod = "GET"
                    
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
                            print("HTTP status code: \(response.statusCode)")
                            return
                        }
                        
                        // Get the response data
                        let x = data!
                        
                    }.resume()
                }
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
