//
//  SessionFormView.swift
//  StudySessionScheduler
//
//  Created by Gaizka Valencia on 24/03/23.
//

import SwiftUI

struct SessionFormView: View {
    @Binding var sessionName: String
    @Binding var date : Date
    @Binding var host : String
    @Binding var place : String
    @Binding var max : Int
    @Binding var desc : String
    @Binding var savedSession : [Session]
    var body: some View {
        VStack{
            Form{
                Section(header : Text("Name Session")){
                    TextField("Name Study Session" , text: $sessionName)
                    TextField("Session By" , text: $host)
                    TextField("Place" , text: $place)
                    Stepper("Capacity", value: $max, in: 1...1000)
                    Text("This Sesssion has \(max) capacity")
                    TextField("Description" , text: $desc)
                }
                
                Section(header : Text("Date")) {
                    DatePicker("Date Time", selection: $date, displayedComponents: [.date, .hourAndMinute])
                }
            }.accentColor(.red)
            
            Button{
                let newSession = Session(sessionName: sessionName, desc: desc, date: date, place: place, host: host, max: max)
                savedSession.append(newSession)
            } label: {
                Text("Save to History")
                    .frame(maxWidth: .infinity, maxHeight: 40)
            }
            .background(.blue)
            .buttonStyle(.bordered)
            .foregroundColor(.white)
            .cornerRadius(8)
            .offset(y: -250)
            .padding()
            
        }
    }
}

struct SessionFormView_Previews: PreviewProvider {
    static var previews: some View {
        SessionFormView(sessionName: .constant(""), date: .constant(Date()), host: .constant(""), place: .constant(""), max: .constant(100), desc: .constant(""), savedSession: .constant([]))
    }
}
