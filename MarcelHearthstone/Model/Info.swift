//
//  Info.swift
//  MarcelHearthstone
//
//  Created by Marcel Gonçalves Viana Marins de Camargos on 21/04/22.
//

struct Info: Codable, Equatable {
    var classes: [String] = []
    var sets: [String] = []
    var types: [String] = []
    var factions: [String] = []
    var qualities: [String] = []
    var races: [String] = []
    
    init() { }
    
    init(classes: [String],
         sets: [String],
         types: [String],
         factions: [String],
         qualities: [String],
         races: [String]) {
        self.classes = classes
        self.sets = sets
        self.types = types
        self.factions = factions
        self.qualities = qualities
        self.races = races
    }
}
