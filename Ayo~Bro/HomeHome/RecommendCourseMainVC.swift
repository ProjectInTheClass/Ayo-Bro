//
//  RecommendCourseMainVC.swift
//  Ayo~Bro
//
//  Created by A09 on 02/10/2019.
//  Copyright © 2019 GW_19. All rights reserved.
//

import UIKit
var recommendcurrent = 0
var currentRecommendControllerIndex:Int = 0
class RecommendCourseMainVC: UIViewController {

    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var contentview: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurePageViewController()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    
    func configurePageViewController(){
        
        guard let pageViewController = storyboard?.instantiateViewController(withIdentifier: String(describing: RecommendPageViewController.self)) as? RecommendPageViewController else{
            return
        }
        pageViewController.delegate = self
        pageViewController.dataSource = self
        
        addChild(pageViewController)
        pageViewController.didMove(toParent: self)
        
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        pageViewController.view.backgroundColor = UIColor(68.0, 154.0, 248.0, 1.0)
        
        contentview.addSubview(pageViewController.view)
        
        let views: [String: Any] = ["pageView": pageViewController.view as Any]
        
        contentview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[pageView]-0-|",
                                                                  options: NSLayoutConstraint.FormatOptions(rawValue: 0),
                                                                  metrics: nil,
                                                                  views: views))
        
        contentview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[pageView]-0-|",
                                                                  options: NSLayoutConstraint.FormatOptions(rawValue: 0),
                                                                  metrics: nil,
                                                                  views: views))
        
        guard let startingViewController = detailViewControllerAt(index: currentRecommendControllerIndex) else{
            return
        }
        dayLabel.text = dataSource[currentRecommendControllerIndex]
        
        pageViewController.setViewControllers([startingViewController], direction: .forward, animated: true)
    }
    func detailViewControllerAt(index: Int)->RecommendCourseTableViewController?{
        if index >= recommnedArray[recommendIndex].recommend.count || recommnedArray[recommendIndex].recommend.count == 0{
            return nil
        }
        
        guard let dataViewController = storyboard?.instantiateViewController(withIdentifier: String(describing: RecommendCourseTableViewController.self)) as? RecommendCourseTableViewController else{
            return nil
        }
        
        dataViewController.index = index
        
        return dataViewController
    }
    
}

extension RecommendCourseMainVC: UIPageViewControllerDelegate, UIPageViewControllerDataSource{
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool)
    {
        let vcDetail = pageViewController.viewControllers!.first! as! RecommendCourseTableViewController
        vcDetail.tableView.reloadData()
        recommendcurrent = vcDetail.index
        dayLabel.text = dataSource[vcDetail.index]
    }
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return currentRecommendControllerIndex
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        
        return recommnedArray[recommendIndex].recommend.count
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let dataViewController = viewController as? RecommendCourseTableViewController
        dataViewController?.tableView.reloadData()
        guard var currentIndex = dataViewController?.index else{
            return nil
        }
        
        currentRecommendControllerIndex = currentIndex
        
        if currentIndex == 0 {
            return nil
        }
        
        currentIndex -= 1
        
        return detailViewControllerAt(index: currentIndex)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let dataViewController = viewController as? RecommendCourseTableViewController
        dataViewController?.tableView.reloadData()
        guard var currentIndex = dataViewController?.index else{
            return nil
        }
        
        if currentIndex == recommnedArray[recommendIndex].recommend.count
        {
            return nil
        }
        
        currentIndex += 1
        
        currentRecommendControllerIndex = currentIndex
        
        return detailViewControllerAt(index: currentIndex)
        
    }
    
}

