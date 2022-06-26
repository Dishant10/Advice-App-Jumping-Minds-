//
//  RandomParser.swift
//  Advice App(JumpingMinds-Assessment)
//
//  Created by Dishant Nagpal on 26/06/22.
//

import Foundation

class RandomParser{
    
    var finalAdvices = [String]()
    
    func performRequest(comp : @escaping (RandomAdvice)->()){
        
        let urlString = "https://api.adviceslip.com/advice"
        
        if let url=URL(string: urlString) {
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { data,response,error in
                
                
                guard error == nil else{
                    print(error?.localizedDescription)
                    return
                }
                
                
                if let safeData = data{
                    
                    let decoder = JSONDecoder()
                    do{
                        let decodedData = try decoder.decode(RandomRoot.self, from: safeData)
                        
                        comp(decodedData.slip)
                    }
                    catch{
                        print(error)
                    }
                    
                }
                
            }
            
            task.resume()
            
        }
        
    }
    
}

