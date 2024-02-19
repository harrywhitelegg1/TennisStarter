class Match{
    
    var sets = Sets()
    var setGame = SetGame()
    var game = Game()
    var tieBreakGame = TieBreakGame()
    
    var gameUpdateHandler: (() -> Void)?
    
    
    
    func startNewSet(){
        setGame = SetGame()
        gameUpdateHandler?()
    }

        
    func startNewGame() {
        game = Game()
        gameUpdateHandler?()
    }
    
    func startTieBreakGame(){
        tieBreakGame = TieBreakGame()
        gameUpdateHandler?()
    }
    
    func tieBreakWon() -> Bool{
        if tieBreakGame.player1Won(){
            startNewGame()
            startTieBreakGame()
            setGame.addPlayer1Games()
            return true
        }
        else if tieBreakGame.player2Won(){
            startNewGame()
            startTieBreakGame()
            setGame.addPlayer2Games()
            return true
        }
        return false
    }
    
    func gameWon(){
        
        if setGame.tiebreak(){
            startTieBreakGame()
            return
        }
                
        if game.player1Won(){
            startNewGame()
            setGame.addPlayer1Games()
            return
        }
        else if game.player2Won() {
            startNewGame()
            setGame.addPlayer2Games()
            return
        }
    }
    

    
    func setWon(){
        if setGame.player1WonSet(){
            startNewSet()
            sets.addPlayer1Sets()
            return
        }
        else if setGame.player2WonSet(){
            startNewSet()
            sets.addPlayer2Sets()
            return
        }
    }
    
    
}
