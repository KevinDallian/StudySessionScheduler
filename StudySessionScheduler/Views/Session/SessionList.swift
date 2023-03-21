//
//  SessionList.swift
//  StudySessionScheduler
//
//  Created by Kevin Dallian on 21/03/23.
//

import SwiftUI

struct SessionList: View {
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.green)
                .ignoresSafeArea()
            RoundedRectangle(cornerRadius: 34)
                .offset(y: 150)
                .foregroundColor(.white)
                .shadow(radius: 32, y: -5)
                
        }
        
            
    }
}

struct SessionList_Previews: PreviewProvider {
    static var previews: some View {
        SessionList()
    }
}
