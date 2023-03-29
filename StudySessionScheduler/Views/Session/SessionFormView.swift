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
    @State private var showAlert = false
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack{
            Spacer()
            Form{
                Section(header : Text("Name Session")){
                    TextField("Name" , text: $sessionName)
                        .textFieldStyle(.roundedBorder)
                }
                
                Section(header : Text("Date")) {
                    DatePicker("Date Time", selection: $date, displayedComponents: [.date, .hourAndMinute])
                        .labelsHidden()
                }
                
                Section(header : Text("Hosted By")) {
                    TextField("Session By" , text: $host)
                        .textFieldStyle(.roundedBorder)
                }
                
                Section(header : Text("Capacity")) {
                    Stepper("Max \(max) people" , value: $max, in: 1...1000)
                        .textFieldStyle(.roundedBorder)
                }
                Section(header : Text("Place")) {
                    TextField("Place" , text: $place)
                        .textFieldStyle(.roundedBorder)
                }
                Section(header : Text("Description")) {
                    TextField("Description" , text: $desc)
                        .textFieldStyle(.roundedBorder)

                }
                
                
            }.accentColor(.red)
            Spacer()
            Button{
                itemModel.addSession(name: sessionName, desc: desc, date: date, place: place, host: host, max: Int16(max))
                showAlert = true
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
            .alert("Creation Success", isPresented: $showAlert) {
                Button{
                    self.presentationMode.wrappedValue.dismiss()
                } label:{
                    Text("Back to Menu")
                }
            } message: {
                Text("Successfully created \(sessionName)")
            }
        }
    }
}

struct SessionFormView_Previews: PreviewProvider {
    static var previews: some View {
        SessionFormView(sessionName: .constant(""), date: .constant(Date()), host: .constant(""), place: .constant(""), max: .constant(100), desc: .constant(""))
            .environmentObject(ItemViewModel())
    }
}
