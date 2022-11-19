//
//  AppTabBarController.swift
//  THUNDER-ELEVEN-iOS
//
//  Created by 김담인 on 2022/11/18.
//

import UIKit
import SnapKit
import Then

final class AppTabBarController: UITabBarController {
    
    // MARK: - Components
    /// 탭바 디자인에 따라 백그라운드 이미지 적용
    private let backgroundView: UIImageView = UIImageView()

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
        setTabBarItemStyle()
        setTabBarUI()
    }
    
    // TabBarItem 생성해 주는 메서드
    private func makeTabVC(vc: UIViewController, tabBarTitle: String, tabBarImg: String, tabBarSelectedImg: String) -> UIViewController {
        
        vc.tabBarItem = UITabBarItem(title: tabBarTitle,
                                     image: UIImage(named: tabBarImg)?.withRenderingMode(.alwaysOriginal),
                                     selectedImage: UIImage(named: tabBarSelectedImg)?.withRenderingMode(.alwaysOriginal))
        vc.tabBarItem.imageInsets = UIEdgeInsets(top: 2, left: 0, bottom: -2, right: 0)
        return vc
    }
    
    /// TabBarItem을 지정하는 메서드'
    /// 탭뷰컨 쓸때 MainViewController 부분 수정해서 쓰면 됨! (제목, 아이콘도)
    private func setTabBar() {
        self.delegate = self
        let firstTab = makeTabVC(vc: BaseNavigationController(rootViewController: MyProfileViewController()), tabBarTitle: "first", tabBarImg:"iconTabPersonUnfilled", tabBarSelectedImg: "iconTabPersonFilled")
        firstTab.tabBarItem.tag = 0
        
        let secondTab = makeTabVC(vc: BaseNavigationController(rootViewController: MyGrameViewController()), tabBarTitle: "second", tabBarImg: "iconTabChatUnfilled", tabBarSelectedImg: "iconTabChatFilled")
        secondTab.tabBarItem.tag = 1
        
        let thirdTab = makeTabVC(vc: BaseNavigationController(rootViewController: ReviewViewController()), tabBarTitle: "third", tabBarImg: "iconTabSharpUnfilled", tabBarSelectedImg: "iconTabSharpFilled")
        thirdTab.tabBarItem.tag = 2
        
        let tabs = [firstTab, secondTab,thirdTab]
        self.setViewControllers(tabs, animated: false)
    }
    
    private func setTabBarItemStyle() {
        tabBar.tintColor = .black
    }
    
    /// TabBar의 UI를 지정하는 메서드
    private func setTabBarUI() {
        let appearance = self.tabBar.standardAppearance
        appearance.shadowColor = nil
        appearance.shadowImage = nil
        appearance.backgroundImage = nil
        appearance.backgroundEffect = nil
        appearance.backgroundColor = .clear
        self.tabBar.standardAppearance = appearance
        self.view.addSubviews([backgroundView])
        self.view.bringSubviewToFront(self.tabBar)
    }
    
}
extension AppTabBarController: UITabBarControllerDelegate {
    
}


