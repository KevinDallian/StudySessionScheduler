//
//  SessionList.swift
//  StudySessionScheduler
//
//  Created by Kevin Dallian on 21/03/23.
//

import SwiftUI

struct SessionList: View {
    @EnvironmentObject var itemModel : ItemModel
    var sessions : [Session]{
        itemModel.sessions
    }
    var body: some View {
        NavigationView{
            ZStack{
                Rectangle()
                    .foregroundColor(.green)
                    .ignoresSafeArea()
                RoundedRectangle(cornerRadius: 34)
                    .offset(y: 100)
                    .foregroundColor(.white)
                    .shadow(radius: 32, y: -5)
                ScrollView{
                    ForEach(sessions){session in
                        NavigationLink{
                            Text("Hello")
                        }label: {
                            SessionView(session: session)
                                .padding(.horizontal)
                        }.accentColor(.black)
                    }
                }.offset(y: 120)
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    VStack(alignment: .leading){
                        Text("Hi, Masbrow")
                            .font(.largeTitle.weight(.bold))
                            .foregroundColor(.white)
                        Text("Good Morning")
                            .font(.headline.weight(.light))
                            .foregroundColor(.white)
                    }
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button{
                        print("")
                    } label:{
                        Image(systemName: "bell.circle.fill")
                            .font(.title)
                    }.accentColor(.white)
                    Button{
                        //
                    } label:{
                        Image(systemName: "line.3.horizontal.decrease.circle.fill")
                            .font(.title)
                    }.accentColor(.white)
                }
                ToolbarItemGroup(placement: .bottomBar){
                    Button{
                        
                    }label: {
                        Image(systemName: "plus")
                            .accentColor(.black)
                    }
                }
                
            }
        }
        
    }
}

struct SessionList_Previews: PreviewProvider {
    static var previews: some View {
        SessionList()
            .environmentObject(ItemModel())
    }
}
