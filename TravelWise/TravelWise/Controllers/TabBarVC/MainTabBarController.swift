//
//  MainTabBarController.swift
//  TravelWise
//
//  Created by apple on 28.07.2023.
//

import UIKit

final class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarController()
    }
}
extension MainTabBarController {
    func setupTabBarController() {
        let homeVC = HomeViewController()
        let hotelVC = HotelViewController()
        let flightsVC = FlightsViewController()
        let bookingNavController = UINavigationController(rootViewController: homeVC)
        self.viewControllers = [homeVC, hotelVC, flightsVC]
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "globe.europe.africa"), tag: 0)
        hotelVC.tabBarItem = UITabBarItem(title: "Booking", image: UIImage(systemName: "house"), tag: 1)
        flightsVC.tabBarItem = UITabBarItem(title: "Flights", image: UIImage(systemName: "airplane.circle"), tag: 2)
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: MainColor.color]
        tabBarAppearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.gray]
        self.tabBar.standardAppearance = tabBarAppearance
    }
}
