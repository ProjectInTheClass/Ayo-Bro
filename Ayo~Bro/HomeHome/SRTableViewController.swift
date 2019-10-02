//
//  SRTableViewController.swift
//  Ayo~Bro
//
//  Created by A09 on 02/10/2019.
//  Copyright © 2019 GW_19. All rights reserved.
//
struct LastRecommend {
    var title : String
    var regionName : String
    var recommend : Array<Recommend>
}

struct Recommend {
    var detail : Array<Detail>
}

struct Detail {
    var title : String
    var mapx : Double
    var mapy : Double
    var addr1 : String
}

var recommnedArray = [LastRecommend(title: "행님이 정하는 부산여행코스",regionName : "부산광역시", recommend: [Recommend(detail:
    [Detail(title:"부산역",mapx:129.042200,mapy:35.115418,addr1:"부산광역시 동구 중앙대로 206"),
     Detail(title:"황산밀면",mapx:129.039255,mapy:35.112421,addr1:"부산광역시 동구 초량동 1212-5"),
    Detail(title:"해동용궁사",mapx:129.223407,mapy:35.188788,addr1:"부산광역시 기장군 기장읍 용궁길 86 해동용궁사"),
    Detail(title:"카페윤",mapx:129.211281,mapy:35.181912,addr1:"부산광역시 기장군 기장읍 기장해안로 34-16"),
    Detail(title:"오륙도 스카이워크",mapx:129.124488,mapy:35.100801,addr1:"부산광역시 남구 오륙도로 137"),
    Detail(title:"이기대 수변공원",mapx:129.121024,mapy:35.132518,addr1:"부산광역시 남구 용호동 산25"),
    Detail(title:"광안리",mapx:129.118715,mapy:35.153355,addr1:"부산광역시 수영구 광안해변로 219"),
    Detail(title:"갈삼구이",mapx:129.124177,mapy:35.155458,addr1:"부산광역시 수영구 민락수변로 7")
    ]),

                                                                                                                                Recommend(detail: [
        Detail(title:"이가네 떡볶이", mapx:129.026001, mapy:35.101556, addr1:"부산광역시 해운대구 해운대해변로 140"),
        Detail(title:"태종대", mapx:129.087243, mapy:35.053412, addr1:"부산광역시 영도구 전망로 24 "),
        Detail(title:"카페 비토닉", mapx:129.076721, mapy:35.087614, addr1:"부산광역시 영도구 동삼동 201-2 "),
        Detail(title:"국제시장 거인통닭",mapx:129.026115,mapy:35.102639,addr1:"부산광역시 중구 중구로47번길 34"),
        Detail(title:"감천 문화마을",mapx:129.010549,mapy:35.097636,addr1:"부산광역시 사하구 감내2로 203 감천문화마을안내센터"),
        Detail(title:"본전돼지국밥",mapx:129.041264,mapy:35.116939,addr1:"부산광역시 동구 중앙대로214번길 3-8 ")
        ]),
    Recommend(detail: [Detail(title:"삼진어묵",mapx:129.042890,mapy:35.093437,addr1:"부산광역시 영도구 태종로99번길 36"),
        Detail(title:"동백공원",mapx:129.151923,mapy:35.153793,addr1:"부산광역시 해운대구 우동"),
        Detail(title:"해운대",mapx:129.160373,mapy:35.158882,addr1:"부산광역시 해운대구 우동"),
        Detail(title:"본전돼지국밥",mapx:129.041264,mapy:35.116939,addr1:"부산광역시 동구 중앙대로214번길 3-8"),
        Detail(title:"카페 초량1941",mapx:129.029365,mapy:35.120809,addr1:"부산광역시 동구 망양로 533-5"),
        Detail(title:"이바구길",mapx:129.036597,mapy:35.117265,addr1:"부산광역시 동구 초량상로 49")
        ])]),
    LastRecommend(title: "떠나요~ 둘이서~ 제주도여행코스",regionName : "제주도", recommend:
        [Recommend(detail:
                            [Detail(title: "제주러브랜드", mapx: 126.4883911640, mapy: 33.4521072871, addr1: "제주특별자치도 제주시 1100로 2894-72"),
                             Detail(title: "동문재래시장", mapx: 126.5260587646, mapy: 33.5115624162, addr1: "제주특별자치도 제주시 관덕로14길 20")
            ]),
        Recommend(detail:[
            Detail(title: "비자림", mapx: 126.8074904603, mapy: 33.4862530625, addr1: "제주특별자치도 제주시 구좌읍 비자숲길"),
            Detail(title: "월정리해변", mapx: 126.7983896767, mapy: 33.5546536829, addr1: "제주특별자치도 제주시 구좌읍 해맞이해안로 480-1"),
            Detail(title: "살맛나는밥상", mapx: 126.930624, mapy: 33.467060, addr1: "제주특별자치도 서귀포시 성산읍 성산등용로 44"),
            Detail(title: "카페코지", mapx: 126.9292914270, mapy: 33.4682431337, addr1: "제주특별자치도 서귀포시 성산읍 한도로 200"),
            Detail(title: "성산일출봉 [유네스코 세계자연유산]", mapx: 126.9415156012, mapy: 33.4581111174, addr1: "제주특별자치도 서귀포시 성산읍 일출로 284-12"),
            Detail(title: "제주일도국수", mapx: 126.530659, mapy: 33.507240, addr1: "제주특별자치도 제주시 삼성로 49")
        ]),
        Recommend(detail:
            [Detail(title: "쇠소깍", mapx: 126.6231006558, mapy: 33.2521787368, addr1: "제주특별자치도 서귀포시 쇠소깍로 128"),
            Detail(title: "서귀포매일올레시장", mapx: 126.5632725518, mapy: 33.2501307908, addr1: "제주특별자치도 서귀포시 중앙로62번길 18"),
            Detail(title: "정방폭포", mapx: 126.5634499526, mapy: 33.2662179071, addr1: "제주특별자치도 서귀포시 칠십리로214번길"),
            Detail(title: "천지연폭포 (제주도 국가지질공원)", mapx: 126.5594730066, mapy: 33.2445341254, addr1: "제주특별자치도 서귀포시 천지동"),
            Detail(title: "정성듬뿍 제주국", mapx: 126.520295, mapy: 33.514038, addr1: "제주특별자치도 제주시 삼도2동 1069-2"),
            Detail(title: "용두암", mapx: 126.5119710049, mapy: 33.5158033889, addr1: "제주특별자치도 제주시 용두암길")
]),
        Recommend(detail:
            [Detail(title: "하멜상선전시관", mapx: 126.9235704646, mapy: 33.4351022575, addr1: "제주특별자치도 서귀포시 성산읍 섭지코지로 88"),
            Detail(title: "용머리해안", mapx: 126.3145222990, mapy: 33.2322593962, addr1: "제주특별자치도 서귀포시 안덕면 산방로 218-10"),
            Detail(title: "레이지박스", mapx: 126.312945, mapy: 33.236437, addr1: "제주특별자치도 서귀포시 안덕면 산방로 208"),
            Detail(title: "한림 해촌", mapx: 33.393638, mapy: 126.239906, addr1: "제주특별자치도 제주시 한림읍 한림로 329-6"),
            Detail(title: "한림공원", mapx: 126.2415557152, mapy: 33.3886659647, addr1: "제주특별자치도 제주시 한림읍 한림로 300"),
            Detail(title: "곽지과물해변", mapx: 126.3046460715, mapy: 33.4502629165, addr1: "제주특별자치도 제주시 애월읍 금성5길"),
            Detail(title: "하이엔드제주", mapx: 126.309680, mapy: 33.462820, addr1: "제주특별자치도 제주시 애월읍 애월북서길 56")]
            )
        ]),
    LastRecommend(title: "전주한옥마을 먹거리 볼거리!",regionName : "전라북도 전주시", recommend: [
        Recommend(detail:[
            Detail(title:"전주한옥마을",mapx:127.153510,mapy:35.815600,addr1:"전라북도 전주시 완산구 풍남동3가 기린대로 99"),
            Detail(title:"전동성당",mapx:127.149363,mapy:35.813555,addr1:"전라북도 전주시 완산구 전동 태조로 51"),
            Detail(title:"풍남문",mapx:127.147593,mapy:35.813755,addr1:"전라북도 전주시 완산구 풍남동 풍남문3길 1"),
            Detail(title:"남부시장",mapx:127.146949,mapy:35.812827,addr1:"전라북도 전주시 완산구 풍남동 풍남문1길 19-3"),
            Detail(title:"베테랑",mapx:127.151383,mapy:35.813734,addr1:"전라북도 전주시 완산구 교동 85-1")
            ]),
        Recommend(detail: [Detail(title:"전주다문",mapx:127.152312,mapy:35.813853,addr1:"전라북도 전주시 완산구 교동 82"),
        Detail(title:"전주객리단길",mapx:127.143872,mapy:35.817874,addr1:"전라북도 전주시 완산구 중앙동2가 10-1")
        ])
        ])
]

import UIKit
var recommendIndex = 0
class SRTableViewController: UITableViewController {
    
    var selectedIndex:Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        recommendcurrent=0
        currentRecommendControllerIndex=0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recommnedArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableCell", for: indexPath) as! SRTableViewCell
        cell.textLabel?.font = UIFont(name: "NanumSquareRoundOTFB", size: 14)
        cell.topLabel.text = recommnedArray[indexPath.row].title
        cell.bottomLabel.text = "\(recommnedArray[indexPath.row].regionName)"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedIndex = indexPath.row
        recommendIndex = indexPath.row
    }
    
}
