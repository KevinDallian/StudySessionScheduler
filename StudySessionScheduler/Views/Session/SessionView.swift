//
//  SwiftUIView.swift
//  StudySessionScheduler
//
//  Created by Kevin Dallian on 21/03/23.
//

import SwiftUI

struct SessionView: View {
    var body: some View {
        HStack{
            RoundedRectangle(cornerRadius: 15)
                .frame(width: 70, height: 70)
                .padding(.trailing, 15.0)
            VStack(alignment: .leading){
                Text("Swift Class")
                    .font(.title.weight(.bold))
                Text("Mar 5, 2023 6:00 PM")
                    .font(.caption.weight(.light))
                    .foregroundColor(.gray)
                    .padding(.bottom, -4.0)
                Text("by KD")
                    .font(.caption.weight(.light))
                    .foregroundColor(.gray)
                    .padding(.bottom, -3.0)
                Text("Slot 129/130")
                    .font(.caption.weight(.light))
                    .foregroundColor(.gray)
            }
            Spacer()
            VStack{
                Text("Available")
                    .font(.subheadline.weight(.light))
                    .foregroundColor(.green)
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
    static var previews: some View {
        SessionView()
    }
}
