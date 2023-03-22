//
//  SessionForm.swift
//  StudySessionScheduler
//
//  Created by Gaizka Valencia on 23/03/23.
//

import SwiftUI

struct SessionForm: View {
    @State private var sessionName: String = ""
    @State private var date = Date()
    @State private var host : String = ""
    @State private var place : String = ""
    @State private var max : Int = 1
    @State private var desc : String = ""
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView{
            Form{
                Section(header : Text("New Session")){
                    TextField("Name Study Session" , text: $sessionName)
                    DatePicker("Date Time", selection: $date, displayedComponents: [.date, .hourAndMinute])
                    TextField("Session By" , text: $host)
                    TextField("Place" , text: $place)
                    Stepper("Capacity", value: $max, in: 1...1000)
                    Text("This Sesssion has \(max) capacity")
                    TextField("Description" , text: $desc)
                }
            }.accentColor(.red)
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarLeading) {
                        Button(action : { self.presentationMode.wrappedValue.dismiss() }){
                            Image(systemName: "arrowshape.turn.up.backward.circle")
                                .font(.title)
                                .accentColor(.black)
                        }.navigationBarBackButtonHidden(true)
                        Text("Create New Session")
                            .font(.title.weight(.bold))
                            .foregroundColor(.black)
                        
                    }
                }
        }
        
    }
}

struct SessionForm_Previews: PreviewProvider {
    static var previews: some View {
        SessionForm()
    }
}
