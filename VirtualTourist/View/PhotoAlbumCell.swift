//
//  PhotoAlbumCell.swift
//  VirtualTourist
//
//  Created by Desha Washington on 6/24/21.
//

import UIKit
import CoreData

class PhotoAlbumCell: UICollectionViewCell {
    static let reuseIdentifier = String(describing: PhotoAlbumCell.self)
    
    @IBOutlet weak var imageView: UIImageView!
    var dataController: DataController!
    
    func downloadPhoto(for photoDetails: PhotoDetails, pin: Pin) {
        FlickrClient.downloadPhoto(photoDetails: photoDetails) { (data, error) in
            guard let data = data else { return }
            
            self.savePhoto(pin: pin, photoData: data)
            self.imageView.image = UIImage(data: data)
            DataModel.photosData.append(data)
        }
    }
    
    
    private func savePhoto(pin: Pin, photoData: Data) {
        let viewContext = dataController.viewContext
        let pinToUpdate = viewContext.object(with: pin.objectID) as! Pin
        
        viewContext.perform {
            let photo = Photo(context: viewContext)
            photo.pin = pinToUpdate
            photo.data = photoData
            photo.creationDate = Date()
            try? viewContext.save()
            }
        }
    override func prepareForReuse() {
        super.prepareForReuse()
            imageView.image = nil
    }
}
   
