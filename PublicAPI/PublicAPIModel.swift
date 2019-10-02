//
//  PublicAPIModel.swift
//  Ayo~Bro
//
//  Created by Abraham Park on 8/7/19.
//  Copyright © 2019 GW_19. All rights reserved.
//

import Foundation
/// 즐겨 찾기
var sharedBookMark:[Int:Int] = [:]
var coursecurrentIndex = 0

struct realBookmarkArray {
    var regionName : String
    var isExpanded : Bool
    var middleArray : Array<locationArray>
}

var trueBookmarkArray : Array<realBookmarkArray> = []

struct locationArray {
    var title : String
    var contentid : Int
    var contenttypeid: Int
    var image : String? 
    var mapx : Double
    var mapy : Double
    var sigungucode : Int
    var areacode : Int
    var addr1 : String?
}

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
                
                struct ItemInside : Codable {
                    var title : String
                    var addr1 : String?
                    var firstimage2 : String?
                    var contentid : Int
                    var contenttypeid: Int
                    var createdtime: Int
                    var overview : String?
                    var modifiedtime : Int
//                    var bookmark: Bool?
                    var areacode : Int?
                    var sigungucode : Int?
                    var mapx : Double
                    var mapy : Double
                    
                    // 참고자료 : Encoding and Decoding Custom Types in apple ref.
                    
                    enum CodingKeys: String, CodingKey {
                        case title, addr1,firstimage2, contentid, contenttypeid, createdtime, overview, modifiedtime,areacode,sigungucode, mapx, mapy
                    }
                    
                    init(from decoder : Decoder) throws {
                        let container = try decoder.container(keyedBy: CodingKeys.self)
                        
                        title       = try container.decode(String.self, forKey: .title)
                        addr1       = try? container.decode(String.self, forKey: .addr1)
                        firstimage2  = try? container.decode(String.self, forKey: .firstimage2)
                        contentid   = try container.decode(Int.self, forKey: .contentid)
                        contenttypeid = try container.decode(Int.self, forKey: .contenttypeid)
                        createdtime = try container.decode(Int.self, forKey: .createdtime)
                        overview    = try? container.decode(String.self, forKey: .overview)
                        modifiedtime = try container.decode(Int.self, forKey: .modifiedtime)
                        areacode = try? container.decode(Int.self, forKey: .areacode)
                        sigungucode = try? container.decode(Int.self, forKey: .sigungucode)
                        if let x = try? container.decode(Double.self, forKey: .mapx) {
                            mapx = x
                        }
                        else {
                            let stringX = try container.decode(String.self, forKey: .mapx)
                            mapx = Double(stringX)!
                        }
                        if let y = try? container.decode(Double.self, forKey: .mapy) {
                            mapy = y
                        }
                        else {
                            let stringY = try container.decode(String.self, forKey: .mapy)
                            mapy = Double(stringY)!
                        }
                    }
                }
            }
        }
    }
}

struct PublicAPIResponseDetail : Codable {
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
                var item : ItemInside
                
                struct ItemInside : Codable {
                    var title : String
                    var addr1 : String?
                    var firstimage : String?
                    var contentid : Int
                    var contenttypeid: Int
                    var createdtime: Int
                    var overview : String?
                    var modifiedtime : Int
                    var mapx : Double
                    var mapy : Double
                    
                    // 참고자료 : Encoding and Decoding Custom Types in apple ref.
                    
                    enum CodingKeys: String, CodingKey {
                        case title, addr1,firstimage, contentid, contenttypeid, createdtime, overview, modifiedtime, mapx, mapy
                    }
                    
                    init(from decoder : Decoder) throws {
                        let container = try decoder.container(keyedBy: CodingKeys.self)
                        
                        title       = try container.decode(String.self, forKey: .title)
                        addr1       = try? container.decode(String.self, forKey: .addr1)
                        firstimage  = try? container.decode(String.self, forKey: .firstimage)
                        contentid   = try container.decode(Int.self, forKey: .contentid)
                        contenttypeid = try container.decode(Int.self, forKey: .contenttypeid)
                        createdtime = try container.decode(Int.self, forKey: .createdtime)
                        overview    = try? container.decode(String.self, forKey: .overview)
                        modifiedtime = try container.decode(Int.self, forKey: .modifiedtime)
                        
                        if let x = try? container.decode(Double.self, forKey: .mapx) {
                            mapx = x
                        }
                        else {
                            let stringX = try container.decode(String.self, forKey: .mapx)
                            mapx = Double(stringX)!
                        }
                        if let y = try? container.decode(Double.self, forKey: .mapy) {
                            mapy = y
                        }
                        else {
                            let stringY = try container.decode(String.self, forKey: .mapy)
                            mapy = Double(stringY)!
                        }
                    }
                }
            }
        }
    }
}

