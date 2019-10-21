//
//  CommonModel.swift
//  Ayo~Bro
//
//  Created by GW_19 on 01/08/2019.
//  Copyright © 2019 GW_19. All rights reserved.
//

import Foundation
import UIKit

struct ScheduleByDay {
    let dayInfo:String
    let destinations:Array<String>
}

struct ScheculeByRegion {
    let regionName:String
    let schedules:Array<ScheduleByDay>
}

let seoul_Day1 = ScheduleByDay(dayInfo: "1일차", destinations: [ "서울여행지1", "서울여행지2", "서울여행지3" ])
let seoul_Day2 = ScheduleByDay(dayInfo: "2일차", destinations: [ "서울여행지4", "서울여행지5", "서울여행지6" ])
let seoul_Day3 = ScheduleByDay(dayInfo: "3일차", destinations: [ "서울여행지7", "서울여행지8", "서울여행지9" ])
let seoulEntireSchedule = ScheculeByRegion(regionName: "3박4일 서울여행", schedules: [ seoul_Day1, seoul_Day2, seoul_Day3 ])

let jeju_Day1 = ScheduleByDay(dayInfo: "1일차", destinations: [ "제주여행지1", "제주여행지2", "제주여행지3" ])
let jeju_Day2 = ScheduleByDay(dayInfo: "2일차", destinations: [ "제주여행지4", "제주여행지5", "제주여행지6" ])
let jeju_Day3 = ScheduleByDay(dayInfo: "3일차", destinations: [ "제주여행지7", "제주여행지8", "제주여행지9" ])
let jejuEntireSchedule = ScheculeByRegion(regionName: "4박 5일 제주도여행", schedules: [ jeju_Day1, jeju_Day2, jeju_Day3 ])

let busan_Day1 = ScheduleByDay(dayInfo: "1일차", destinations: [ "부산역", "개미집", "송도 케이블카", "감천문화마을", "광안리 해수욕장","퍼지네이블" ])
let busan_Day2 = ScheduleByDay(dayInfo: "2일차", destinations: [ "해동용궁사", "죽성드림성당", "기장카페", "누리마루APEC", "더베이 101" ])
let busan_Day3 = ScheduleByDay(dayInfo: "3일차", destinations: [ "재기돼지국밥", "태종대", "국제시장", "보수동 책방거리", "초량밀면", "부산역" ])
let busanEntireSchedule = ScheculeByRegion(regionName: "2박 3일 부산여행", schedules: [ busan_Day1, busan_Day2, busan_Day3 ])

struct RegionInfomation {
    let region:String
    let Explain:String
    let image:UIImage?
}

struct MyRegionInfo {
    let RegionInformation:Array<RegionInfomation> = [RegionInfomation(region: "서울", Explain: "서울서울서울서울서울서울.", image: UIImage(named: "seoul")),
                                                RegionInfomation(region: "제주", Explain: "제주제주제주제주제주제주.", image: UIImage(named: "jeju")),
                                                RegionInfomation(region: "부산", Explain: "부산부산부산부산부산부산.", image: UIImage(named: "busan"))]
    var selectedIndex = -1
}

var regionRegion = MyRegionInfo()

class Area {
    var BigScope:String
    var SmallScope:String
    
    init() {
        self.BigScope="대구분"
        self.SmallScope="소구분"
    }
}











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
