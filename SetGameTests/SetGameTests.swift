import XCTest
@testable import TennisStarter

final class SetGameTests: XCTestCase {

    var setGame: SetGame!
    var mirror: Mirror!
    
    override func setUp() {
        super.setUp()
        setGame = SetGame()
        mirror = Mirror(reflecting: setGame!)
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
    
    func getToTieBreak(){
        setGame.addPlayer1Games() //1 - 0
        setGame.addPlayer1Games() //2 - 0
        setGame.addPlayer1Games() //3 - 0
        setGame.addPlayer1Games() //4 - 0
        setGame.addPlayer1Games() //5 - 0
        setGame.addPlayer1Games() //6 - 0
        
        setGame.addPlayer2Games() //1 - 1
        setGame.addPlayer2Games() //2 - 2
        setGame.addPlayer2Games() //3 - 3
        setGame.addPlayer2Games() //4 - 4
        setGame.addPlayer2Games() //5 - 5
        setGame.addPlayer2Games() //6 - 6
    }
    
    func testZeroPoints(){
        XCTAssertEqual(setGame.player1Games(), "0", "P1 game count correct with 0 points")
        XCTAssertEqual(setGame.player2Games(), "0", "P2 game count correct with 0 points")
    }
    
    func testAddOnePoint() {
        
        setGame.addPlayer1Games()
        XCTAssertEqual(setGame.player1Games(),"1","P1 game count correct with 1 point")
        
        setGame.addPlayer2Games()
        XCTAssertEqual(setGame.player2Games(),"1","P2 game count correct with 1 point")
    }
    func testAddTwoPoints() {
        
        setGame.addPlayer1Games()
        setGame.addPlayer1Games()
        
        XCTAssertEqual(setGame.player1Games(),"2","P1 game count correct with 2 points")
        
        setGame.addPlayer2Games()
        setGame.addPlayer2Games()
        
        XCTAssertEqual(setGame.player2Games(),"2","P2 game count correct with 2 points")
    }
    
    func testAddThreePoints() {
        
        setGame.addPlayer1Games()
        setGame.addPlayer1Games()
        setGame.addPlayer1Games()
        XCTAssertEqual(setGame.player1Games(),"3","P1 game count correct with 3 points")
        
        setGame.addPlayer2Games()
        setGame.addPlayer2Games()
        setGame.addPlayer2Games()
        XCTAssertEqual(setGame.player2Games(),"3","P2 game count correct with 3 points")
    }
    
    func testSimpleWinP1(){
        for _ in 0...6{
            setGame.addPlayer1Games()
        }
        XCTAssertTrue(setGame.player1WonSet(), "P1 win after 6 consecutive games")
    }
    
    func testSimpleWinP2(){
        for _ in 0...6{
            setGame.addPlayer2Games()
        }
        XCTAssertTrue(setGame.player2WonSet(), "P1 win after 6 consecutive games")
    }
    
    func testComplexWinP1(){
        for _ in 0...6{
            setGame.addPlayer1Games()
        }
        for _ in 0...5{
            setGame.addPlayer2Games()
        }
        setGame.addPlayer1Games()
        XCTAssertTrue(setGame.player1WonSet(), "P1 wins the set, score 7:5")
        XCTAssertFalse(setGame.tiebreak(), "A tie break is not required to have a winner of the set")
    }
    func testComplexWinP2(){
        for _ in 0...6{
            setGame.addPlayer2Games()
        }
        for _ in 0...5{
            setGame.addPlayer1Games()
        }
        setGame.addPlayer2Games()
        XCTAssertTrue(setGame.player2WonSet(), "P2 wins the set, score 7:5")
        XCTAssertFalse(setGame.tiebreak(), "A tie break is not required to have a winner of the set")
    }
    func testTieBreakRequired() {
        getToTieBreak()
        XCTAssertTrue(setGame.tiebreak(), "A tie break is required to have a winner of the set")
    }


}