struct PublicAPIResponseCommon : Codable{
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
                var item : ItemInside
                
                struct ItemInside : Codable {
                    var contentid : Int
                    var contenttypeid: Int
                    /// 관광지
                    var usetime : String? /// 이용 시간
                    var infocenter : String? /// 문의 및 안내
                    var expguide : String? /// 체험 안내
                    var chkpet : String? /// 애완동물
                    var chkbabycarriage: String? /// 유모차 대여
                    /// 음식
                    var firstmenu : String? /// 대표 메뉴
                    var infocenterfood : String? /// 문의 및 안내
                    var opentimefood : String? /// 영업 시간
                    var reservationfood : String? /// 예약안내
                    var treatmenu : String? /// 메뉴 목록
                    /// 숙박
                    var roomcount: String? /// 객실 수
                    var checkintime: String? /// 체크인 시간
                    var checkouttime: String? /// 체크아웃 시간
                    var reservationlodging: String? /// 예약안내
                    var infocenterlodging: String? /// 문의..?
                    /// 문화
                    var infocenterculture: String? /// 문의 및 안내
                    var usefee : String? /// 이용요금
                    var restdateculture: String? /// 쉬는날
                    var usetimeculture: String? /// 이용시간
                    /// 레포츠
                    var infocenterleports:String? /// 예약 및 문의
                    var restdateleports: String? /// 휴무일
                    var usetimeleports: String? /// 이용 시간
                    
                    enum CodingKeys: String, CodingKey {
                        case contentid, contenttypeid,usetime,infocenter,expguide,chkpet,chkbabycarriage,firstmenu,infocenterfood,opentimefood,reservationfood,treatmenu,roomcount,checkintime,checkouttime,reservationlodging,infocenterlodging,infocenterculture,usefee,restdateculture,usetimeculture,infocenterleports,restdateleports,usetimeleports
                    }
                    
