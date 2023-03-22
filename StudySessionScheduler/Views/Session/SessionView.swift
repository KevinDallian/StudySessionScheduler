//
//  SwiftUIView.swift
//  StudySessionScheduler
//
//  Created by Kevin Dallian on 21/03/23.
//

import SwiftUI

struct SessionView: View {
    @EnvironmentObject var itemModel : ItemModel
    var session : Session
    var body: some View {
        HStack{
            RoundedRectangle(cornerRadius: 15)
                .frame(width: 70, height: 70)
                .padding(.trailing, 10.0)
            VStack(alignment: .leading){
                Text("\(session.sessionName)")
                    .font(.title.weight(.bold))
                    .foregroundColor(.black)
                Text("\(session.date, style: .date) \(session.date, style: .time)")
                    .font(.caption.weight(.light))
                    .foregroundColor(.gray)
                    .padding(.bottom, -4.0)
                Text("by \(session.host)")
                    .font(.caption.weight(.light))
                    .foregroundColor(.gray)
                    .padding(.bottom, -3.0)
                Text("Slot \(session.participants.count)/\(session.max)")
                    .font(.caption.weight(.light))
                    .foregroundColor(.gray)
            }
            Spacer()
            VStack{
                Text(session.participants.count == session.max ? "Full" : "Available")
                    .font(.subheadline.weight(.light))
                    .foregroundColor(session.participants.count == session.max ? Color(red: 1, green: 0, blue: 0) : Color(red: 9/255, green: 118/255, blue: 5/255))
                Spacer()
                Text("Detail >")
                    .foregroundColor(.gray)
                    .font(.subheadline.weight(.light))
            }.frame(height: 70)
        }.padding()
            .background(.white)
            .cornerRadius(10)
            .shadow(radius: 4, y: 2)
    }
}

struct SessionView_Previews: PreviewProvider {
    static let itemModel = ItemModel()
    static var previews: some View {
        SessionView(session: itemModel.sessions[0])
            .environmentObject(ItemModel())
    }
}
