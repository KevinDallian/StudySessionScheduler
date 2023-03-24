//
//  SessionModel.swift
//  StudySessionScheduler
//
//  Created by Kevin Dallian on 21/03/23.
//

import Foundation

struct Session: Identifiable{
    var id = UUID().uuidString
    var sessionName : String
    var desc : String
    var date : Date
    var place : String
//    var participants : [String]
    var host : String
    var max : Int
}
