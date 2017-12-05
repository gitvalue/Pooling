import XCTest
@testable import Pooling

class PoolingTests: XCTestCase {
    var initiallyEmptyPool: Pool<Int>!
    var initiallyFullPool: Pool<Int>!
    
    override func setUp() {
        super.setUp()
        
        initiallyEmptyPool = Pool<Int>(size: 0, creator: { return 1 })
        initiallyFullPool = Pool<Int>(size: 50, creator: { return 2 })
    }
    
    override func tearDown() {
        initiallyEmptyPool = nil
        initiallyFullPool = nil
        
        super.tearDown()
    }
    
    func testIfRecallIsWorkingCorrectly() {
        // 1. given
        let ints = [ 1, 1, 2, 3, 5, 8, 13, 21, 34, 55 ]
        
        // 2. when
        for int in ints {
            initiallyEmptyPool.recall(int)
        }
        
        // 3. then
        for _ in 0..<ints.count {
            XCTAssertTrue(ints.contains(initiallyEmptyPool.borrow()), "initally empty pool contains some other values that it recalled")
        }
    }
    
    func testIfBorrowIsWorkingCorrectly() {
        // 1. given
        let recalledIntsCount = 50
        let recallValue = 23
        let initialPoolSize = 50
        
        // 2. when
        for _ in 0..<recalledIntsCount {
            initiallyFullPool.recall(recallValue)
        }
        
        // 3. then
        for _ in 0..<recalledIntsCount {
            XCTAssertEqual(initiallyFullPool.borrow(), recallValue)
        }
        
        for _ in 0..<initialPoolSize {
            XCTAssertEqual(initiallyFullPool.borrow(), 2)
        }
    }
}

