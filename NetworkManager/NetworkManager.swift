//
//  NetworkManager.swift
//  TabbedApp test
//
//  Created by Student Supinfo on 15/06/2020.
//  Copyright © 2020 Student Supinfo. All rights reserved.
//

import Foundation

class NetworkManager: ParseProtocol {
    let url = URL(string: "https://api.covid19api.com/summary")!
    
    func downloadData(completion: @escaping (Bool, Summary?) -> ()) {
        let _  = URLSession.shared.dataTask(with: url) { (data, URLResponse, Error) in
            
            
//            print("******************")
//            print(data ?? "Data empty")
//            print("******************")
//            print(URLResponse ?? "Response empty")
//            print("******************")
//            print(Error ?? "Error empty")
//            print("******************")
//            print(String.init(data: data!, encoding: .utf8) ?? "data empty")
            
            
            guard let data = data else { completion(false, nil); return }
            self.parseModel(result: data, completion: { (succeed, model: Summary?) in
                completion(succeed, model)
            })
            
            
        }.resume()
    }
}

