//
//  ItemModel.swift
//  StudySessionScheduler
//
//  Created by Kevin Dallian on 21/03/23.
//

import Foundation
import SwiftUI

class ItemModel{
    @Published var session: [Session] = []
    @Published var status : String = "No Data"
    @Published var statusColor : Color = .black
}
