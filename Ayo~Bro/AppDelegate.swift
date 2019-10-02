//
//  AppDelegate.swift
//  aasdf
//
//  Created by 전정준 on 27/09/2019.
//  Copyright © 2019 전정준. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var context : NSManagedObjectContext? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return nil
        }
        return appDelegate.persistentContainer.viewContext
    }
    var shouldSupportAllOrientation = true
    var window: UIWindow?
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
    func fetchForPlace() -> [NSManagedObject]? {
        guard let context = self.context else {
            return nil
        }
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "SelectLocation")
        do {
            return try context.fetch(fetchRequest)
        } catch let error as NSError{
            print("error : \(error)")
        }
        return nil
    }
    func fetchForCourse() -> [NSManagedObject]? {
        guard let context = self.context else {
            return nil
        }
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CourseData")
        do {
            return try context.fetch(fetchRequest)
        } catch let error as NSError{
            print("error : \(error)")
        }
        return nil
    }
    func fetchForDetailCourse() -> [NSManagedObject]? {
        guard let context = self.context else {
            return nil
        }
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CourseDetailData")
        do {
            return try context.fetch(fetchRequest)
        } catch let error as NSError{
            print("error : \(error)")
        }
        return nil
    }

    
//    func fetchForODSay() -> [NSManagedObject]? {
//        guard let context = self.context else {
//            return nil
//        }
//        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "ODSay")
//        do {
//            return try context.fetch(fetchRequest)
//        } catch let error as NSError{
//            print("error : \(error)")
//        }
//        return nil
//    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
//        sharedModelPublicAPI.requestToServer()
        guard let resultPlace = fetchForPlace() else {
            return true
        }
        for element in resultPlace {
            sharedBookMark[element.value(forKey: "contentId") as! Int] = (element.value(forKey: "contentId") as! Int)
            var i = 0
            while ( i < trueBookmarkArray.count ) {
                if (trueBookmarkArray[i].regionName == "\(BigAreaArray![element.value(forKey: "areaCode") as! Int].bigArea) \(BigAreaArray![element.value(forKey: "areaCode") as! Int].middleArea[element.value(forKey: "sigunguCode") as! Int])") {
                    
                    trueBookmarkArray[i].middleArray.append(locationArray(title: element.value(forKey: "title") as! String, contentid: element.value(forKey: "contentId") as! Int, contenttypeid: element.value(forKey: "contentTypeId") as! Int, image: element.value(forKey: "firstImage2") as? String, mapx: element.value(forKey: "mapx") as! Double, mapy: element.value(forKey: "mapy") as! Double, sigungucode: element.value(forKey: "sigunguCode") as! Int, areacode: element.value(forKey: "areaCode") as! Int, addr1: element.value(forKey: "addr1") as! String))
                    break
                }
                i += 1
            }
            if i == trueBookmarkArray.count {
                print(element.value(forKey: "areaCode") as! Int)
                print(element.value(forKey: "sigunguCode") as! Int)
                trueBookmarkArray.append(realBookmarkArray(regionName: "\(BigAreaArray![element.value(forKey: "areaCode") as! Int].bigArea) \(BigAreaArray![element.value(forKey: "areaCode") as! Int].middleArea[element.value(forKey: "sigunguCode") as! Int])", isExpanded: true, middleArray: [locationArray(title: element.value(forKey: "title") as! String, contentid: element.value(forKey: "contentId") as! Int, contenttypeid: element.value(forKey: "contentTypeId") as! Int, image: element.value(forKey: "firstImage2") as? String, mapx: element.value(forKey: "mapx") as! Double, mapy: element.value(forKey: "mapy") as! Double, sigungucode: element.value(forKey: "sigunguCode") as! Int, areacode: element.value(forKey: "areaCode") as! Int, addr1: element.value(forKey: "addr1") as! String)]))
            }
        }
        guard let resultCourse = fetchForCourse() else {
            return true
        }
        for element in resultCourse {
            ddcourseArray.append(DddcourseArray(courseArray: [], title: element.value(forKey: "courseTitle") as! String, regionName : "\(BigAreaArray![element.value(forKey: "areaCode") as! Int].bigArea) \(BigAreaArray![element.value(forKey: "areaCode") as! Int].middleArea[element.value(forKey: "sigunguCode") as! Int])", currentIndex: element.value(forKey: "currentIndex") as! Int))
            var i = 0
            while i < (element.value(forKey: "selectedDay") as! Int + 1){
                ddcourseArray[ddcourseArray.count-1].courseArray.append(CourseArray(detail: [], dayInfo: i+1))
                i += 1
            }
        }
        guard let resultDetailCourse = fetchForDetailCourse() else{
            return true
        }
        for element in resultDetailCourse {
            ddcourseArray[element.value(forKey: "courseId") as! Int].courseArray[element.value(forKey: "dayId") as! Int].detail.append(DetailCourseArray(area: element.value(forKey: "areaCode") as! Int, sigungu: element.value(forKey: "sigunguCode") as! Int, mapx: element.value(forKey: "mapx") as! Double, mapy: element.value(forKey: "mapy") as! Double, title: element.value(forKey: "title") as! String, courseID: element.value(forKey: "courseId") as! Int, dayID: element.value(forKey: "dayId") as! Int, addr1: element.value(forKey: "addr1") as! String))
        }
//        guard let resultODSay = fetchForODSay() else {
//            return true
//        }
//        for element in resultODSay {
//            transportationArray.append(TransportationInfoArray(pathType: element.value(forKey: "pathType") as! Int, totalTime: element.value(forKey: "totalTime") as! Int, totalDistance: element.value(forKey: "totalDistance") as! Int, firstStartStation: element.value(forKey: "firstStartStation") as! String, lastEndStation: element.value(forKey: "lastEndStation") as! String))
//        }
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "CoreData")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}

