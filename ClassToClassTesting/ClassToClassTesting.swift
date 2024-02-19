import XCTest

@testable import TennisStarter


final class ClassToClassTesting: XCTestCase {
    var match: Match!
    var sets: Sets!
    var setGame: SetGame!
    var game: Game!
    var tieBreakGame: TieBreakGame!
    
    override func setUp() {
        super.setUp()
        match = Match()
        sets = match.sets
        setGame = match.setGame
        game = match.game
        tieBreakGame = match.tieBreakGame
    }
    
    override func tearDown() {
        super.tearDown()
    }
      
    
}
