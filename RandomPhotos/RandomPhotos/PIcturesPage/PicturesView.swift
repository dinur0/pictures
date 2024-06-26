//
//  SearchView.swift
//  RandomPhotos
//
//  Created by хех on 26.06.2024.
//

import UIKit

class PicturesView: UIViewController, UISearchBarDelegate, UICollectionViewDelegate, UICollectionViewDataSource {

        private var searchBar: UISearchBar!
        private var collectionView: UICollectionView!
        private var images: [String] = [] // Массив имен изображений
        private var filteredImages: [String] = []

        override func viewDidLoad() {
            super.viewDidLoad()
            
            setupSearchBar()
            setupCollectionView()
            setupConstraints()
            
            // Пример данных
//            images = ["image1", "image2", "image3", "image4", "image5"]
//            filteredImages = images
        }

        private func setupSearchBar() {
            searchBar = UISearchBar()
            searchBar.delegate = self
            searchBar.placeholder = "Search images"
            searchBar.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(searchBar)
        }

        private func setupCollectionView() {
            let layout = UICollectionViewFlowLayout()
                layout.itemSize = CGSize(width: 100, height: 100)
                collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
                collectionView.delegate = self
                collectionView.dataSource = self
                collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: ImageCollectionViewCell.reuseIdentifier)
                collectionView.translatesAutoresizingMaskIntoConstraints = false
                view.addSubview(collectionView)
        }

        private func setupConstraints() {
            NSLayoutConstraint.activate([
                searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                
                collectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
                collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        }

        // MARK: - UISearchBarDelegate
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            if searchText.isEmpty {
                filteredImages = images
            } else {
                filteredImages = images.filter { $0.contains(searchText) }
            }
            collectionView.reloadData()
        }

        // MARK: - UICollectionViewDataSource
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return filteredImages.count
        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
//            cell.backgroundColor = .gray
//            // Настройка отображения изображений
//            let imageName = filteredImages[indexPath.item]
//            let imageView = UIImageView(image: UIImage(named: imageName))
//            imageView.contentMode = .scaleAspectFill
//            imageView.clipsToBounds = true
//            imageView.frame = cell.contentView.bounds
//            cell.contentView.addSubview(imageView)
//            return cell
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.reuseIdentifier, for: indexPath) as! ImageCollectionViewCell
                let imageName = filteredImages[indexPath.item]
                cell.imageView.image = UIImage(named: imageName)
                return cell
        }
    }


