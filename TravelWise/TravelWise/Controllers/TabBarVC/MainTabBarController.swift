//
//  MainTabBarController.swift
//  TravelWise
//
//  Created by apple on 28.07.2023.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create instances of your view controllers
        let homeVC = HomeViewController()
        let hotelVC = HotelViewController()
        let flightsVC = FlightsViewController()
        
        // Embed the bookingVC in a UINavigationController
        let bookingNavController = UINavigationController(rootViewController: homeVC)
        
        // Set the view controllers for the tab bar controller
        self.viewControllers = [homeVC, hotelVC, flightsVC]
        
        // Optionally, you can customize the tab bar item titles and icons
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "globe.europe.africa"), tag: 0)
        hotelVC.tabBarItem = UITabBarItem(title: "Booking", image: UIImage(systemName: "house"), tag: 1)
        flightsVC.tabBarItem = UITabBarItem(title: "Flights", image: UIImage(systemName: "airplane.circle"), tag: 2)
    }
}
