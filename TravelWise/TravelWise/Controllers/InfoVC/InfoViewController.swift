//
//  InfoViewController.swift
//  TravelWise
//
//  Created by apple on 27.07.2023.
//

import UIKit
final class InfoViewController: UIViewController {
    var latitude: Double = 0.0
    var longitude: Double = 0.0
    
    let viewModel = InfoViewModel()
    private let disMisButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
        button.addTarget(self, action: #selector(dismissAndShowNext), for: .touchUpInside)
        return button
    }()
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 350, height: 250)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.register(InfoCollectionViewCell.self, forCellWithReuseIdentifier: StaticInfoVC.infoCollectionViewCell)
        
        collectionView.dataSource = self
        return collectionView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        loadDataViewModel()
    }
}
private extension InfoViewController {
    @objc private func dismissAndShowNext() {
        self.dismiss(animated: true)
    }
}
private extension InfoViewController {
    func loadDataViewModel() {
        viewModel.fetchDataCountry(latitude: latitude, longitude: longitude) { [weak self] error in
            if let error = error {
                print("Error: \(error)")
            } else {
                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                }
            }
        }
    }
}

extension InfoViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return viewModel.numberOfPages()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StaticInfoVC.infoCollectionViewCell, for: indexPath) as? InfoCollectionViewCell
        
        if let page = viewModel.page(at: indexPath.item) {
            let thumbnailURL = URL(string: page.thumbnail?.source ?? "")
            
            let description = page.terms?.description.joined(separator: ", ") ?? ""
            
            cell?.configure(title: page.title, image: thumbnailURL, description: description)
        }
        
        return cell ?? UICollectionViewCell()
    }
    
}
private extension InfoViewController {
    func setupUI() {
        view.addSubview(disMisButton)
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            disMisButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            disMisButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            disMisButton.heightAnchor.constraint(equalToConstant: 20),
            disMisButton.widthAnchor.constraint(equalToConstant: 40)
        ])
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.topAnchor.constraint(equalTo: disMisButton.bottomAnchor, constant: 20)
        ])
    }
}
