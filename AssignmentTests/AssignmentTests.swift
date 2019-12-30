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
    var urlstr: String?
    var imageUrlaary : [String]?
    var jsonRowsArry: [Rows]?
    override func setUp() {
    }

    override func tearDown() {
    }

    func testExample() {
        
    }

    func testPerformanceApiExample() {
        // This is an example of a performance test case fot hitting url and getting image from url
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
                                let responseStrInISOLatin = String(data: data!, encoding: String.Encoding.isoLatin1)
                                                                      guard let modifiedDataInUTF8Format = responseStrInISOLatin?.data(using: String.Encoding.utf8) else {
                                                                          return
                                                                      }
                            do {
                                let decoder = JSONDecoder()
                                let jsonObj = try decoder.decode(ModelJsonObject.self, from: modifiedDataInUTF8Format)
                                self.jsonRowsArry = jsonObj.rows!
                                self.imageUrlaary  =   self.jsonRowsArry?.compactMap({$0.imageHref})
                                for str in self.imageUrlaary ?? ["https://via.placeholder.com/150"]{
                                    self.urlstr = str
                                }
                                self.imageView?.image = UIImage(data: try Data(contentsOf: (URL(string: self.urlstr ?? "https://via.placeholder.com/150")!)))!
                                XCTAssertTrue(true, "image loaded successfully")
                            } catch {
                                print(error.localizedDescription)
                            }
                                          promise.fulfill()
                                      }
                       }, failure: { (data, response, error) in
                            XCTFail()
                       })
                       wait(for: [promise], timeout: 10)
                       XCTAssertEqual(self.statuscode, 200
                   )}
       
    }
    
        
    }
