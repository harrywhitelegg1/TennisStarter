class Sets{
    
    private var player1SetsValue = 0
    private var player2SetsValue = 0
    
    
    func addPlayer1Sets (){
        player1SetsValue += 1
    }
    func addPlayer2Sets (){
        player2SetsValue += 1
    }
    
    func player1Sets() -> String{
        return String(player1SetsValue)
    }
    func player2Sets() -> String{
        return String(player2SetsValue)
    }
    
    
    func GameWonPlayer1() -> Bool{
        if player1SetsValue == 3{
            return true
        }
        return false
    }
    func GameWonPlayer2() -> Bool{
        if player2SetsValue == 3{
            return true
        }
        return false
    }
    func gameOver() -> Bool{
        return GameWonPlayer1() || GameWonPlayer2()
    }
    
}
