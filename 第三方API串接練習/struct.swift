//
//  struct.swift
//  第三方API串接練習
//
//  Created by Hydee Chen on 2023/8/15.
//

import Foundation

struct DrinksBody: Codable {
    let records: [Record]
    
    struct Record: Codable {
        let id: String
        let createdTime: String
        let fields: Fields
    }

    struct Fields: Codable {
        let content: String
        let name: String
        let lPrice: Int?
        let mPrice: Int
        let image: [Image]
        
        struct Image: Codable {
            let id: String
            let width: Int
            let height: Int
            let url: URL
            let filename: String
            let size: Int
            let type: String
            let thumbnails: Thumbnails

            struct Thumbnails: Codable {
                let small: ThumbnailInfo
                let large: ThumbnailInfo
                let full: ThumbnailInfo

                struct ThumbnailInfo: Codable {
                    let url: URL
                    let width: Int
                    let height: Int
                }
            }
        }
    }
}
