import XCTest

@testable import TennisStarter

final class SetsTests: XCTestCase {

    var sets: Sets!
    var mirror: Mirror!
    
    override func setUp() {
        super.setUp()
        sets = Sets()
        mirror = Mirror(reflecting: sets!)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testMaxTwoInstanceVariables(){
        XCTAssertLessThanOrEqual(mirror.children.count, 2)
    }
    
    func testNotASubclass(){
        XCTAssertNil(mirror.superclassMirror)
    }
    
    func testIfInTheFifthSet(){
        
        sets.addPlayer1Sets()
        sets.addPlayer1Sets()
        sets.addPlayer2Sets()
        sets.addPlayer2Sets()
        
        XCTAssertTrue(sets.fifthSetFlag(), "Game is in the fifth set")
        
    }
    

}
