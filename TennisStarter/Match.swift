class Match {
    var sets = Sets()
    var setGame = SetGame()
    var game = Game()
    var tieBreakGame: TieBreakGame? // Declare tieBreakGame as optional
    
    var gameUpdateHandler: (() -> Void)?

    func startNewSet() {
        setGame = SetGame()
        gameUpdateHandler?()
    }
    
    func startNewGame() {
        game = Game()
        gameUpdateHandler?()
    }
    
    func startTieBreakGame() {
        tieBreakGame = TieBreakGame() // Initialize tieBreakGame when needed
        gameUpdateHandler?()
    }
    
    func tieBreakWon() -> Bool {
        guard let tieBreakGame = tieBreakGame else { return false }
        
        if tieBreakGame.player1Won() {
            startNewGame()
            //startTieBreakGame()
            setGame.addPlayer1Games()
            return true
        } else if tieBreakGame.player2Won() {
            startNewGame()
            //startTieBreakGame()
            setGame.addPlayer2Games()
            return true
        }
        return false
    }
    
    
    
    
    
    
    
    func gameWon() {
               
        if game.player1Won() {
            setGame.addPlayer1Games()
            
            
            if !sets.fifthSetFlag() && setGame.tiebreak()  {
                startTieBreakGame()
                return
            }
            
            startNewGame()
            return
            
        } 
        else if game.player2Won() {
            setGame.addPlayer2Games()
            
            if !sets.fifthSetFlag() && setGame.tiebreak()  {
                startTieBreakGame()
                return
            }
            
            startNewGame()
            return
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    func setWon() {
        if setGame.player1WonSet() {
            startNewSet()
            sets.addPlayer1Sets()
            return
        } else if setGame.player2WonSet() {
            startNewSet()
            sets.addPlayer2Sets()
            return
        }
    }
    
    
    
    
    
    
    
    
    
    
    func setWonByTieBreak(){
        if !sets.fifthSetFlag(){
            if setGame.player1WonSetFromTieBreak() {
                startNewSet()
                sets.addPlayer1Sets()
                return
            } else if setGame.player2WonSetFromTieBreak() {
                startNewSet()
                sets.addPlayer2Sets()
                return
            }
        }
    }
}
