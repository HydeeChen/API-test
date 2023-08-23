//
//  structUpload.swift
//  第三方API串接練習
//
//  Created by Hydee Chen on 2023/8/22.
//

import Foundation

//上傳用
struct APIResponse: Codable {
    var records: [Record]
    
    struct Record: Codable {
        var fields: Fields
        
        struct Fields: Codable {
            var orderName: String
            var drinkName: String
            var size: String
            var temperature: String
            var ice: String
            var sugar: String
            var add: String
        }
    }
}
