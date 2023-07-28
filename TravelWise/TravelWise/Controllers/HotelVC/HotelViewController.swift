//
//  HotelViewController.swift
//  TravelWise
//
//  Created by apple on 28.07.2023.
//

import UIKit
final class HotelViewController: UIViewController {
    
    private let webHotel: WebView = {
        let web = WebView() 
        return web
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadWebHotel()
    }
    
}
private extension HotelViewController {
    func loadWebHotel() {
        guard let url = URL(string: "https://www.booking.com") else {return}
        let request = URLRequest(url: url)
        webHotel.load(request)
    }
}
private extension HotelViewController {
    func setupUI() {
        view.addSubview(webHotel)
        NSLayoutConstraint.activate([
            webHotel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            webHotel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webHotel.topAnchor.constraint(equalTo: view.topAnchor),
            webHotel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
