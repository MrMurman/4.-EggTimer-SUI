//
//  Egg.swift
//  4. EggTimer-SUI
//
//  Created by Андрей Бородкин on 26.01.2023.
//

import Foundation


struct Egg {
    enum Softness: String {
        case soft = "soft_egg"
        case medium = "medium_egg"
        case hard = "hard_egg"
    }
    
    var imageName: String
    var timeToCook: Double
    var softness: Softness
    
    static func createEgg(softness: Softness, timeToCook: Double) -> Egg {
        Egg(imageName: softness.rawValue, timeToCook: timeToCook, softness: softness)
    }
    
    static var allEggs = [
        
            Egg.createEgg(softness: .soft, timeToCook: 30),
            Egg.createEgg(softness: .medium, timeToCook: 60),
            Egg.createEgg(softness: .hard, timeToCook: 90)
        
    ]
}
