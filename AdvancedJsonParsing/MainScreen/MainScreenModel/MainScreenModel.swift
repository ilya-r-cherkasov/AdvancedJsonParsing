//
//  MainScreenModel.swift
//  AdvancedJsonParsing
//
//  Created by Ilya Cherkasov on 15.09.2021.
//

import Foundation

struct MainScreenModel: Codable {
    
    var name: String
    var values: [String]
    
    private enum CodingKeys: String, CodingKey {
        case name
        case values
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        do {
            self.values = try container.decode(String.self, forKey: .values)
                .components(separatedBy: ":")
                .filter({$0 != ""})
        } catch let error {
            print(error)
            self.values = []
        }
    }
}

typealias MainScreenModels = [MainScreenModel]
