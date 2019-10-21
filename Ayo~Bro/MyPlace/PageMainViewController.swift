//
//  PageMainViewController.swift
//  Ayo~Bro
//
//  Created by 최세린 on 13/09/2019.
//  Copyright © 2019 GW_19. All rights reserved.
//


//dataSource.count는 몇째날 인지??
import UIKit

var currentViewControllerIndex:Int = 0
class PageMainViewController: UIViewController {

    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var contentview: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurePageViewController()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    
    func configurePageViewController(){
        
        guard let pageViewController = storyboard?.instantiateViewController(withIdentifier: String(describing: CoursePageViewController.self)) as? CoursePageViewController else{
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
        
        guard let startingViewController = detailViewControllerAt(index: currentViewControllerIndex) else{
            return
        }
        dayLabel.text = dataSource[currentViewControllerIndex]
        
        pageViewController.setViewControllers([startingViewController], direction: .forward, animated: true)
    }
    func detailViewControllerAt(index: Int)->DetailCourseTableViewController?{
        
        //dataSource.count==며칠인지/??
        
        if index >= ddcourseArray[selectedCourseIndex].courseArray.count || ddcourseArray[selectedCourseIndex].courseArray.count == 0{
            return nil
        }
        
        guard let dataViewController = storyboard?.instantiateViewController(withIdentifier: String(describing: DetailCourseTableViewController.self)) as? DetailCourseTableViewController else{
            return nil
        }
        
//        dayLabel.text = dataSource[index]
        
        dataViewController.index = index
        
        return dataViewController
    }
    
}
extension UIColor {
    convenience init(_ r: Double,_ g: Double,_ b: Double,_ a: Double) {
        self.init(red: CGFloat(r/255), green: CGFloat(g/255), blue: CGFloat(b/255), alpha: CGFloat(a))
    }
}

//넘기는거?
extension PageMainViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource{
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool)
    {
        let vcDetail = pageViewController.viewControllers!.first! as! DetailCourseTableViewController
        vcDetail.tableView.reloadData()
        coursecurrentIndex = vcDetail.index
        dayLabel.text = dataSource[vcDetail.index]
    }
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return currentViewControllerIndex
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return ddcourseArray[selectedCourseIndex].courseArray.count
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let dataViewController = viewController as? DetailCourseTableViewController
        dataViewController?.tableView.reloadData()
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
        let dataViewController = viewController as? DetailCourseTableViewController
        dataViewController?.tableView.reloadData()
        guard var currentIndex = dataViewController?.index else{
            return nil
        }
        
        if currentIndex == ddcourseArray[selectedCourseIndex].courseArray.count
        {
            return nil
        }
        
        currentIndex += 1
        
        currentViewControllerIndex = currentIndex
        
        return detailViewControllerAt(index: currentIndex)
        
    }

}
