//
//  PersonalDataView.swift
//  MotivationCards
//
//  Created by Mate Granic on 19.09.2023..
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
                Text("None").tag(SexE.none)
                Text("Male").tag(SexE.male)
                Text("Female").tag(SexE.female)
            }
            
            DatePicker("Birthday", selection: $birthday, displayedComponents: [.date])
            
            Picker("Loooking for?:", selection: $motivation) {
                Text("None").tag(MotivationE.none)
                Text("Uplift").tag(MotivationE.uplift)
                Text("Consolt").tag(MotivationE.console)
                Text("Motivation").tag(MotivationE.motivation)
            }
            
            Button(action: saveChanges) {
                Text("Save")
            }
            
            
            
               // Text("Your name")
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
