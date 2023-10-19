//
//  PeopleModel.swift
//  Exam2_Waobikeze_Brian
//
//  Created by brian waobikeze on 10/19/23.
//

import Foundation

struct People: Codable{
    let id : Int
    let distance: Int
    var type: String
    var name: String
    var location: String
    var lati: Double
    var longi: Double
}