                    init(from decoder : Decoder) throws {
                        let container = try decoder.container(keyedBy: CodingKeys.self)
                        
                        contentid       = try container.decode(Int.self, forKey: .contentid)
                        contenttypeid       = try container.decode(Int.self, forKey: .contenttypeid)
                        infocenter  = try? container.decode(String.self, forKey: .infocenter)
                        expguide   = try? container.decode(String.self, forKey: .expguide)
                        chkpet   = try? container.decode(String.self, forKey: .chkpet)
                        chkbabycarriage   = try? container.decode(String.self, forKey: .chkbabycarriage)
                        firstmenu   = try? container.decode(String.self, forKey: .firstmenu)
                        infocenterfood   = try? container.decode(String.self, forKey: .infocenterfood)
                        opentimefood   = try? container.decode(String.self, forKey: .opentimefood)
                        reservationfood   = try? container.decode(String.self, forKey: .reservationfood)
                        treatmenu   = try? container.decode(String.self, forKey: .treatmenu)
                        roomcount   = try? container.decode(String.self, forKey: .roomcount)
                        checkintime   = try? container.decode(String.self, forKey: .checkintime)
                        checkouttime   = try? container.decode(String.self, forKey: .checkouttime)
                        reservationlodging   = try? container.decode(String.self, forKey: .reservationlodging)
                        infocenterculture   = try? container.decode(String.self, forKey: .infocenterculture)
                        usefee   = try? container.decode(String.self, forKey: .usefee)
                        restdateculture   = try? container.decode(String.self, forKey: .restdateculture)
                        usetimeculture   = try? container.decode(String.self, forKey: .usetimeculture)
                        infocenterleports   = try? container.decode(String.self, forKey: .infocenterleports)
                        restdateleports   = try? container.decode(String.self, forKey: .restdateleports)
                        usetimeleports   = try? container.decode(String.self, forKey: .usetimeleports)
                        infocenterlodging = try? container.decode(String.self, forKey: .infocenterlodging)
                        
                        if let x = try? container.decode(String.self, forKey: .roomcount) {
                            roomcount = x
                        }
                        else if let IntX = try? container.decode(Int.self, forKey: .roomcount)
                        {
                            roomcount = String(IntX)
                        }
                    }
                    
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
            rValue = self.resultTripDestination
            break
        case 1 :
            rValue = self.resultFood
            break
        case 2 :
            rValue = self.resultStay
            break
        case 3 :
            rValue = self.resultCulture
            break
        case 4 :
            rValue = self.resultLeports
            break
        default :
            print ("Error")
            break
        }
        return rValue
    }
    var resultTripDestination:  [PublicAPIResponse.HeaderWithBody.Body.Item.ItemInside] = []
    var resultFood :            [PublicAPIResponse.HeaderWithBody.Body.Item.ItemInside] = []
    var resultStay :            [PublicAPIResponse.HeaderWithBody.Body.Item.ItemInside] = []
    var resultCulture :         [PublicAPIResponse.HeaderWithBody.Body.Item.ItemInside] = []
    var resultLeports :         [PublicAPIResponse.HeaderWithBody.Body.Item.ItemInside] = []
    func settingAllZero(){
        self.resultFood = []
        self.resultStay = []
        self.resultCulture = []
        self.resultLeports = []
        self.resultTripDestination = []
    }
    /// 서버로 정보 요청
    func requestToServer() {
        var url : URL
        let authKey = "6N%2BwieYkPpXpi3hWL3wiKB9GHHU6tgsyFlxD0tSO4nyTbq3pVw3lCaZcvNp89oD7BnfJXP333QWeY4lOz5XDVA%3D%3D"
//        let authKey = "O3xXoWnFmOCepVS71Eu7ktSC%2B7Xi4vxbg97EySl%2FXGoUDd1Kbh%2Bw5SHhr0ZGfq8PwIAGeugkI20lMfSILFnjXA%3D%3D"
        let contentTypeId: [Int] = [12, 39, 28, 32, 14]
        var areaCode : Int = 1

        switch selectRegionSection {
        case 0:
            areaCode = 1 ///서울
            break
        case 1:
            areaCode = 2 /// 인천
            break
        case 2:
            areaCode = 3 /// 대전
            break
        case 3:
            areaCode = 4 /// 대구
            break
        case 4:
            areaCode = 5 /// 광주
            break
        case 5:
            areaCode = 6 /// 부산
            break
        case 6:
            areaCode = 7 /// 울산
            break
        case 7:
            areaCode = 32 ///강원도
            break
        case 8:
            areaCode = 31 ///경기도
            break
        case 9:
            areaCode = 36 ///경상남도
            break
        case 10:
            areaCode = 35 ///경상북도
            break
        case 11:
            areaCode = 38 ///전라남도
            break
        case 12:
            areaCode = 37 ///전라북도
            break
        case 13:
            areaCode = 34 ///충청남도
            break
        case 14:
            areaCode = 33 ///충청북도
            break
        case 15:
            areaCode = 39 ///제주도
            break 
        default :
            print ("selectRegionIndex Error")
            break
        }
        
        for typeId in contentTypeId {
            if (selectRegionIndex == 0 ){
                url = URL(string:"http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?MobileOS=IOS&MobileApp=Ayo~bro&ServiceKey=\(authKey)&_type=json&pageNo=1&numOfRows=20&contentTypeId=\(typeId)&areaCode=\(areaCode)&arrange=P")!
            }
            else{
                url = URL(string: "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?MobileOS=IOS&MobileApp=Ayo~bro&ServiceKey=\(authKey)&_type=json&pageNo=1&numOfRows=20&contentTypeId=\(typeId)&sigunguCode=\(selectRegionIndex)&areaCode=\(areaCode)&arrange=P")!
            }
            let result = try! String(contentsOf: url)
            let decoder = JSONDecoder()
            
            guard let value = try? decoder.decode(PublicAPIResponse.self, from: result.data(using: .utf8)!) else {
                print("불러오기 실패!!!")
                print(result)
                return
            }
            switch typeId {
            case 12:
                self.resultTripDestination = value.response.body.items.item
                break
            case 39:
                self.resultFood = value.response.body.items.item
                break
            case 28:
                self.resultLeports = value.response.body.items.item
                break
            case 32:
                self.resultStay = value.response.body.items.item
                break
            case 14:
                self.resultCulture = value.response.body.items.item
                break
            default:
                break
            }
            print (value)
            
        }
    }
    
    func requestForMoreData(numOfPage: Int, index: Int ) -> [PublicAPIResponse.HeaderWithBody.Body.Item.ItemInside]? {
            let authKey = "6N%2BwieYkPpXpi3hWL3wiKB9GHHU6tgsyFlxD0tSO4nyTbq3pVw3lCaZcvNp89oD7BnfJXP333QWeY4lOz5XDVA%3D%3D"
//        let authKey = "O3xXoWnFmOCepVS71Eu7ktSC%2B7Xi4vxbg97EySl%2FXGoUDd1Kbh%2Bw5SHhr0ZGfq8PwIAGeugkI20lMfSILFnjXA%3D%3D"
        var url : URL
        var areaCode : Int = 0
        var contentTypeId : Int = 0
        switch index {
        case 0:
            contentTypeId = 12
            break
        case 1:
            contentTypeId = 39
            break
        case 2:
            contentTypeId = 32
            break
        case 3:
            contentTypeId = 14
            break
        case 4:
            contentTypeId = 28
            break
        default:
            break
        }
        
        switch selectRegionSection {
        case 0:
            areaCode = 1 ///서울
            break
        case 1:
            areaCode = 2 /// 인천
            break
        case 2:
            areaCode = 3 /// 대전
            break
        case 3:
            areaCode = 4 /// 대구
            break
        case 4:
            areaCode = 5 /// 광주
            break
        case 5:
            areaCode = 6 /// 부산
            break
        case 6:
            areaCode = 7 /// 울산
            break
        case 7:
            areaCode = 32 ///강원도
            break
        case 8:
            areaCode = 31 ///경기도
            break
        case 9:
            areaCode = 36 ///경상남도
            break
        case 10:
            areaCode = 35 ///경상북도
            break
        case 11:
            areaCode = 38 ///전라남도
            break
        case 12:
            areaCode = 37 ///전라북도
            break
        case 13:
            areaCode = 34 ///충청남도
            break
        case 14:
            areaCode = 33 ///충청북도
            break
        case 15:
            areaCode = 39 ///제주도
            break
        default :
            print ("selectRegionIndex Error")
            break
        }
        if (selectRegionIndex == 0 ){
            url = URL(string:"http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?MobileOS=IOS&MobileApp=Ayo~bro&ServiceKey=\(authKey)&_type=json&pageNo=\(1 + numOfPage)&numOfRows=20&contentTypeId=\(contentTypeId)&areaCode=\(areaCode)&arrange=P")!
        }
        else{
            url = URL(string: "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?MobileOS=IOS&MobileApp=Ayo~bro&ServiceKey=\(authKey)&_type=json&pageNo=\(1 + numOfPage)&numOfRows=20&contentTypeId=\(contentTypeId)&sigunguCode=\(selectRegionIndex)&areaCode=\(areaCode)&arrange=P")!
        }
        let result = try! String(contentsOf: url)
        let decoder = JSONDecoder()
        let value = try? decoder.decode(PublicAPIResponse.self, from: result.data(using: .utf8)!)
        return value?.response.body.items.item
    }
    
}

