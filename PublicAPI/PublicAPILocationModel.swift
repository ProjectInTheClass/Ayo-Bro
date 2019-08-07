//
//  PublicAPILocationModel.swift
//  Ayo~Bro
//
//  Created by GW_13 on 07/08/2019.
//  Copyright © 2019 GW_19. All rights reserved.
//

import Foundation

struct PublicAPILocationResponse : Codable {
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
                ///Location
                struct ItemInside : Codable {
                    var code : Int
                    var name : String
                    var rnum : Int
                }
            }
        }
    }
}

class PublicAPILocationModel {
    var result:[PublicAPILocationResponse.HeaderWithBody.Body.Item.ItemInside] = []

    // 서버로 정보 요청
    func requestToServer() {
        let authKey = "6N%2BwieYkPpXpi3hWL3wiKB9GHHU6tgsyFlxD0tSO4nyTbq3pVw3lCaZcvNp89oD7BnfJXP333QWeY4lOz5XDVA%3D%3D"
        let url = URL(string: "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaCode?ServiceKey=\(authKey)&numOfRows=17&pageNo=1&MobileOS=IOS&MobileApp=TestApp&_type=json")!
        let result = try! String(contentsOf: url)
        let decoder = JSONDecoder()
        
        let value = try! decoder.decode(PublicAPILocationResponse.self, from: result.data(using: .utf8)!)
        
        self.result = value.response.body.items.item
        
        print (value)
    }
}
