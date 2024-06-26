//
//  InfoView.swift
//  RandomPhotos
//
//  Created by хех on 25.06.2024.
//

import UIKit

class InfoView: UIViewController {
    
    private var photo: Photo
    
    private let imageView = UIImageView()
    private let authorLabel = UILabel()
    private let creationDateLabel = UILabel()
    private let locationLabel = UILabel()
    private let downloadCountLabel = UILabel()
    private let favoriteButton = UIButton(type: .system)
    
    init(photo: Photo) {
        self.photo = photo
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        setupConstraints()
        updateUI()
    }
    
    private func setupUI() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(authorLabel)
        
        creationDateLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(creationDateLabel)
        
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(locationLabel)
        
        downloadCountLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(downloadCountLabel)
        
        favoriteButton.setTitle("Add to Favorites", for: .normal)
        favoriteButton.addTarget(self, action: #selector(toggleFavoriteStatus), for: .touchUpInside)
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(favoriteButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            
            authorLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            authorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            authorLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            creationDateLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 10),
            creationDateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            creationDateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            locationLabel.topAnchor.constraint(equalTo: creationDateLabel.bottomAnchor, constant: 10),
            locationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            locationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            downloadCountLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 10),
            downloadCountLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            downloadCountLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            favoriteButton.topAnchor.constraint(equalTo: downloadCountLabel.bottomAnchor, constant: 20),
            favoriteButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func updateUI() {
        imageView.image = UIImage(named: photo.imageName)
        authorLabel.text = "Author: \(photo.authorName)"
        creationDateLabel.text = "Date: \(photo.creationDate)"
        locationLabel.text = "Location: \(photo.location)"
        downloadCountLabel.text = "Downloads: \(photo.downloadCount)"
        
        let buttonTitle = FavoritesManager.shared.isFavorite(photo) ? "Remove from Favorites" : "Add to Favorites"
        favoriteButton.setTitle(buttonTitle, for: .normal)
    }
    
    @objc private func toggleFavoriteStatus() {
        if FavoritesManager.shared.isFavorite(photo) {
            FavoritesManager.shared.removePhotoFromFavorites(photo)
        } else {
            FavoritesManager.shared.addPhotoToFavorites(photo)
        }
        updateUI()
    }
}
