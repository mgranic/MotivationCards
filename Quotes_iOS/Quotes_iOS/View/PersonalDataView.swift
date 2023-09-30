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
                .onAppear() {
                    if let tempName = UserDefaults.standard.string(forKey: "m_name") {
                        name = tempName
                    }
                }
            }
            
            Picker("Sex:", selection: $sex) {
                Text("None").tag(SexE.none.rawValue)
                Text("Male").tag(SexE.male.rawValue)
                Text("Female").tag(SexE.female.rawValue)
            }
            .onAppear() {
                if let tempSex = UserDefaults.standard.string(forKey: "m_sex") {
                    sex = tempSex
                }
            }
            
            DatePicker("Birthday", selection: $birthday, displayedComponents: [.date])
                    .onAppear() {
                        if let tempBirthday = UserDefaults.standard.object(forKey: "m_birthday") as? Date {
                            birthday = tempBirthday
                        }
                    }
            
            Picker("Loooking for?:", selection: $motivation) {
                Text("None").tag(MotivationE.none.rawValue)
                Text("Uplift").tag(MotivationE.uplift.rawValue)
                Text("Consolt").tag(MotivationE.console.rawValue)
                Text("Motivation").tag(MotivationE.motivation.rawValue)
            }
            .onAppear() {
                if let tempMotivation = UserDefaults.standard.string(forKey: "m_motivation") {
                    motivation = tempMotivation
                }
            }
            
            Button(action: saveChanges) {
                Text("Save")
            }
        }
    }
    
    // save profile data to UserDefaults (SharedPreferences)
    private func saveChanges() {
        UserDefaults.standard.set(name, forKey: "m_name")
        UserDefaults.standard.set(sex, forKey: "m_sex")
        UserDefaults.standard.set(birthday, forKey: "m_birthday")
        UserDefaults.standard.set(motivation, forKey: "m_motivation")
    }
}

struct PersonalDataView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalDataView()
    }
}
