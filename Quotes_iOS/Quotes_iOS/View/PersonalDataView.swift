//
//  PersonalDataView.swift
//  Quotes_iOS
//
//  Created by Mate Granic on 20.09.2023..
//

import SwiftUI

struct PersonalDataView: View {
    @State var name: String = ""
    @State var sex: String = ""
    @State var birthday: Date = Date()
    @State var motivation: String = ""
    var body: some View {
            Form {
            HStack {
                Text("Name:")
                    .bold()
                    .foregroundColor(.blue)
                TextField("Your name", text: $name, prompt: Text("Your name here"))
            }
            
            Picker("Sex:", selection: $sex) {
                Text("None").tag(SexE.none.rawValue)
                Text("Male").tag(SexE.male.rawValue)
                Text("Female").tag(SexE.female.rawValue)
            }
            
            DatePicker("Birthday", selection: $birthday, displayedComponents: [.date])
            
            Picker("Loooking for?:", selection: $motivation) {
                Text("None").tag(MotivationE.none.rawValue)
                Text("Uplift").tag(MotivationE.uplift.rawValue)
                Text("Consolt").tag(MotivationE.console.rawValue)
                Text("Motivation").tag(MotivationE.motivation.rawValue)
            }
            
            Button(action: saveChanges) {
                Text("Save")
            }
        }
    }
    
    private func saveChanges() {
        
    }
}

struct PersonalDataView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalDataView()
    }
}
