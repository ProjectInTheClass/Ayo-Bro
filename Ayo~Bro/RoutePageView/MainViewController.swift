//
//  MainViewController.swift
//  Ayo~Bro
//
//  Created by GW_14 on 30/07/2019.
//  Copyright © 2019 GW_19. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    
    @IBOutlet weak var contentView: UIView!
    let dataSource=["첫째날","둘째날","셋째날","넷째날"]
    let dataImage=[UIImage(named: "img01"),UIImage(named: "img02"),UIImage(named: "img03"),UIImage(named: "img04")]
    
    var currentViewControllerIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurePageViewController()
        // Do any additional setup after loading the view.
    }
    
    func configurePageViewController(){
        
        guard let pageViewController = storyboard?.instantiateViewController(withIdentifier: String(describing: CustomPageViewController.self)) as? CustomPageViewController else{
            return
        }
        pageViewController.delegate = self
        pageViewController.dataSource = self
        
        addChild(pageViewController)
        pageViewController.didMove(toParent: self)
        
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        pageViewController.view.backgroundColor = UIColor.black
        
        contentView.addSubview(pageViewController.view)
        
        let views: [String: Any] = ["pageView": pageViewController.view as Any]
        
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[pageView]-0-|",
                                                                  options: NSLayoutConstraint.FormatOptions(rawValue: 0),
                                                                  metrics: nil,
                                                                  views: views))
        
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[pageView]-0-|",
                                                                  options: NSLayoutConstraint.FormatOptions(rawValue: 0),
                                                                  metrics: nil,
                                                                  views: views))
        
        guard let startingViewController = detailViewControllerAt(index: currentViewControllerIndex) else{
            return
        }
        
        pageViewController.setViewControllers([startingViewController], direction: .forward, animated: true)
    }
    func detailViewControllerAt(index: Int)->DataViewController?{
        
        if index >= dataSource.count || dataSource.count == 0{
            return nil
        }
        
        guard let dataViewController = storyboard?.instantiateViewController(withIdentifier: String(describing: DataViewController.self)) as? DataViewController else{
            return nil
        }
        
        dataViewController.index = index
        dataViewController.displayText=dataSource[index]
        dataViewController.displayDaySchedule=dataImage[index]
        
        return dataViewController
    }
    
}

extension MainViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource{
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return currentViewControllerIndex
    }
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return dataSource.count
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let dataViewController = viewController as? DataViewController
        
        guard var currentIndex = dataViewController?.index else{
            return nil
        }
        
        currentViewControllerIndex = currentIndex
        
        if currentIndex == 0 {
            return nil
        }
        
        currentIndex -= 1
        
        return detailViewControllerAt(index: currentIndex)
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let dataViewController = viewController as? DataViewController
        
        guard var currentIndex = dataViewController?.index else{
            return nil
        }
        
        if currentIndex == dataSource.count{
            return nil
        }
        
        currentIndex += 1
        currentViewControllerIndex = currentIndex
        
        return detailViewControllerAt(index: currentIndex)
        
    }
}
