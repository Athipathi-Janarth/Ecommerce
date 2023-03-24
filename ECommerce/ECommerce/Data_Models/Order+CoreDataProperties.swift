//
//  Order+CoreDataProperties.swift
//  ECommerce
//
//  Created by AthiPathi on 3/23/23.
//
//

import Foundation
import CoreData


extension Order {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Order> {
        return NSFetchRequest<Order>(entityName: "Order")
    }

    @NSManaged public var productTypeID: Int64
    @NSManaged public var order_id: Int64
    @NSManaged public var postID: Int64
    @NSManaged public var productID: Int64
    @NSManaged public var date: Date?

}

extension Order : Identifiable {

}
