//
//  StarRatingView.swift
//  TravelWise
//
//  Created by apple on 26.07.2023.
//
import UIKit

class RatingStarsView: UIStackView {
    var ratingDidChange: ((Int) -> Void)?
    private var starImageViews: [UIImageView] = []
    
    var rating: Int = 0 {
        didSet {
            updateStarRating()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStars()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupStars()
    }
    
    private func setupStars() {
        for _ in 1...5 {
            let starImageView = UIImageView()
            starImageView.contentMode = .scaleAspectFit
            starImageView.translatesAutoresizingMaskIntoConstraints = false
            starImageView.widthAnchor.constraint(equalToConstant: 35).isActive = true
            starImageView.heightAnchor.constraint(equalToConstant: 35).isActive = true
            starImageView.image = UIImage(systemName: "star") // Use your custom star image for the empty state
            addArrangedSubview(starImageView)
            starImageViews.append(starImageView)
            
            // Add tap gesture recognizer to each star image view
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(starTapped(_:)))
            starImageView.addGestureRecognizer(tapGesture)
            starImageView.isUserInteractionEnabled = true
        }
        updateStarRating()
    }
    
    private func updateStarRating() {
        for (index, starImageView) in starImageViews.enumerated() {
            starImageView.image = index < rating ? UIImage(systemName: "star.fill") : UIImage(systemName: "star")
        }
    }
    
    @objc private func starTapped(_ gesture: UITapGestureRecognizer) {
        guard let tappedStarView = gesture.view, let tappedIndex = starImageViews.firstIndex(of: tappedStarView as! UIImageView) else {
            return
        }
        
        // Update the rating based on the tapped star
        rating = tappedIndex + 1
        ratingDidChange?(rating)
    }
}
