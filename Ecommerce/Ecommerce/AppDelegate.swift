//
//  AppDelegate.swift
//  ECommerce
//
//  Created by AthiPathi on 3/16/23.
//


import UIKit
import CoreData

//var eCommerce = ECommerceStore()

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?
    static var typeId=1
    static var productId=1
    static var postId=1
    static var companyId=1
    static var orderId=1

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        do {
            var type_items=try persistentContainer.viewContext.fetch(ProductType.fetchRequest())
            if let typelastID = type_items.last?.id {
                AppDelegate.typeId = Int(typelastID)
            } else {
                AppDelegate.typeId = 1
            }
        }
        catch{
            print("No Data")
        }
        do {
            var type_items=try persistentContainer.viewContext.fetch(Product_Post.fetchRequest())
            if let typelastID = type_items.last?.id {
                AppDelegate.postId = Int(typelastID)
            } else {
                AppDelegate.postId = 1
            }
        }
        catch{
            print("No Data")
        }
        do {
            var type_items=try persistentContainer.viewContext.fetch(Product.fetchRequest())
            if let typelastID = type_items.last?.id {
                AppDelegate.productId = Int(typelastID)
            } else {
                AppDelegate.productId = 1
            }
        }
        catch{
            print("No Data")
        }
        do {
            var type_items=try persistentContainer.viewContext.fetch(Company.fetchRequest())
            if let typelastID = type_items.last?.id {
                AppDelegate.companyId = Int(typelastID)
            } else {
                AppDelegate.companyId = 1
            }
        }
        catch{
            print("No Data")
        }
        do {
            var type_items=try persistentContainer.viewContext.fetch(Order.fetchRequest())
            if let typelastID = type_items.last?.order_id {
                AppDelegate.orderId = Int(typelastID)
            } else {
                AppDelegate.orderId = 1
            }
        }
        catch{
            print("No Data")
        }
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
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application
     
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "DataModel")
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

