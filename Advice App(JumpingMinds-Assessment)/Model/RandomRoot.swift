//
//  RandomRoot.swift
//  Advice App(JumpingMinds-Assessment)
//
//  Created by Dishant Nagpal on 26/06/22.
//

import Foundation

struct RandomRoot:Codable{
    
    var slip:RandomAdvice
    
}

struct RandomAdvice:Codable {
    
    var id:Int
    var advice:String
    
}
