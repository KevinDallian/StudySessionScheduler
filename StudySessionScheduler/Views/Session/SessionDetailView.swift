//
//  SessionDetailView.swift
//  StudySessionScheduler
//
//  Created by Grisvian Verrel on 22/03/23.
//

import SwiftUI

struct SessionDetailView: View {
    @EnvironmentObject private var itemModel : ItemModel
    var session : Session
    @State var name : String = ""

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.blue)
                .ignoresSafeArea()
            RoundedRectangle(cornerRadius: 34)
                .offset(y: 125)
                .foregroundColor(.white)
            VStack {
                Image(systemName: "person.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 154, height: 154)
                Text("\(session.sessionName)")
                    .font(.largeTitle.weight(.bold))
                Text("By \(session.host)")
                VStack(alignment: .leading) {
                    Text("Date Time")
                        .font(.subheadline.weight(.bold))
                    HStack {
                        Text (session.date, style: .date)
                        Text (session.date, style: .time)
                    }
                    .padding(.bottom)
                    Text("At")
                        .font(.subheadline.weight(.bold))
                    Text ("\(session.place)")
                        .padding(.bottom)
                    Text("Description")
                        .font(.subheadline.weight(.bold))
                    Text  ("\(session.desc)")
                        .padding(.bottom)
                    Text("Your Name")
                        .font(.subheadline.weight(.bold))
                    TextField ("", text: $name)
                        .textFieldStyle(.roundedBorder)
                }.padding([.leading, .bottom, .trailing])
                Button
                {
                    
                } label: {
                    Text("Join Session")
                        .frame(maxWidth: .infinity, minHeight: 50)
                }.padding(.horizontal)
                .buttonStyle(.borderedProminent)
                .tint(.green)
            }
        }
    }
}

struct SessionDetailView_Previews: PreviewProvider {
    static let itemModel = ItemModel()
    static var previews: some View {
        SessionDetailView(session: itemModel.sessions[0])
            .environmentObject(ItemModel())
    }
}
