//
//  PhotoDetails.swift
//  VirtualTourist
//
//  Created by Desha Washington on 6/24/21.
//

// PhotoDetails

import UIKit

struct PhotoDetails: Codable {
    let id: String
    let owner: String
    let secret: String
    let server: String
    let farm: Int
    let title: String
    let isPublic: Int
    let isFriend: Int
    let isFamily: Int
    
    enum CodingKeys: String, CodingKey {
        case id, owner, secret, server, farm, title
        case isPublic = "ispublic"
        case isFriend = "isfriend"
        case isFamily = "isfamily"
    }
}

struct PageMetadata: Codable {
    let page: Int
    let pages: Int
    let perpage: Int
    let total: Int
    let photo: [PhotoDetails]
}

struct PhotosDetailResponse: Codable {
    let photos: PageMetadata
    let stat: String
}

struct PhotoData: Codable {
    let info: PhotoDetails
    var imageData: Data
}
