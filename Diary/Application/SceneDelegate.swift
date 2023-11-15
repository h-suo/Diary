//
//  Diary - SceneDelegate.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit
import CoreData

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    // MARK: - Property
    var window: UIWindow?

    // MARK: - Private Property
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: NameSpace.diaryData)
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        
        return container
    }()
    
    private lazy var coreDateDiaryManager = CoreDataDiaryManager(persistentContainer: persistentContainer)
    
    // MARK: - Scene Function
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else {
            return
        }
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = UINavigationController(rootViewController: DiaryListViewController(diaryReader: coreDateDiaryManager, diaryManager: coreDateDiaryManager, networkManager: NetworkManager()))
        window?.makeKeyAndVisible()
    }
}

