//
//  Product_Post+CoreDataProperties.swift
//  ECommerce
//
//  Created by AthiPathi on 3/23/23.
//
//

import Foundation
import CoreData


extension Product_Post {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Product_Post> {
        return NSFetchRequest<Product_Post>(entityName: "Product_Post")
    }

    @NSManaged public var id: Int64
    @NSManaged public var productTypeID: Int64
    @NSManaged public var companyID: Int64
    @NSManaged public var productID: Int64
    @NSManaged public var postedDate: Date?
    @NSManaged public var price: Float
    @NSManaged public var postDescription: String?

}

extension Product_Post : Identifiable {

}
