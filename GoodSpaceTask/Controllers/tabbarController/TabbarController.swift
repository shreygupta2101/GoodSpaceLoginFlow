//
//  tabbarController.swift
//  GoodSpaceTask
//
//  Created by ShreyGupta on 09/12/23.
//

import Foundation
import UIKit

class TabbarController : UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addControllers()
    }
}

extension TabbarController {
    
    private func addControllers() {
        
        self.tabBar.backgroundColor = UIColor(red: 178/255, green: 190/255, blue: 181/255, alpha: 1.0)
        
        let storyBoard1 = UIStoryboard(name: "WorkViewController", bundle: nil)
        let WorkController = storyBoard1.instantiateViewController(withIdentifier: "WorkViewController") as! WorkViewController
        
        let storyBoard2 = UIStoryboard(name: "RecruitViewController", bundle: nil)
        let RecruitController = storyBoard2.instantiateViewController(withIdentifier: "RecruitViewController") as! RecruitViewController
        
        let storyBoard3 = UIStoryboard(name: "SocialViewController", bundle: nil)
        let SocialController = storyBoard3.instantiateViewController(withIdentifier: "SocialViewController") as! SocialViewController
        
        let storyBoard4 = UIStoryboard(name: "MessageViewController", bundle: nil)
        let MeassageController = storyBoard4.instantiateViewController(withIdentifier: "MessageViewController") as! MessageViewController
        
        let storyBoard5 = UIStoryboard(name: "ProfileViewController", bundle: nil)
        let ProfileController = storyBoard5.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController

        
        let navigationWork = WorkNavigationController(rootViewController: WorkController)
        let navigationRecruit = RecruitNavigationController(rootViewController: RecruitController)
        let navigationSocial = SocialNavigationController(rootViewController: SocialController)
        let navigationMessage = MessageNavigationController(rootViewController: MeassageController)
        let navigationProfile = MessageNavigationController(rootViewController: ProfileController)
        
        
        navigationWork.tabBarItem.title = "Work"
        navigationRecruit.tabBarItem.title = "Recruit"
        navigationSocial.tabBarItem.title = "Social"
        navigationMessage.tabBarItem.title = "Message"
        navigationProfile.tabBarItem.title = "Profile"
        
        navigationWork.tabBarItem.image = UIImage(named: "iconBriefcase")
        navigationRecruit.tabBarItem.image = UIImage(named: "vector")
        navigationSocial.tabBarItem.image = UIImage(named: "shape")
        navigationMessage.tabBarItem.image = UIImage(named: "iconMessage")
        navigationProfile.tabBarItem.image = UIImage(named: "iconUser")
        
        let selectedColor = UIColor.white
        let unselectedColor = UIColor.black
        
        navigationWork.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: selectedColor], for: .selected)
        navigationWork.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: unselectedColor], for: .normal)
        
        navigationRecruit.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: selectedColor], for: .selected)
        navigationRecruit.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: unselectedColor], for: .normal)
        
        navigationSocial.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: selectedColor], for: .selected)
        navigationSocial.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: unselectedColor], for: .normal)
        
        navigationMessage.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: selectedColor], for: .selected)
        navigationMessage.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: unselectedColor], for: .normal)
        
        navigationProfile.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: selectedColor], for: .selected)
        navigationProfile.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: unselectedColor], for: .normal)
        
        self.viewControllers = [navigationWork, navigationRecruit, navigationSocial, navigationMessage, navigationProfile]
    }
}
