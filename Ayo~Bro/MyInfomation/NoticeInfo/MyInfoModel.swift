//
//  MyInfoModel.swift
//  Ayo~Bro
//
//  Created by GW_19 on 01/08/2019.
//  Copyright © 2019 GW_19. All rights reserved.
//

import Foundation
import UIKit

struct NoticeList {
    let smallInfo:String
    let bigInfo:String
    let dateInfo:String
    let textInfo:String
}

let update1 = NoticeList(smallInfo: "업데이트", bigInfo: "업데이트 안내 !", dateInfo: "2019.06.19",textInfo: "기존의 UI를 변경하였습니다.")
let update2 = NoticeList(smallInfo: "공지사항", bigInfo: "공지사항 안내 !", dateInfo: "2019.07.21",textInfo: "정기점검 일정 안내 : 07.23일 15시 ~ 17시")
let update3 = NoticeList(smallInfo: "업데이트", bigInfo: "업데이트 안내 !", dateInfo: "2019.07.25", textInfo: "새로운 기능을 추가하였습니다.")
let arrUpdate:Array<NoticeList> = [update3, update2,update1]




