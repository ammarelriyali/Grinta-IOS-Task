//
//  NetworkingTest.swift
//  PLTests
//
//  Created by ammar on 14/10/2023.
//

import XCTest
@testable import PL

final class NetworkingTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLoadDataFromURL() {
        let exp = expectation(description: "waiting for the API")
        NetworkClient.shared.request(targetUrl: FixturesDataSource.url, parameters: nil, method: .get) { (result: Result<FixtureMainResponse, NetworkError>) in
            switch result {
            case .success(let data):
                guard let count = data.matches?.count else {
                    XCTFail()
                    exp.fulfill()
                    return
                }
                XCTAssertGreaterThan(count, 0, "arr is empty ")
                exp.fulfill()
            case .failure(let error):
                print(error.localizedDescription)
                XCTFail()
                exp.fulfill()
            }
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
}
