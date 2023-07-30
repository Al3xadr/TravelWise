//
//  FlightsViewController.swift
//  TravelWise
//
//  Created by apple on 28.07.2023.
//

import UIKit

final class FlightsViewController: UIViewController {
    
    private let webFlights: WebView = {
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
        loadWebFlights()
    }
    
}
private extension FlightsViewController {
    func loadWebFlights() {
        guard let url = URL(string: StaticFlightsVC.url) else {return}
        let request = URLRequest(url: url)
        webFlights.load(request)
    }
}
private extension FlightsViewController {
    func setupUI() {
        view.addSubview(webFlights)
        NSLayoutConstraint.activate([
            webFlights.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            webFlights.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webFlights.topAnchor.constraint(equalTo: view.topAnchor),
            webFlights.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
