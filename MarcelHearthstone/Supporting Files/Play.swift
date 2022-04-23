//
//  Play.swift
//  MarcelHearthstone
//
//  Created by Marcel Gonçalves Viana Marins de Camargos on 16/04/22.
//

import Foundation
import UIKit

struct Play {
    var objectsArray = [
        TableViewCellCardModel(
            category: "Classes",
            cards: [
                [CollectionViewCellCardModel(color: UIColor(red: .random(in: 0...0.58), green: .random(in: 0...0.58), blue: .random(in: 0...0.58), alpha: 1), cardName: "card 1"),
                 CollectionViewCellCardModel(color: UIColor(red: .random(in: 0...0.58), green: .random(in: 0...0.58), blue: .random(in: 0...0.58), alpha: 1), cardName: "card 2"),
                 CollectionViewCellCardModel(color: UIColor(red: .random(in: 0...0.58), green: .random(in: 0...0.58), blue: .random(in: 0...0.58), alpha: 1), cardName: "card 3"),
                 CollectionViewCellCardModel(color: UIColor(red: .random(in: 0...0.58), green: .random(in: 0...0.58), blue: .random(in: 0...0.58), alpha: 1), cardName: "card 4"),
                 CollectionViewCellCardModel(color: UIColor(red: .random(in: 0...0.58), green: .random(in: 0...0.58), blue: .random(in: 0...0.58), alpha: 1), cardName: "card 5")]
            ]),
        TableViewCellCardModel(
            category: "Types",
            cards: [
                [CollectionViewCellCardModel(color: UIColor(red: .random(in: 0...0.58), green: .random(in: 0...0.58), blue: .random(in: 0...0.58), alpha: 1), cardName: "card 6"),
                 CollectionViewCellCardModel(color: UIColor(red: .random(in: 0...0.58), green: .random(in: 0...0.58), blue: .random(in: 0...0.58), alpha: 1), cardName: "card 7"),
                 CollectionViewCellCardModel(color: UIColor(red: .random(in: 0...0.58), green: .random(in: 0...0.58), blue: .random(in: 0...0.58), alpha: 1), cardName: "card 8"),
                 CollectionViewCellCardModel(color: UIColor(red: .random(in: 0...0.58), green: .random(in: 0...0.58), blue: .random(in: 0...0.58), alpha: 1), cardName: "card 9")]
            ]),
        TableViewCellCardModel(
            category: "Races",
            cards: [
                [CollectionViewCellCardModel(color: UIColor(red: .random(in: 0...0.58), green: .random(in: 0...0.58), blue: .random(in: 0...0.58), alpha: 1), cardName: "card 10"),
                 CollectionViewCellCardModel(color: UIColor(red: .random(in: 0...0.58), green: .random(in: 0...0.58), blue: .random(in: 0...0.58), alpha: 1), cardName: "card 11"),
                 CollectionViewCellCardModel(color: UIColor(red: .random(in: 0...0.58), green: .random(in: 0...0.58), blue: .random(in: 0...0.58), alpha: 1), cardName: "card 12"),
                 CollectionViewCellCardModel(color: UIColor(red: .random(in: 0...0.58), green: .random(in: 0...0.58), blue: .random(in: 0...0.58), alpha: 1), cardName: "card 13"),
                 CollectionViewCellCardModel(color: UIColor(red: .random(in: 0...0.58), green: .random(in: 0...0.58), blue: .random(in: 0...0.58), alpha: 1), cardName: "card 14")]
            ])
    ]
}
