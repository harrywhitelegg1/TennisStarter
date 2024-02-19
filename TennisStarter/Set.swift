import Foundation


class Set {
    
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
    
}
