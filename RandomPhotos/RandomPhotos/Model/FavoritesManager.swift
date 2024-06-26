//
//  FavoritesManager.swift
//  RandomPhotos
//
//  Created by хех on 26.06.2024.
//

import Foundation

class FavoritesManager {
    static let shared = FavoritesManager()
    
    private var favoritePhotos: [Photo] = []
    
    private init() {}
    
    func addPhotoToFavorites(_ photo: Photo) {
        favoritePhotos.append(photo)
    }
    
    func removePhotoFromFavorites(_ photo: Photo) {
        favoritePhotos.removeAll { $0.imageName == photo.imageName }
    }
    
    func isFavorite(_ photo: Photo) -> Bool {
        return favoritePhotos.contains { $0.imageName == photo.imageName }
    }
    
    func getFavoritePhotos() -> [Photo] {
        return favoritePhotos
    }
}
