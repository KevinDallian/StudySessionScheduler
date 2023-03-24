//
//  ItemModel.swift
//  StudySessionScheduler
//
//  Created by Kevin Dallian on 21/03/23.
//

import Foundation
import SwiftUI

class ItemModel : ObservableObject{
    @Published var sessions: [Session] = [
        Session(sessionName: "Swift Class", desc: "Ini adalah kelas yang membahas tentang bahasa pemrograman Swift.", date: Date(), place: "Lab-1", host: "KD", max: 10),
        Session(sessionName: "UI Class", desc: "Ini adalah kelas yang membahas tentang UI seputar IOS Development.", date: Date(), place: "Lab-2", host: "Aga", max: 10)]
}
