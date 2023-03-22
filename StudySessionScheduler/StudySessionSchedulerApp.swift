//
//  StudySessionSchedulerApp.swift
//  StudySessionScheduler
//
//  Created by Kevin Dallian on 21/03/23.
//

import SwiftUI

@main
struct StudySessionSchedulerApp: App {
    @StateObject var itemModel = ItemModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(itemModel)
        }
    }
}
