//
//  FavoritesController.swift
//  RandomPhotos
//
//  Created by хех on 25.06.2024.
//

import UIKit

class FavoritesView: UITableViewController {
    
    private let network = NetworkClass()
    private var favoritePhotos: [Photo] {
        return FavoritesManager.shared.getFavoritePhotos()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        navigationItem.title = "Favorite Photos"
        navigationItem.rightBarButtonItem = editButtonItem
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoritePhotos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let photo = favoritePhotos[indexPath.row]
        cell.textLabel?.text = "\(photo.authorName)"
        cell.imageView?.image = UIImage(named: photo.imageName)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let photo = favoritePhotos[indexPath.row]
        let detailVC = InfoView(photo: photo)
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let photo = favoritePhotos[indexPath.row]
            FavoritesManager.shared.removePhotoFromFavorites(photo)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
}
