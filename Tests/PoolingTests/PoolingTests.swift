import XCTest
@testable import Pooling

class PoolingTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
//        XCTAssertEqual(Pooling().text, "Hello, World!")
        
        let defaultInt = 0
        
        let pool = Pool<Int>(size: 50) {
            return defaultInt
        }
        
        var values: [Int] = []
        
        for i in 1..<51 {
            var value = pool.borrow()
            value = i
            
            values.append(value)
        }
        
        for i in 0..<50 {
            pool.recall(values[i])
        }
        
        for _ in 0..<50 {
            let value = pool.borrow()
            XCTAssertNotEqual(value, defaultInt)
        }
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
