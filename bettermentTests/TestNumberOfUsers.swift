//
//  TestPerson.swift
//  betterment
//
//  Created by Ankur Dabral on 20/05/2016.
//  Copyright © 2016 Mitul Manish. All rights reserved.
//

import XCTest
import CoreData
@testable import betterment

class TestNumberOfUsers: XCTestCase {
    
    var managedObjectContext: NSManagedObjectContext!
    
    func setUpInMemoryManagedObjectContext() -> NSManagedObjectContext {
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        var managedContext: NSManagedObjectContext
            {
            get{
                return appDelegate.managedObjectContext
            }
        }
        return managedContext
    }
    
    override func setUp() {
        super.setUp()
        self.managedObjectContext = self.setUpInMemoryManagedObjectContext()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCountOfUser() {
        // Check the number of rows in core data
        do {
            //fetch person entity
            let fetchRequest = NSFetchRequest(entityName:"Person")
            let fetchedResults = try managedObjectContext.executeFetchRequest(fetchRequest) as? [Person]
            //check if count if equal to desired output
            XCTAssert(0 != fetchedResults!.count, "Incorrect number of rows in `Person` entity.")
        }  catch let error as NSError
        {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
}
