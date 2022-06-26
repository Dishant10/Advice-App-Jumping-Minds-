//
//  Root.swift
//  Advice App(JumpingMinds-Assessment)
//
//  Created by Dishant Nagpal on 25/06/22.
//

import Foundation


struct Root:Codable{
    
    
    let total_results:String
    let query:String
    
    var slips:[Advice]
    
    
}

///MARK:- Advice Structure


struct Advice:Codable{
    
    var id : Int
    var advice : String
    
}
