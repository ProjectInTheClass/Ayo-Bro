//
//  DetailInfoViewController.swift
//  Ayo~Bro
//
//  Created by 전정준 on 22/09/2019.
//  Copyright © 2019 GW_19. All rights reserved.
//

import Foundation
import UIKit
import MapKit

var originData : PublicAPIResponse.HeaderWithBody.Body.Item.ItemInside?



class DetailInfoViewController : UIViewController {
    //    var originData : PublicAPIResponse.HeaderWithBody.Body.Item.ItemInside?
    var detailInfo: [PublicAPIResponseDetail.HeaderWithBody.Body.Item.ItemInside] = []
    var commonInfo: [PublicAPIResponseCommon.HeaderWithBody.Body.Item.ItemInside] = []
    var contentId : Int!
    var contentTypeId : Int!
    @IBOutlet var DetailInfoView: UITableView!
    
    @IBOutlet weak var viewMap: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //    override func viewDidAppear(_ animated: Bool) {
    //        super.viewDidAppear(animated)
    //
    //        let contentId = originData?.contentid
    //        let detailInfo = sharedModelPublicAPIDetail.requestForDetail(contentId: contentId!).first!
    //
    ////        let coor2d = CLLocationCoordinate2D(latitude: detailInfo.mapy, longitude: detailInfo.mapx)
    ////        let span = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    ////        let region = MKCoordinateRegion(center: coor2d, span: span)
    ////        self.viewMap.setRegion(region, animated: true)
    //    }
}

