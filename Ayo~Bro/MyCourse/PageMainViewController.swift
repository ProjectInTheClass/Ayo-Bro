//
//  PageMainViewController.swift
//  Ayo~Bro
//
//  Created by 최세린 on 13/09/2019.
//  Copyright © 2019 GW_19. All rights reserved.
//


//dataSource.count는 몇째날 인지??
import UIKit

class PageMainViewController: UIViewController {

    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var contentview: UIView!
    var currentViewControllerIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurePageViewController()
        // Do any additional setup after loading the view.
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
        
        pageViewController.setViewControllers([startingViewController], direction: .forward, animated: true)
    }
    func detailViewControllerAt(index: Int)->DetailCourseTableViewController?{
        
        //dataSource.count==며칠인지/??
        if index >= dataSource.count || dataSource.count == 0{
            return nil
        }
        
        guard let dataViewController = storyboard?.instantiateViewController(withIdentifier: String(describing: DetailCourseTableViewController.self)) as? DetailCourseTableViewController else{
            return nil
        }
        
        
        self.dayLabel.text = dataSource[index]
        
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
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return currentViewControllerIndex
    }
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return dataSource.count//며칠인지 여기에 넣어준다
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let dataViewController = viewController as? DetailCourseTableViewController
        
        guard var currentIndex = dataViewController?.view.tag else{
            return nil
        }
        
        currentViewControllerIndex = currentIndex
        
        if (currentIndex-1) < 0 {
            return nil
        }
        
        currentIndex -= 1
        print("\(currentIndex)")
        
        return detailViewControllerAt(index: currentIndex)
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let dataViewController = viewController as? DetailCourseTableViewController
        
        guard var currentIndex = dataViewController?.view.tag else{
            return nil
        }
        
        if (currentIndex+1) == dataSource.count //며칠인지 넣어준다
        {
            return nil
        }
        
        currentIndex += 1
        print("\(currentIndex)")
        currentViewControllerIndex = currentIndex
        
        return detailViewControllerAt(index: currentIndex)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    

}
