//
//  Company+CoreDataProperties.swift
//  ECommerce
//
//  Created by AthiPathi on 3/23/23.
//
//

import Foundation
import CoreData


extension Company {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Company> {
        return NSFetchRequest<Company>(entityName: "Company")
    }

    @NSManaged public var id: Int64
    @NSManaged public var name: String?
    @NSManaged public var address: String?
    @NSManaged public var country: String?
    @NSManaged public var zip: Int64
    @NSManaged public var companyType: String?

}

extension Company : Identifiable {

}
