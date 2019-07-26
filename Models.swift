//
//  File.swift
//  Ayo~Bro
//
//  Created by GW_19 on 23/07/2019.
//  Copyright © 2019 GW_19. All rights reserved.
//

import Foundation

struct Destination {
    let Destination:[Int: [String]]
}

let Busan_Destination = Destination(Destination: [1 : ["광안리 해수욕장", "부산역", "순대국밥"],
                                                  2 : ["밀면","부산여행지1","부산여행지2"]
    ])

let JejuIsland_Destination = Destination(Destination: [1 : ["제주도여행지1","제주도여행지2","제주도여행지3"],
                                                       2 : ["제주도여행지4","제주도여행지5","제주도여행지6"]
    ])



struct LocationInfo {
    let LocationInfo:[String: [String]]
}

let Seoul_LocationInfo = LocationInfo(LocationInfo: ["서울" : ["서울전체","강남/서초","강동/송파","강서/양천","구로/영등포","금천/관약/동작","동대문/성동","중랑/광진","도봉/노원/강북/성북","종로/중구/용산","은평/서대문/마포"]])
let Gyeonggi_LocationInfo = LocationInfo(LocationInfo: ["경기" : ["경기전체","가평/양평","남양주/구리/하남","성남/광주","수원/용인","이천/여주","부천/광명","의정부/양주/동두천","포천/연청","김포/고양/파주","안양/군포/의왕/과천","시흥/안산","화성/오산","평택/안성"]])
let Incheon_LocationInfo = LocationInfo(LocationInfo: ["인천" : ["인천전체","부평구/서구/계양구/동구","남구/남동구/연수구","강화/중구/옹진"]])
let Gangwon_LocationInfo = LocationInfo(LocationInfo: ["강원" : ["강원전체","춘천/홍천","강릉/동해/삼척/태백","평창/정선/영월","양양/속초","인제/양구/고성","철원/화천","원주/횡성"]])
let Chungbuk_Daejeon_LocationInfo = LocationInfo(LocationInfo: ["충북/대전" : ["충북/대전전체","대전-유성구/중구/서구","대전-동구/대덕구","충주/제천/단양","음성/진천","증평/괴산","청주/보은/옥천/영동"]])
let Chungnam_Sejong_LocationInfo = LocationInfo(LocationInfo: ["충남/세종":["충남/세종전체","태안/서산","당진/아산/예산","보령/홍선/청양","부여/서천","논산/계릉/공주/금산","천안/세종"]])
let Busan_LocationInfo = LocationInfo(LocationInfo: ["부산" : ["부산전체","해운대/수영/기장","동래/연제/북구/금정","부산진/동구/남구","강서/사하/사상","영도/서구/중구"]])
let Gyungbuk_Daegu_LocationInfo = LocationInfo(LocationInfo: ["경북/대구" : ["경북/대구전체","대구-북구/동구/서구","대구-수성구/중구/남구","대구-달서구/달성군","포항/경주","울진/울릉/봉화","문경/상주","안동/의성/영주/예천","구미/김천","영천/경산/청도","영덕/영양/청송","군위/칠곡/성주/고령"]])
let Gyungnam_Ulsan_LocationInfo = LocationInfo(LocationInfo: ["경남/울산" : ["경남/울산전체","통영/거제","남해/사천","거창/함양/합천","창원","김해/양산/밀양","진주/고성","산천/하동","창녕/의령/함안","울산"]])
let Jeonbuk_LocationInfo = LocationInfo(LocationInfo: ["전북" : ["전북전체","부안/김제","정읍/고창","임실/장수","무주/진안","군산/익산","전주/완주"]])
let Jeonnam_Gwangju_LocationInfo = LocationInfo(LocationInfo: ["전남/광주" :["전남/광주전체","광주","여수/순천/광양","목포/신안/무안","해남/진도/완도","보성/고흥","영광/함평/장성","담양/곡성/구례","나주/화순","영암/장흥/강진"]])
let JeJuIsland_LocationInfo = LocationInfo(LocationInfo: ["제주도" : ["제주전체","서귀포시","제주시"]])

//여러개의 섹션을 가지는 테이븗뷰

//let arrayLocation:




//
//struct Place {
//    var name:String
//}
//struct TripPlan {
//    var time:Int
//}


//import UIKit
//import MapKit
//class MapViewController : UIViewController {
//    override func numberOFSections(in tableView: UITableVuew) -> Int {
//        return 1
//    }
//    override func tableView(_ tableView: UITableview, numberOfRowsInSection section: Int) -> Int{
//        return 100
//    }
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->UITableViewCell {
//        let cell = UITableViewCell(style: .value1 , reuseIdentifier)
//    }
//
//}


class Area {
    var BigScope:String
    var SmallScope:String
    
    init() {
        self.BigScope="대구분"
        self.SmallScope="소구분"
    }
}
