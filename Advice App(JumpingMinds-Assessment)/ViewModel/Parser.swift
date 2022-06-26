//
//  Parser.swift
//  Advice App(JumpingMinds-Assessment)
//
//  Created by Dishant Nagpal on 25/06/22.
//

import Foundation

class Parser{
    
    var finalAdvices = [String]()
    
    func performRequest(comp : @escaping ([Advice])->()){
        
        let urlString = "https://api.adviceslip.com/advice/search/when"
        
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
                        let decodedData = try decoder.decode(Root.self, from: safeData)
                        
                        comp(decodedData.slips)
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
