//
//  Extensions+Photo.swift
//  VirtualTourist
//
//  Created by Desha Washington on 6/24/21.
//

import Foundation
import CoreData
//
extension Photo {
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        self.creationDate = Date()
    }
}
