//
//  Product+CoreDataProperties.swift
//  ECommerce
//
//  Created by AthiPathi on 3/23/23.
//
//

import Foundation
import CoreData


extension Product {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Product> {
        return NSFetchRequest<Product>(entityName: "Product")
    }

    @NSManaged public var id: Int64
    @NSManaged public var name: String?
    @NSManaged public var productDescription: String?
    @NSManaged public var productRating: Int64
    @NSManaged public var quantity: Int64
    @NSManaged public var companyID: Int64

}

extension Product : Identifiable {

}
