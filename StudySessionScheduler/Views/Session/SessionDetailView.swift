//
//  SessionDetailView.swift
//  StudySessionScheduler
//
//  Created by Grisvian Verrel on 22/03/23.
//

import SwiftUI

struct SessionDetailView: View {

    @EnvironmentObject private var itemModel : ItemViewModel
    @Environment(\.presentationMode) var presentationMode
    var session : SessionEntity
    @State var name : String = ""
    @State private var showAlert = false
    @State private var showSessionListView = false
    var body: some View {
        NavigationView{
            ZStack {
                Image("DetailView")
                    .resizable()
                    .offset(y: -160)
                RoundedRectangle(cornerRadius: 34)
                    .offset(y: 125)
                    .foregroundColor(.white)
                VStack {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .background(.white)
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame(width: 154, height: 154)
                    Text("\(session.name ?? "Name")")
                        .font(.largeTitle.weight(.bold))
                    Text("By \(session.host ?? "Host")")

                    VStack(alignment: .leading) {
                        Text("Date Time")
                            .font(.subheadline.weight(.bold))
                        HStack {
                            Text (session.date ?? Date.now, style: .date)
                            Text (session.date ?? Date.now, style: .time)
                        }
                        .padding(.bottom)
                        Text("At")
                            .font(.subheadline.weight(.bold))
                        Text ("\(session.place ?? "Place")")
                            .padding(.bottom)
                        Text("Description")
                            .font(.subheadline.weight(.bold))
                        Text("\(session.desc ?? "Description")")
                            .padding(.bottom)
                        
                        if let participants = session.participants?.allObjects as? [ParticipantEntity]{
                            Text("Participants (\(session.participants!.count))")
                                .font(.subheadline.weight(.bold))
                            ScrollView{
                                ForEach(participants, id: \.self){ participant in
                                    Text("\(participant.name ?? "Name")")
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                            }
                        } else{
                            Text("No Participants yet...")
                        }
                        Text("Your Name")
                            .font(.subheadline.weight(.bold))
                        TextField ("", text: $name)
                            .textFieldStyle(.roundedBorder)
                    }.padding([.leading, .bottom, .trailing])
                    Button
                    {
                        if(session.participants!.count == session.max){
                            showAlert = true
                        }
                        else if(name != ""){
                            itemModel.addNewParticipant(name: name, className: session.name!)
                            showSessionListView = true
                        }
                        
                    } label: {
                        Text("Join Session")
                            .frame(maxWidth: .infinity, minHeight: 50)
                    }.padding(.horizontal)
                    .buttonStyle(.borderedProminent)
                    .tint(.green)
                    .alert("Session Full", isPresented: $showAlert){
                        Button("OK", role: .cancel){}
                    } message: {
                        Text("The session is full")
                    }
                    .alert("Joined Success!", isPresented: $showSessionListView){
                        Button {
                            self.presentationMode.wrappedValue.dismiss()
                        } label: {
                            Text("Back to Menu")
                        }
                    } message:{
                        Text("Successfully Joined \(session.name ?? "Name")!")
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }){
                        HStack{
                            Image(systemName: "arrowshape.turn.up.backward.circle")
                                .font(.title)
                                .accentColor(.black)
                        }
                        
                    }.navigationBarBackButtonHidden(true)
                }
            }
        }

    }
}

struct SessionDetailView_Previews: PreviewProvider {
    static let itemModel = ItemViewModel()
    static var previews: some View {
        SessionDetailView(session: itemModel.sessions[0])
            .environmentObject(ItemViewModel())
    }
}
