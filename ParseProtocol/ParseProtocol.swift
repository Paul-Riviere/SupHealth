//
//  ParseProtocol.swift
//  TabbedApp test
//
//  Created by Student Supinfo on 15/06/2020.
//  Copyright © 2020 Student Supinfo. All rights reserved.
//

import Foundation

protocol ParseProtocol {
    func parseModel<T: Decodable>(result: Data, completion: @escaping (_ succeed: Bool, _ model: T?)->())
}

extension ParseProtocol {
    public func parseModel <T: Decodable>(result: Data, completion: @escaping (_ succeed: Bool, _ model: T?)->()) {
        DispatchQueue.global(qos: .utility).async {
        do {
            let currentModel = try JSONDecoder().decode(T.self, from: result)
            DispatchQueue.main.async {
                completion(true, currentModel)
            }
        } catch {
            DispatchQueue.main.async {
                print(error.localizedDescription)
                completion(false, nil)
            }
        }
        }
    }
}

