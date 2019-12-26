//
//  AssignmentTests.swift
//  AssignmentTests
//
//  Created by Senapathi Rajesh on 26/12/19.
//  Copyright © 2019 Senapathi Rajesh. All rights reserved.
//

import XCTest
@testable import Assignment

class iOSProficiencttests: XCTestCase {
    var Handler = ApiHandler()
    var statuscode: Int?
    var imageView: UIImageView?

    
    override func setUp() {
    }

    override func tearDown() {
    }

    func testExample() {
        
    }

    func testPerformanceApiExample() {
        // This is an example of a performance test case.
                      self.measure {
                 let promise = expectation(description: "Status code: 200")
                       Handler.makeAPICall(url: "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json", method: .GET, success: { (data, response, error) in
                          if let Statuscode = (response)?.statusCode{
                               self.statuscode = Statuscode
                               XCTAssertEqual(self.statuscode, 200)
                           }
                           else{
                               print("status code: \(String(describing: response?.statusCode))")
                           }
                           if data == nil {
                                          XCTAssertNil(true)
                                      }
                                      else {
                                          XCTAssertTrue(true, "expected")
                                
                                          promise.fulfill()
                                      }
                       }, failure: { (data, response, error) in
                            XCTFail()
                       })
                       wait(for: [promise], timeout: 5)
                       XCTAssertEqual(self.statuscode, 200
                   )}
       
    }
        
    }
