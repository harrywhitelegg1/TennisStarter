class TieBreakGame {
    
    private var player1Point = 0
    private var player2Point = 0

    
    func addPointToPlayer1(){
        player1Point += 1
    }
    func addPointToPlayer2(){
        player2Point += 1
    }
    func player1Score() -> String {
        return String(player1Point)
    }

    func player2Score() -> String {
        return String(player2Point)
    }
    
    
    func player1Won() -> Bool {
        if player1Point >= 7 && player2Point < player1Point - 2{
            return true
        }
        return false
    }
    func player2Won() -> Bool {
        if player2Point >= 7 && player1Point < player2Point - 2{
            return true
        }
        return false
    }
    
}
