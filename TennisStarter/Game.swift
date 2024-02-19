class Game {
      
    
    private var player1Point = 0
    private var player2Point = 0
    /**
     This method will be called when player 1 wins a point and update the state of the instance of Game to reflect the change
     */
    func addPointToPlayer1(){
        if player2Point < 3{
            player1Point += 1
        }
        if player2Point == 3{
            player1Point += 1
        }
        if player2Point == 4{
            player2Point -= 1
        }

    }
    /**
     This method will be called when player 2 wins a point
     */
    func addPointToPlayer2(){
        if player1Point < 3{
            player2Point += 1
        }
        if player1Point == 3{
            player2Point += 1
        }
        if player1Point == 4{
            player1Point -= 1
        }
    }

    /**
     Returns the score for player 1, this will only ever be "0","15","30","40" or "A"
     If the game is complete, this should return an empty string
     */
    func player1Score() -> String {
        
        switch player1Point {
        case 0:
            return "0"
        case 1:
            return "15"
        case 2:
            return "30"
        case 3:
            return "40"
        case 4 where player2Point == 3:
            return "A"
        case 4:
            return ""
        default:
            return ""
        }
        
    }

    /**
     Returns the score for player 2, this will only ever be "0","15","30","40" or "A"
     If the game is complete, this should return an empty string
     */
    func player2Score() -> String {
        switch player2Point {
        case 0:
            return "0"
        case 1:
            return "15"
        case 2:
            return "30"
        case 3:
            return "40"
        case 4 where player1Point == 3:
            return "A"
        case 4:
            return ""
        default:
            return ""
        }
        
    }
    
    /**
     Returns true if player 1 has won the game, false otherwise
     */
    func player1Won() -> Bool{
        
        if player1Score() == ""{
            return true
        }
        
        return false
    }
    
    /**
     Returns true if player 2 has won the game, false otherwise
     */
    func player2Won() -> Bool{
        if player2Score() == ""{
            return true
        }
        
        return false
    }
    
    /**
     Returns true if the game is finished, false otherwise
     */
    func complete() ->Bool {
        return player1Won() || player2Won()
        
    }
    
    /**
     If player 1 would win the game if they won the next point, returns the number of points player 2 would need to win to equalise the score, otherwise returns 0
     e.g. if the score is 40:15 to player 1, player 1 would win if they scored the next point, and player 2 would need 2 points in a row to prevent that, so this method should return 2 in that case.
     */
    func gamePointsForPlayer1() -> Int{
        if player1Point >= 3{
            return player1Point - player2Point
        }
        return 0
    }
    
    /**
     If player 2 would win the game if they won the next point, returns the number of points player 1 would need to win to equalise the score
     */
    func gamePointsForPlayer2() -> Int {
        if player2Point >= 3{
            return player2Point - player1Point
        }
        return 0
        
    }
    
}
