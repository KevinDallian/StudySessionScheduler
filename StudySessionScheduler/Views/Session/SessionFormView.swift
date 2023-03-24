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
    @EnvironmentObject var itemModel : ItemViewModel

    @Binding var savedSession : [Session]
    var body: some View {
        VStack{
            Spacer()
            Form{
                Section(header : Text("Name Session")){
                    TextField("Name Study Session" , text: $sessionName)
                }
                
                Section(header : Text("Date")) {
                    DatePicker("Date Time", selection: $date, displayedComponents: [.date, .hourAndMinute])
                }
                
                Section(header : Text("Session By")) {
                    TextField("Session By" , text: $host)
                }
                
                Section(header : Text("Capacity")) {
                    Stepper("Max \(max) people" , value: $max, in: 1...1000)
                }
                Section(header : Text("Place")) {
                    TextField("Place" , text: $place)
                }
                Section(header : Text("Description")) {
                    TextField("Description" , text: $desc)
                }
                
                
            }.accentColor(.red)
            Spacer()
            
            Button{
                let participants = [host]
                let newSession = Session(sessionName: sessionName, desc: desc, date: date, place: place, participants: participants, host: host, max: max)
                itemModel.addSession(session: newSession)
            } label: {
                Text("Create new Session")
                    .frame(maxWidth: .infinity, maxHeight: 40)
            }
            .background(.green)
            .buttonStyle(.bordered)
            .foregroundColor(.white)
            .cornerRadius(8)
            .offset(y: -40)
            .padding()
            
        }
    }
}

struct SessionFormView_Previews: PreviewProvider {
    static var previews: some View {
        SessionFormView(sessionName: .constant(""), date: .constant(Date()), host: .constant(""), place: .constant(""), max: .constant(100), desc: .constant(""), savedSession: .constant([]))
    }
}