extension DetailInfoViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : DetailInfoTableViewCell
        contentId = homeContentId
        contentTypeId = homeContentTypeId
        let detailInfo = sharedModelPublicAPIDetail.requestForDetail(contentId: contentId!)
        let detailData = detailInfo[0]
        let commonInfo = sharedModelPublicAPICommon.requestForCommon(contentId: contentId!, contentTypeId: contentTypeId!)
        var commonData = commonInfo[0]
        if (indexPath.row == 0){
            let queueSub = OperationQueue()
            cell = tableView.dequeueReusableCell(withIdentifier: "detailInfoCell0") as! DetailInfoTableViewCell
            cell.title.text = detailData.title
            if let stringURL = detailData.firstimage {
                let url = URL(string: stringURL)!
                queueSub.addOperation {
                    if let image = try? Data(contentsOf: url){
                        OperationQueue.main.addOperation {
                            cell.firstImage.image = UIImage(data: image)
                        }
                    }
                    else {
                        cell.firstImage.image = UIImage(named: "defaultImage2")
                    }
                }
            }
            else {
                cell.firstImage.image = UIImage(named: "defaultImage2")
            }
        }
        else if (indexPath.row == 1){
            
            cell = tableView.dequeueReusableCell(withIdentifier: "detailInfoCell1") as! DetailInfoTableViewCell
            let explain = detailData.overview!.components(separatedBy: ["<","b","r","\\","n",">","\n","/","s","t","o","g"]).joined() /// 문자열 쪼개고 합치기
            let realExplain = explain.components(separatedBy: ".") /// 다시 쪼갬
            cell.sangse.text = "상세설명"
            if (realExplain.count > 3){
                if (realExplain[0].count + realExplain[1].count + realExplain[2].count + realExplain[3].count < 200){
                    cell.explain.text = realExplain[0] + "." + realExplain[1] + "." + realExplain[2] + "." + realExplain[3] + "."
                }
                else if (realExplain[0].count + realExplain[1].count + realExplain[2].count < 200){
                    cell.explain.text = realExplain[0] + "." + realExplain[1] + "." + realExplain[2] + "."
                }
                else if (realExplain[0].count + realExplain[1].count < 200){
                    cell.explain.text = realExplain[0] + "." + realExplain[1] + "."
                }
                else {
                    cell.explain.text = realExplain[0] + "."
                }
            }
            else if (realExplain.count == 3) {
                if (realExplain[0].count + realExplain[1].count + realExplain[2].count < 200){
                    cell.explain.text = realExplain[0] + "." + realExplain[1] + "." + realExplain[2] + "."
                }
                else if (realExplain[0].count + realExplain[1].count < 200){
                    cell.explain.text = realExplain[0] + "." + realExplain[1] + "."
                }
                else {
                    cell.explain.text = realExplain[0] + "."
                }
            }
            else if (realExplain.count == 2){
                if (realExplain[0].count + realExplain[1].count < 200){
                    cell.explain.text = realExplain[0] + "." + realExplain[1] + "."
                }
                else {
                    cell.explain.text = realExplain[0] + "."
                }
            }
            else if (realExplain.count == 1){
                cell.explain.text = realExplain[0] + "."
            }
            else {
                cell.explain.text = "설명 없음"
            }
            //            else{
            //                if (realExplain[0].count + realExplain[1].count < 200){
            //                    cell.explain.text = realExplain[0] + "." + realExplain[1] + "."
            //                }
            //                else {
            //                    cell.explain.text = realExplain[0] + "."
            //                }
        }
        else{
            cell = tableView.dequeueReusableCell(withIdentifier: "detailInfoCell2") as! DetailInfoTableViewCell
            if (contentTypeId == 12){
                if (commonData.usetime == nil || commonData.usetime?.count == 0){
                    cell.explain1.text = "이용 시간 : 정보 없음"
                }
                else{
                    cell.explain1.text = "이용 시간 : " + commonData.usetime!.components(separatedBy:["<","b","r","\\","n",">","\n","/","s","t","o","g"]).joined()
                }
                if (commonData.expguide == nil || commonData.expguide?.count == 0){
                    cell.explain2.text = "체험 안내 : 정보 없음"
                }
                else {
                    if(commonData.expguide!.count > 200){
                        commonData.expguide = (commonData.expguide!.components(separatedBy: ["<","b","r","\\","n",">","\n","/","s","t","o","g"]).joined())
                        let realExpguide = commonData.expguide!.components(separatedBy: ".")
                        if(realExpguide.count >= 2){
                            cell.explain2.text = "체험 안내 : " + realExpguide[0] + "." + realExpguide[1] + "."
                        }
                        else {
                            cell.explain2.text = "체험 안내 : " + realExpguide[0] + "."
                        }
                    }
                    else{
                    cell.explain2.text = "체험 안내 : " + commonData.expguide!.components(separatedBy:["<","b","r","\\","n",">","\n","/","s","t","o","g"]).joined()
                    }
                }
                if (commonData.chkpet == nil){
                    cell.explain3.text = "애완동물 동반가능 여부 : 정보 없음"
                }
                else{
                    cell.explain3.text = "애완동물 동반가능 여부 : " + commonData.chkpet!
                }
                cell.explain4.text = "주소 : " + detailData.addr1!
                if let infoCenter = commonData.infocenter {
                    cell.explain5.text = "문의 및 안내 : " + commonData.infocenter!.components(separatedBy:["<","b","r","\\","n",">","\n","/","s","t","o","g"]).joined()
                }
                else {
                    cell.explain5.text = "문의 및 안내 : 정보 없음"
                }
            }
            else if (contentTypeId == 39){
                if (commonData.firstmenu == nil ){
                    cell.explain1.text = "대표 메뉴 : 정보 없음"
                }
                else{
                    cell.explain1.text = "대표 메뉴 : " + commonData.firstmenu!
                }
                if(commonData.treatmenu == nil){
                    cell.explain2.text = "메뉴 목록 : 정보 없음"
                }
                else {
                    cell.explain2.text = "메뉴 목록 : " + commonData.treatmenu!.components(separatedBy:["<","b","r","\\","n",">","\n","/","s","t","o","g"]).joined()
                }
                if(commonData.opentimefood == nil){
                    cell.explain3.text = "영업 시간 : 정보 없음"
                }
                else{
                    cell.explain3.text = "영업 시간 : " + commonData.opentimefood!.components(separatedBy:["<","b","r","\\","n",">","\n","/","s","t","o","g"]).joined()
                }
                cell.explain4.text = "주소 : " + detailData.addr1!
                if (commonData.infocenterfood == nil){
                    cell.explain5.text = "문의 및 안내 : 정보 없음"
                }
                else {
                    cell.explain5.text = "문의 및 안내 : " + commonData.infocenterfood!
                }
            }
            else if (contentTypeId == 32){
                if (commonData.roomcount?.count == 0){
                    cell.explain1.text = "객실 수 : 전화 문의 바람"
                }
                else{
                    cell.explain1.text = "객실 수 : " + commonData.roomcount!
                }
                if (commonData.checkintime == nil){
                    cell.explain2.text = "체크인 시간 : 전화 문의 바람"
                }
                else{
                    cell.explain2.text = "체크인 시간 : " + commonData.checkintime!
                }
                if (commonData.checkouttime == nil){
                    cell.explain3.text = "체크아웃 시간 : 전화 문의 바람"
                }
                else {
                    cell.explain3.text = "체크아웃 시간 : " + commonData.checkouttime!
                }
                if (detailData.addr1 == nil){
                    cell.explain4.text = "주소 : 전화 문의 바람"
                }
                else{
                    cell.explain4.text = "주소 : " + detailData.addr1!
                }
                if (commonData.reservationlodging == nil){
                    cell.explain5.text = "문의 및 안내 : 정보 없음"
                }
                else{
                    cell.explain5.text = "문의 및 안내 : " + commonData.reservationlodging!
                }
                
            }
            else if (contentTypeId == 14){
                if (commonData.restdateculture == nil){
                    cell.explain1.text = "휴무일 : 정보 없음"
                }
                else {
                    cell.explain1.text = "휴무일 : " + commonData.restdateculture!
                }
                if(commonData.usefee == nil){
                    cell.explain2.text = "이용 요금 : 정보 없음"
                }
                else{
                    cell.explain2.text = "이용 요금 : " + commonData.usefee!
                }
                if (commonData.usetimeculture == nil){
                    cell.explain3.text = "이용 시간 : 정보 없음"
                }
                else{
                    cell.explain3.text = "이용 시간 : " + commonData.usetimeculture!
                }
                cell.explain4.text = "주소 : " + detailData.addr1!
                if (commonData.infocenterculture == nil){
                    cell.explain5.text = "문의 및 안내 : 정보 없음"
                }
                else{
                    cell.explain5.text = "문의 및 안내 : " + commonData.infocenterculture!
                }
            }
            else {
                if (commonData.usetimeleports == nil){
                    cell.explain1.text = "휴무일 : 정보 없음"
                }
                else{
                    cell.explain1.text = "휴무일 : " + commonData.usetimeleports!
                }
                if (commonData.restdateleports == nil){
                    cell.explain2.text = "이용 시간 : 정보 없음"
                }
                else {
                    cell.explain2.text = "이용 시간 : " + commonData.restdateleports!
                }
                cell.explain3.text = "주소 : " + detailData.addr1!
                if (commonData.infocenterleports == nil){
                    cell.explain4.text = "문의 및 안내 : 정보 없음"
                }
                else{
                    cell.explain4.text = "문의 및 안내 : " + commonData.infocenterleports!
                }
                cell.explain5.text = nil
            }
        }
        //        else {
        //            cell = tableView.dequeueReusableCell(withIdentifier: "detailInfoCell3") as! DetailInfoTableViewCell
        //
        //
        ////            let storyboard = UIStoryboard.init(name: "Home", bundle: nil)
        ////            var activityViewController: KakaoMapViewController?
        ////
        ////            var activityView: UIView?
        ////
        ////
        ////            activityViewController = (storyboard.instantiateViewController(withIdentifier: "KakaoMapViewController") as! KakaoMapViewController)
        ////            activityView = activityViewController?.view
        ////
        ////            cell.addSubview(activityView!)
        ////
        //        }
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let contentTypeId = originData?.contenttypeid
        if (indexPath.row == 0){
            return 275
        }
        else if (indexPath.row == 1){
            return 150
        }
        else {
            if(contentTypeId == 32){
                return 170
            }
            else if (contentTypeId == 39){
                return 190
            }
            else {
                return 270
            }
        }
        
    }
}
