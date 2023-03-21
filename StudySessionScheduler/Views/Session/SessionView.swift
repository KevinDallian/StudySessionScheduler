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
            VStack(alignment: .leading){
                Text("Swift Class")
                    .font(.title.weight(.bold))
                Text("Mar 5")
                    .font(.subheadline.weight(.light))
                Text("by KD")
                    .font(.subheadline.weight(.light))
                Text("Slot 129/130")
                    .font(.subheadline.weight(.light))
            }
        }
    }
}

struct SessionView_Previews: PreviewProvider {
    static var previews: some View {
        SessionView()
    }
}
