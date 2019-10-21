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

let update1 = NoticeList(smallInfo: "공지사항", bigInfo: "앱 런칭 안내 !", dateInfo: "2019.10.02",textInfo: "여~행님은 뚜벅이 여행에 최적화 된 코스 메이커 입니다. 행님과 함께 최고의 여행 계획을 세워 봅시다! \n\n여행 계획을 세울 때\n뚜벅이 여행을 떠나고 싶을 때\n코스를 한눈에 보고싶을 때\n여~행님과 함께해요~\n\n- 가고싶은 여행지 즐겨찾기 기능\n- 즐겨찾기 한 여행지를 중심으로 코스 생성\n- 코스 생성시 대중교통정보 제공\n- 코스 생성 및 저장 기능\n- 사용자가 선택한 여행지를 지도에 표시해주는 서비스")
let arrUpdate:Array<NoticeList> = [update1]




