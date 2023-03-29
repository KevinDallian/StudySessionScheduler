//
//  ItemModel.swift
//  StudySessionScheduler
//
//  Created by Kevin Dallian on 21/03/23.
//

import CoreData
import Foundation
import SwiftUI

class ItemViewModel : ObservableObject{
    let container : NSPersistentContainer
    let context : NSManagedObjectContext
    @Published var sessions: [SessionEntity] = []
    
    func getSessions(){
        let request = NSFetchRequest<SessionEntity>(entityName: "SessionEntity")
        do{
            try sessions = context.fetch(request)
        } catch let error {
            print("Error fetching sessions : \(error)")
        }
    }
    
    init(){
        container = NSPersistentContainer(name: "StudySessionScheduler")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error loading Core Data : \(error.localizedDescription)")
            }
        }
        context = container.viewContext
        getSessions()
    }
    
    func saveData(){
        do{
            try context.save()
        }catch let error {
            print("Error saving data : \(error.localizedDescription)")
        }
        getSessions()
    }
    func addSession(name : String, desc : String, date : Date, place : String, host: String, max : Int16){
        let newSession = SessionEntity(context: context)
        newSession.name = name
        newSession.desc = desc
        newSession.date = date
        newSession.place = place
        newSession.host = host
        newSession.max = max
        let newParticipant = ParticipantEntity(context: context)
        newParticipant.name = host
        newSession.participants = [newParticipant]
        saveData()
    }
    
    func addNewParticipant(name: String, className: String){
        for index in 0 ..< sessions.count{
            if sessions[index].name == className{
                let newParticipant = ParticipantEntity(context: context)
                newParticipant.name = name
                sessions[index].addToParticipants(newParticipant)
                saveData()
            }
        }
    }
    
}
