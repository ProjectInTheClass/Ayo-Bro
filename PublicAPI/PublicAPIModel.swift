//
//  PublicAPIModel.swift
//  Ayo~Bro
//
//  Created by Abraham Park on 8/7/19.
//  Copyright © 2019 GW_19. All rights reserved.
//

import Foundation

struct PublicAPIResponse : Codable {
    var response:HeaderWithBody
    
    struct HeaderWithBody : Codable {
        var header:Header
        var body:Body
        
        struct Header : Codable {
            var resultCode : String
            var resultMsg : String
        }
        struct Body : Codable {
            var items :Item
            var numOfRows : Int
            var pageNo  : Int
            var totalCount : Int
            
            struct Item : Codable {
                var item : [ItemInside]
                ///Title
                struct ItemInside : Codable {
                    var title : String
                    var addr1 : String?
                    var firstimage2 : String?
                }
            }
        }
    }
}

class PublicAPIModel {
    
    var result:[PublicAPIResponse.HeaderWithBody.Body.Item.ItemInside] = []
    
    /// 서버로 정보 요청
    func requestToServer() {
        let authKey = "6N%2BwieYkPpXpi3hWL3wiKB9GHHU6tgsyFlxD0tSO4nyTbq3pVw3lCaZcvNp89oD7BnfJXP333QWeY4lOz5XDVA%3D%3D"
        let url = URL(string: "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?MobileOS=IOS&MobileApp=AppTest&ServiceKey=\(authKey)&_type=json&pageNo=1&numOfRows=100")!
        
        let result = try! String(contentsOf: url)
        let decoder = JSONDecoder()
        
        let value = try! decoder.decode(PublicAPIResponse.self, from: result.data(using: .utf8)!)
        
        self.result = value.response.body.items.item
        
        print(value)
    }
}
