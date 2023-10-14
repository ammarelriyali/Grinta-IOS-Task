//
//  FixturesUseCaseTest.swift
//  PLTests
//
//  Created by ammar on 14/10/2023.
//

import XCTest
@testable import PL
import Alamofire

final class FixturesUseCaseTest: XCTestCase {
    
    private var repo: MockFixturesRepo!
    private var useCase: FixturesUseCasesProtocol!
    private let fixtureWithCorrectDate = FixtureDomainModel(id: 0,
                                                            status: nil,
                                                            score: nil,
                                                            homeTeam: nil,
                                                            awayTeam: nil,
                                                            date: "2024-01-11",
                                                            time: "",
                                                            isFavorite: nil)
    private let fixture = FixtureDomainModel(id: 0,
                                             status: nil,
                                             score: nil,
                                             homeTeam: nil,
                                             awayTeam: nil,
                                             date: "",
                                             time: "",
                                             isFavorite: nil)
    
    override func setUpWithError() throws {
        
        repo = MockFixturesRepo()
        repo.ids = []
        repo.result = nil
        useCase = FixturesUseCasesImp(repository: repo)
    }
    
    func testLoadFixturesSuccessWithCorrectDate() {
        
        repo.result = .success([fixtureWithCorrectDate])
        // Create an expectation for the completion closure
        let expectation = XCTestExpectation(description: "Fetch completion")
        
        // Call the fetch method and assert the result
        useCase.getFixtures { (result: Result<[FixtureDomainModel], NetworkError>) in
            switch result {
            case .success(let data):
                XCTAssertTrue(!data.isEmpty)
            default:
                XCTFail("")
            }
            // Fulfill the expectation to indicate that the completion closure has been called
            expectation.fulfill()
        }
    }
    
    func testLoadFixturesSuccessWithIncorrectData() {
        
        repo.result = .success([fixture])
        // Create an expectation for the completion closure
        let expectation = XCTestExpectation(description: "Fetch completion")
        
        // Call the fetch method and assert the result
        useCase.getFixtures { (result: Result<[FixtureDomainModel], NetworkError>) in
            switch result {
            case .success(let data):
                XCTAssertTrue(data.isEmpty)
            default:
                XCTFail("")
            }
            // Fulfill the expectation to indicate that the completion closure has been called
            expectation.fulfill()
        }
    }
    
    func testLoadFixturesErrorFailure() {
        
        let error = NetworkError(initialError: .explicitlyCancelled, backendError: BackendError(status: "", message: ""))
        
        repo.result = .failure(error)
        
        // Create an expectation for the completion closure
        let expectation = XCTestExpectation(description: "Fetch completion")
        
        // Call the fetch method and assert the result
        useCase.getFixtures { (result: Result<[FixtureDomainModel], NetworkError>) in
            switch result {
            case .failure(let errorResult):
                XCTAssertTrue(error == errorResult)
            default:
                XCTFail("")
            }
            // Fulfill the expectation to indicate that the completion closure has been called
            expectation.fulfill()
        }
    }
    
    func testGetIdsSuccess() {
        
        
        repo.ids = [fixture.id ?? 0]
        
        // Create an expectation for the completion closure
        let expectation = XCTestExpectation(description: "Fetch completion")
        
        // Call the fetch method and assert the result
        useCase.getSavedIds(completion: { ids in
            XCTAssertTrue( ids.contains(where: {$0 == (self.fixture.id ?? 0)}))
            // Fulfill the expectation to indicate that the completion closure has been called
            expectation.fulfill()
        })
    }
    
    func testGetIdsFailure() {
        repo.ids = [fixture.id ?? 0]
        
        // Create an expectation for the completion closure
        let expectation = XCTestExpectation(description: "Fetch completion")
        
        // Call the fetch method and assert the result
        useCase.getSavedIds(completion: { ids in
            XCTAssertTrue( !ids.contains(where: {$0 == 3}))
            // Fulfill the expectation to indicate that the completion closure has been called
            expectation.fulfill()
        })
    }
    
    func testAppendIdSuccess() {
        
        // Create an expectation for the completion closure
        let expectation = XCTestExpectation(description: "Fetch completion")
        
        // Call the fetch method and assert the result
        useCase.appendId(id: fixture.id ?? 0)
        useCase.getSavedIds(completion: { ids in
            XCTAssertTrue( ids.contains(where: {$0 == (self.fixture.id ?? 0)}))
            // Fulfill the expectation to indicate that the completion closure has been called
            expectation.fulfill()
        })
    }
    
    func testAppendIdFailure() {
        // Create an expectation for the completion closure
        let expectation = XCTestExpectation(description: "Fetch completion")
        
        // Call the fetch method and assert the result
        useCase.appendId(id: fixture.id ?? 0)
        useCase.getSavedIds(completion: { ids in
            XCTAssertTrue( !ids.contains(where: {$0 ==  3}))
            // Fulfill the expectation to indicate that the completion closure has been called
            expectation.fulfill()
        })
    }
    
    func testRemoveIdSuccess() {
        repo.ids = [fixture.id ?? 0]
        // Create an expectation for the completion closure
        let expectation = XCTestExpectation(description: "Fetch completion")
        
        // Call the fetch method and assert the result
        useCase.remveId(id: fixture.id ?? 0)
        useCase.getSavedIds(completion: { ids in
            XCTAssertTrue( !ids.contains(where: {$0 ==  (self.fixture.id ?? 0)}))
            // Fulfill the expectation to indicate that the completion closure has been called
            expectation.fulfill()
        })
    }
    
    func testRemoveIdFailure() {
        
        repo.ids = [fixture.id ?? 0]
        // Create an expectation for the completion closure
        let expectation = XCTestExpectation(description: "Fetch completion")
        
        // Call the fetch method and assert the result
        useCase.remveId(id: 2)
        useCase.getSavedIds(completion: { ids in
            XCTAssertTrue( ids.contains(where: {$0 ==  (self.fixture.id ?? 0)}))
            // Fulfill the expectation to indicate that the completion closure has been called
            expectation.fulfill()
        })
    }
    
}
