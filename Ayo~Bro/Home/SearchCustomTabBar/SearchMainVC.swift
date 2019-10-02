//
//  MainVC.swift
//  CustomTabBar
//
//  Created by 이동건 on 2018. 4. 18..
//  Copyright © 2018년 이동건. All rights reserved.
//

import UIKit
var indexRow:Int = 0
class SearchMainVC: UIViewController, SearchCustomMenuBarDelegate{
    
    var RRArray = ["서울","인천","대전","대구","광주","부산","울산", "강원도", "경기도", "경상남도", "경상북도", "전라남도", "전라북도", "충청남도", "충청북도", "제주도"]
    @IBOutlet var regionButton: UIButton!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        regionButton.setTitleColor(UIColor.white, for: .normal)
        if (selectRegionIndex != 0){
            regionButton.setTitle("\(BigAreaArray![selectRegionSection].bigArea) " + "\(BigAreaArray![selectRegionSection].middleArea[selectRegionIndex])", for: .normal)
        }
        else{
            regionButton.setTitle("\(BigAreaArray![selectRegionSection].bigArea)", for: .normal)
        }
        
    }
    //MARK: Outltes
    var pageCollectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 100, height: 100), collectionViewLayout: collectionViewLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    var customMenuBar = SearchCustomMenuBar()
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        title = "검색"
        navigationController?.hidesBarsOnSwipe = false
        setupCustomTabBar()
        setupPageCollectionView()
    }
    //MARK: Setup view
    func setupCustomTabBar(){
        self.view.addSubview(customMenuBar)
        customMenuBar.delegate = self
        customMenuBar.translatesAutoresizingMaskIntoConstraints = false
        customMenuBar.indicatorViewWidthConstraint.constant = self.view.frame.width / 5
        customMenuBar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        customMenuBar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        customMenuBar.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        customMenuBar.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
//    func timeToUpdateContentTableView(indexPath:IndexPath) {
//        let cell = pageCollectionView.cellForItem(at: indexPath) as! PageCell
//        
//        cell.activityTableViewController?.items = sharedModelPublicAPI.itemsForIndex(index: indexPath.row)
//        
//        //
//        cell.activityTableView?.reloadData() // 각 카테고리 별 테이블뷰 데이터 업데이트.
//    }
    
    /// 사용자가 메뉴를 선택하면, 이게 호출되고 - delegate - 이걸 통해서 뭘 선택했는지 알 수 있음.
    /// selectedItem이 안먹힘 메뉴 컬렉션 뷰 에서.
    func customMenuBar(scrollTo index: Int) {
        let indexPath = IndexPath(row: index, section: 0)
        self.pageCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    func setupPageCollectionView(){
        pageCollectionView.delegate = self
        pageCollectionView.dataSource = self
        pageCollectionView.backgroundColor = .gray
        pageCollectionView.showsHorizontalScrollIndicator = false
        pageCollectionView.isPagingEnabled = true
        pageCollectionView.register(UINib(nibName: PageCell.reusableIdentifier, bundle: nil), forCellWithReuseIdentifier: PageCell.reusableIdentifier)
        self.view.addSubview(pageCollectionView)
        pageCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        pageCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        pageCollectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        pageCollectionView.topAnchor.constraint(equalTo: self.customMenuBar.bottomAnchor).isActive = true
    }
}
//MARK:- UICollectionViewDelegate, UICollectionViewDataSource
extension SearchMainVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PageCell.reusableIdentifier, for: indexPath) as! PageCell
//        cell.reloadTableView()
        
        cell.activityTableViewController?.indexOfMenu = indexPath.row // 현 메뉴의 인덱스를 기억.
        cell.activityTableViewController?.nc = navigationController
        
//        cell.activityTableViewController?.items = sharedModelPublicAPI.itemsForIndex(index: indexPath.row)


//        cell.activityTableView?.reloadData() // 각 카테고리 별 테이블뷰 데이터 업데이트.@@@@@@@@@@ 이 부분을 어떻게 사용..
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        customMenuBar.indicatorViewLeadingConstraint.constant = scrollView.contentOffset.x / 5
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let itemAt = Int(targetContentOffset.pointee.x / self.view.frame.width)
        let indexPath = IndexPath(item: itemAt, section: 0)
        customMenuBar.customTabBarCollectionView.selectItem(at: indexPath, animated: true, scrollPosition: [])
        
//        self.timeToUpdateContentTableView(indexPath: indexPath)
        
        indexRow = indexPath.row
        print (indexRow)
    }
}
//MARK:- UICollectionViewDelegateFlowLayout
extension SearchMainVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: pageCollectionView.frame.width, height: pageCollectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
