//
//  SessionDetailView.swift
//  StudySessionScheduler
//
//  Created by Grisvian Verrel on 22/03/23.
//

import SwiftUI

struct SessionDetailView: View {
    @State var name:String = ""
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView{
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.blue)
                    .ignoresSafeArea()
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
                    Text("Swift Class")
                        .font(.largeTitle.weight(.bold))
                    Text("By KD")
                    VStack(alignment: .leading) {
                        Text("Date Time")
                            .font(.subheadline.weight(.bold))
                        HStack {
                            Text ("Mar 5, 2023")
                            Spacer ()
                            Text ("6:00 PM")
                        }
                        .padding(.bottom)
                        Text("At")
                            .font(.subheadline.weight(.bold))
                        Text ("Lab - 01")
                            .padding(.bottom)
                        Text("Description")
                            .font(.subheadline.weight(.bold))
                        Text  ("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.")
                            .padding(.bottom)
                        Text("Your Name")
                            .font(.subheadline.weight(.bold))
                        
                        TextField ("name", text: $name)
                            .cornerRadius(10)
                            .border(.secondary)
                    }.padding([.leading, .bottom, .trailing])
                    Button ("Join Session")
                    {
                        
                    } .padding(.top)
                    .buttonStyle(.borderedProminent)
                    .tint(.green)
                    
                }
            }.toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button(action : { self.presentationMode.wrappedValue.dismiss() }){
                        Image(systemName: "arrowshape.turn.up.backward.circle")
                            .font(.title)
                            .accentColor(.white)
                    }.navigationBarBackButtonHidden(true)
                    Text("Back")
                        .font(.title.weight(.bold))
                        .foregroundColor(.white)
                    
                }
            }
        }
        
   
    }
}

struct SessionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SessionDetailView()
    }
}
