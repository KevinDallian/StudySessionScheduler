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
    @EnvironmentObject var itemModel : ItemModel
     
    
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView{
            ZStack{
                Rectangle()
                    .foregroundColor(.green)
                    .ignoresSafeArea()
                ZStack{
                    RoundedRectangle(cornerRadius: 34)
                        .offset(y: -30)
                        .foregroundColor(.white)
                        .shadow(radius: 32, y: 5)
                    SessionFormView(sessionName: $sessionName, date: $date, host: $host, place: $place, max: $max, desc: $desc, savedSession: $itemModel.sessions)
                        .background(Color.white)
                        .scrollContentBackground(.hidden)
                }.offset(y: 100)
                
            }.accentColor(.red)
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarLeading) {
                        Button(action : { self.presentationMode.wrappedValue.dismiss() }){
                            Image(systemName: "arrowshape.turn.up.backward.circle")
                                .font(.title)
                                .accentColor(.white)
                        }.navigationBarBackButtonHidden(true)
                        Text("Create New Session")
                            .font(.title.weight(.bold))
                            .foregroundColor(.white)
                        
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
