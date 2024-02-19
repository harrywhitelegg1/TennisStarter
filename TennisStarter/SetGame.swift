class SetGame {
    
    private var player1GamesValue = 0
    private var player2GamesValue = 0
    
    
    func addPlayer1Games (){
        player1GamesValue += 1
    }
    func addPlayer2Games (){
        player2GamesValue += 1
    }
    
    func player1Games() -> String{
        return String(player1GamesValue)
    }
    func player2Games() -> String{
        return String(player2GamesValue)
    }

    
    
    
    
    
    func player1WonSet() -> Bool{
        if player1GamesValue >= 6 && player2GamesValue <= player1GamesValue - 2{
            return true
        }
        
 
        return false
    }
    func player2WonSet() -> Bool{
        
        if player2GamesValue >= 6 && player1GamesValue <= player2GamesValue - 2{
            return true
        }

        return false
    }
    
    
    
    
    
    
    
    
    
    func player1WonSetFromTieBreak() -> Bool{
        if player1GamesValue == 7 {
            return true
        }
        return false
    }
    func player2WonSetFromTieBreak() -> Bool{
        if player2GamesValue == 7 {
            return true
        }
        return false
    }
        
    func tiebreak() -> Bool {
        if player1GamesValue == 6 && player2GamesValue == 6{
            return true
        }
        return false
    }
    

    
    
    
    
    
    
    
    /**
     Returns true if the game is finished, false otherwise
     */
    func complete() ->Bool {
        return player1WonSet() || player2WonSet()
        
    }
}
