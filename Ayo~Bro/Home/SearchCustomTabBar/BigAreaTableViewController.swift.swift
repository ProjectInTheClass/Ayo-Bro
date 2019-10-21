//
//  BigAreaTableViewController.swift
//  Ayo~Bro
//
//  Created by GW_19 on 08/08/2019.
//  Copyright © 2019 GW_19. All rights reserved.
//

struct RRArray {
    var isExpanded : Bool
    var bigArea : String
    var middleArea : Array<String>
}

var BigAreaArray : Array<RRArray>? = [
    
    RRArray(isExpanded: false, bigArea: "서울특별시", middleArea: ["서울전체", "강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구", "마포구", "서대문구", "서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구"]),
    
    RRArray(isExpanded: false, bigArea: "인천광역시", middleArea:["인천전체","강화군","계양구","미추홀구","남동구","동구","부평구","서구","연수구","웅진군","중구"]),
    
    RRArray(isExpanded: false, bigArea: "대전광역시", middleArea: ["대전전체","대덕구","동구","서구","유성구","중구"]),
    
    RRArray(isExpanded: false, bigArea: "대구광역시", middleArea: ["대구전체","남구","달서구","달성군","동구","북구","서구","수성구","중구"]),
    
    RRArray(isExpanded: false, bigArea: "광주광역시", middleArea: ["광주전체","광산구","남구","동구","북구","서구"]),
    
    RRArray(isExpanded: false, bigArea: "부산광역시", middleArea: ["부산전체","강서구","금정구","가장군","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구"]),
    
    RRArray(isExpanded: false, bigArea: "울산광역시", middleArea: ["울산전체","중구","남구","동구","북구"]),
    
    RRArray(isExpanded: false, bigArea: "강원도", middleArea: ["강원도전체", "강릉시", "고성군", "동해시", "삼척시", "속초시", "양구군", "양양군", "영월군", "원주시", "인제군", "정선군", "철원군", "춘천시", "태백시", "평창군", "홍천군", "화천군", "횡성군" ]),
    
    RRArray(isExpanded: false, bigArea: "경기도", middleArea: ["경기도전체", "가평군", "고양시", "과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","양평군","여주시","연천군","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시"]),
    
    RRArray(isExpanded: false, bigArea: "경상남도", middleArea: ["경상남도전체","거제시","거창군","고성군","김해시","남해군","마산시","밀양시","사천시","산청군","양산시","의령군","진주시","진해시","창녕군","창원시","통영시","하동군","함안군","함양군","합천군"]),
    
    RRArray(isExpanded: false, bigArea: "경상북도", middleArea: ["경상북도전체","경산시","경주시","고령군","구미시","군위군","김천시","문경시","봉화군","상주시","성주군","안동시","영덕군","영양군","영주시","영천시","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군","포항시"]),
    
    RRArray(isExpanded: false, bigArea: "전라남도", middleArea: ["전라남도전체","강진군","고흥군","곡성군","광양시","구례군","나주시","담양군","목포시","무안군","보성군","순천시","신안군","여수시","영광군","영암군","완도군","장성군", "장흥군","진도군","함평군","해남군","화순군"]),
    
    RRArray(isExpanded: false, bigArea: "전라북도", middleArea: ["전라북도전체","고창군","군산시","김제시","남원시","무주군","부안군","순창군","완주군","익산시","임실군","장수군","전주시","정읍시","진안군"]),
    
    RRArray(isExpanded: false, bigArea: "충청남도", middleArea: ["충청남도전체", "공주시","금산군","논산군","당진시","보령시","부여군","서산시","서천군","아산시","예산군","천안시","청양군","태안군","홍성군","계룡시"]),
    
    RRArray(isExpanded: false, bigArea: "충청북도", middleArea: ["충청북도전체","괴산군","단양군","보은군","영동군","옥천군","음성군","제천시","진천군","청원군","청주시","충주시","증평군"]),
    
    RRArray(isExpanded: false, bigArea: "제주도", middleArea: ["제주도전체","남제주군","북제주군","서귀포시","제주시"])
    
]

import UIKit
var selectRegionIndex : Int = 0
var selectRegionSection : Int = 0
class BigAreaTableViewController: UITableViewController {
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func Cancell(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectRegionIndex = indexPath.row
        selectRegionSection = indexPath.section
        sharedModelPublicAPI.settingAllZero()
        sharedModelPublicAPI.requestToServer()
        
        NotificationCenter.default.post(name: NSNotification.Name("NOTI_SEARCH_DIDSELECT"), object:nil)
        
        self.dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let button = UIButton(type: .system)
        button.setTitle(BigAreaArray![section].bigArea, for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
//        button.backgroundColor = UIColor.yellow
        button.titleLabel?.font = UIFont(name: "NanumSquareRoundOTFB", size: 16)
        
        button.addTarget(self, action: #selector(handleExpandClose), for: .touchUpInside)
        
        button.tag = section
        
        return button
    }
    
    @objc func handleExpandClose(button: UIButton) {
        
        let section = button.tag
        
        var indexPaths = [IndexPath]()
        for row in BigAreaArray![section].middleArea.indices {
            let indexPath = IndexPath(row: row, section: section)
            indexPaths.append(indexPath)
        }
        
        let isExpanded = BigAreaArray![section].isExpanded
        BigAreaArray![section].isExpanded = !isExpanded
        
        //        button.setTitle(isExpanded ? "Open" : "Close", for: .normal)
        
        if isExpanded {
            tableView.deleteRows(at: indexPaths, with: .fade)
        } else {
            tableView.insertRows(at: indexPaths, with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 36
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return BigAreaArray!.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !BigAreaArray![section].isExpanded {
            return 0
        }
        
        return BigAreaArray![section].middleArea.count

    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let contact = BigAreaArray![indexPath.section].middleArea[indexPath.row]
        cell.textLabel?.text = contact
        cell.textLabel?.font = UIFont(name: "NanumSquareRoundOTFR", size: 14)
        cell.textLabel?.textAlignment = .center
        cell.backgroundColor = UIColor(red: 249.0/255, green: 249.0/255, blue: 254.0/255, alpha: 1.0)
    
        return cell
    }
    
    

}