let sharedModelPublicAPIDetail = PublicAPIDetail()

class PublicAPIDetail {
    func requestForDetail(contentId: Int) -> [PublicAPIResponseDetail.HeaderWithBody.Body.Item.ItemInside] {
        let authKey = "6N%2BwieYkPpXpi3hWL3wiKB9GHHU6tgsyFlxD0tSO4nyTbq3pVw3lCaZcvNp89oD7BnfJXP333QWeY4lOz5XDVA%3D%3D"
//        let authKey = "O3xXoWnFmOCepVS71Eu7ktSC%2B7Xi4vxbg97EySl%2FXGoUDd1Kbh%2Bw5SHhr0ZGfq8PwIAGeugkI20lMfSILFnjXA%3D%3D"
        let url = URL(string: "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?MobileOS=IOS&MobileApp=Ayo~bro&ServiceKey=\(authKey)&contentId=\(contentId)&mapinfoYN=Y&defaultYN=Y&firstImageYN=Y&_type=json&overviewYN=Y&addrinfoYN=Y")!
        let result = try! String(contentsOf: url)
        let decoder = JSONDecoder()
        let value = try! decoder.decode(PublicAPIResponseDetail.self, from: result.data(using: .utf8)!)
        
        return [value.response.body.items.item]
    }
}

let sharedModelPublicAPICommon = PublicAPICommon()

class PublicAPICommon {
    func requestForCommon(contentId: Int, contentTypeId: Int) -> [PublicAPIResponseCommon.HeaderWithBody.Body.Item.ItemInside]{
        let authKey = "6N%2BwieYkPpXpi3hWL3wiKB9GHHU6tgsyFlxD0tSO4nyTbq3pVw3lCaZcvNp89oD7BnfJXP333QWeY4lOz5XDVA%3D%3D"
//        let authKey = "O3xXoWnFmOCepVS71Eu7ktSC%2B7Xi4vxbg97EySl%2FXGoUDd1Kbh%2Bw5SHhr0ZGfq8PwIAGeugkI20lMfSILFnjXA%3D%3D"
        let url = URL(string: "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailIntro?MobileOS=IOS&MobileApp=Ayo~bro&ServiceKey=\(authKey)&contentId=\(contentId)&contentTypeId=\(contentTypeId)&_type=json")!
        let result = try! String(contentsOf: url)
        let decoder = JSONDecoder()
        let value = try! decoder.decode(PublicAPIResponseCommon.self, from: result.data(using: .utf8)!)
        
        return [value.response.body.items.item]
    }
}
