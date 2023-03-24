//
//  ItemModel.swift
//  StudySessionScheduler
//
//  Created by Kevin Dallian on 21/03/23.
//

import Foundation
import SwiftUI

class ItemViewModel : ObservableObject{
    @Published var sessions: [Session] = [
        Session(sessionName: "Swift Class", desc: "Ini adalah kelas yang membahas tentang bahasa pemrograman Swift.", date: Date(),place: "Lab-1", participants:[], host: "KD", max: 10),
        Session(sessionName: "UI Class", desc: "Ini adalah kelas yang membahas tentang UI seputar IOS Development.", date: Date(), place: "Lab-2", participants:[], host: "Aga", max: 10)
    ]
    
    func addNewParticipant(name: String,className: String){
        for index in 0 ..< sessions.count{
            if sessions[index].sessionName == className{
                sessions[index].participants.append(name)
            }
        }
        objectWillChange.send()
    }
    
}
