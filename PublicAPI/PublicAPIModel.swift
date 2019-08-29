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

/// 전역으로 선언.
let sharedModelPublicAPI = PublicAPIModel()

class PublicAPIModel {

    func itemsForIndex(index:Int) -> [PublicAPIResponse.HeaderWithBody.Body.Item.ItemInside] {
        var rValue:[PublicAPIResponse.HeaderWithBody.Body.Item.ItemInside] = []
        
        switch index {
        case 0 :
            rValue = self.resultCourse
        case 1 :
            rValue = self.resultTripDestination
        case 2 :
            rValue = self.resultFood
        case 3 :
            rValue = self.resultLeports
        case 4 :
            rValue = self.resultStay
        case 5 :
            rValue = self.resultCulture
        default :
            print ("Error")
        }
        return rValue
    }

    
    var resultCourse:           [PublicAPIResponse.HeaderWithBody.Body.Item.ItemInside] = []
    var resultTripDestination:  [PublicAPIResponse.HeaderWithBody.Body.Item.ItemInside] = []
    var resultFood :            [PublicAPIResponse.HeaderWithBody.Body.Item.ItemInside] = []
    var resultLeports :         [PublicAPIResponse.HeaderWithBody.Body.Item.ItemInside] = []
    var resultStay :            [PublicAPIResponse.HeaderWithBody.Body.Item.ItemInside] = []
    var resultCulture :         [PublicAPIResponse.HeaderWithBody.Body.Item.ItemInside] = []
    /// 서버로 정보 요청
    func requestToServer() {
        let authKey = "6N%2BwieYkPpXpi3hWL3wiKB9GHHU6tgsyFlxD0tSO4nyTbq3pVw3lCaZcvNp89oD7BnfJXP333QWeY4lOz5XDVA%3D%3D"
        let contentTypeId: [Int] = [25, 12, 39, 28, 32, 14]
        var areaCode : Int = 1
        switch selectRegionIndex {
        case 0:
            areaCode = 1 ///서울
        case 1:
            areaCode = 32 ///강원도
        case 2:
            areaCode = 31 ///경기도
        case 3:
            areaCode = 36 ///경상남도
        case 4:
            areaCode = 35 ///경상북도
        case 5:
            areaCode = 38 ///전라남도
        case 6:
            areaCode = 37 ///전라북도
        case 7:
            areaCode = 34 ///충청남도
        case 8:
            areaCode = 33 ///충청북도
        case 9:
            areaCode = 39 ///제주도
        default :
            print ("selectRegionIndex Error")
            break
        }
        
        for typeId in contentTypeId {
            let url = URL(string: "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?MobileOS=IOS&MobileApp=AppTest&ServiceKey=\(authKey)&_type=json&pageNo=1&numOfRows=20&contentTypeId=\(typeId)&areaCode=\(areaCode)&arrange=P")!
            let result = try! String(contentsOf: url)
            let decoder = JSONDecoder()
            
            let value = try! decoder.decode(PublicAPIResponse.self, from: result.data(using: .utf8)!)
            switch typeId {
            case 25:
                self.resultCourse = value.response.body.items.item
            case 12:
                self.resultTripDestination = value.response.body.items.item
            case 39:
                self.resultFood = value.response.body.items.item
            case 28:
                self.resultLeports = value.response.body.items.item
            case 32:
                self.resultStay = value.response.body.items.item
            case 14:
                self.resultCulture = value.response.body.items.item
            default:
                break
            }
            print (value)
            
        }
    }
}
