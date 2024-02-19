import UIKit
import AVFoundation

class ViewController: UIViewController {

    var match = Match()
    var sets: Sets!
    var setGame: SetGame!
    var game: Game!
    var tieBreakGame: TieBreakGame!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the closure to update game property
        match.gameUpdateHandler = { [weak self] in
            // Update the game property
            self?.game = self?.match.game
            self?.setGame = self?.match.setGame
            self?.tieBreakGame = self?.match.tieBreakGame
            // Call UI update methods as needed
            // Check if a tiebreak game is updated
            self?.updatePointUI()
            self?.updateTieBreakPointUI()
            self?.updateGameSetsUI()
            // Other UI updates...
        }
        
        
        // Accessing the properties of Match after self is fully initialized
        sets = match.sets
        setGame = match.setGame
        game = match.game
        tieBreakGame = match.tieBreakGame
    }
    
    @IBOutlet weak var p1Button: UIButton!
    @IBOutlet weak var p2Button: UIButton!
    @IBOutlet weak var p1NameLabel: UILabel!
    @IBOutlet weak var p2NameLabel: UILabel!
    
    @IBOutlet weak var p1PointsLabel: UILabel!
    @IBOutlet weak var p2PointsLabel: UILabel!
    
    @IBOutlet weak var p1GamesLabel: UILabel!
    @IBOutlet weak var p2GamesLabel: UILabel!
    
    @IBOutlet weak var p1SetsLabel: UILabel!
    @IBOutlet weak var p2SetsLabel: UILabel!
    
    @IBOutlet weak var p1PreviousSetsLabel: UILabel!
    @IBOutlet weak var p2PreviousSetsLabel: UILabel!
    
    
    //create a new match
    private func newMatch(){
        match = Match()
        viewDidLoad()
        updatePointUI()
        updateGameSetsUI()
    }
    
    
    /********Methods*********/
    @IBAction func p1AddPointPressed(_ sender: UIButton) {
        if sets.fifthSetFlag(){
            normalGameP1()
        }
        else if setGame.tiebreak() && !sets.fifthSetFlag(){
            tieBreakGameP1()
        }
        else {
            normalGameP1()
        }
        updateGameSetsUI()
        if gameOverFlag(){
            endOfGameAlert()
        }
        
    }
    
    @IBAction func p2AddPointPressed(_ sender: UIButton) {
        if sets.fifthSetFlag(){
            normalGameP2()
        }
        else if setGame.tiebreak() && !sets.fifthSetFlag(){
            tieBreakGameP2()
        }
        else {
            normalGameP2()
        }
        updateGameSetsUI()
        if gameOverFlag(){
            endOfGameAlert()
        }
    }
    
    @IBAction func restartPressed(_ sender: AnyObject) {
        newMatch()
        p1Button.isEnabled = true
        p2Button.isEnabled = true
    }
    
    
    
    

    private func tieBreakGameP1(){
        tieBreakGame.addPointToPlayer1()
        updateTieBreakPointUI()
        if match.tieBreakWon(){
            updatePointUI()
        }
        match.setWonByTieBreak()

    }
    
    private func tieBreakGameP2(){
        tieBreakGame.addPointToPlayer2()
        updateTieBreakPointUI()
        if match.tieBreakWon(){
            updatePointUI()
        }
        match.setWonByTieBreak()
    }
    
    
    private func normalGameP1(){
        game.addPointToPlayer1()
        match.gameWon()
        match.setWon()
        if setGame.tiebreak() && !sets.fifthSetFlag(){
            updateTieBreakPointUI()
        } else{
            updatePointUI()
        }

    }
    
    private func normalGameP2(){
        game.addPointToPlayer2()
        match.gameWon()
        match.setWon()
        if setGame.tiebreak() && !sets.fifthSetFlag(){
            updateTieBreakPointUI()
        } else{
            updatePointUI()
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
        
    private func updatePointUI() {
        p1PointsLabel.text = game.player1Score()
        p2PointsLabel.text = game.player2Score()
    }
    
    private func updateTieBreakPointUI() {
        if !sets.fifthSetFlag() && setGame.tiebreak(){
            p1PointsLabel.text = tieBreakGame.player1Score()
            p2PointsLabel.text = tieBreakGame.player2Score()
        }
    }
    
    private func updateGameSetsUI(){
        p1GamesLabel.text = setGame.player1Games()
        p2GamesLabel.text = setGame.player2Games()
        p1SetsLabel.text = sets.player1Sets()
        p2SetsLabel.text = sets.player2Sets()
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    private func endOfGameAlert(){
        
        p1Button.isEnabled = false
        p2Button.isEnabled = false
        var whoWon = ""
        
        if sets.GameWonPlayer1(){
            whoWon = "Player 1"
        } else if sets.GameWonPlayer2(){
            whoWon = "Player 2"
        }
        let message = "\(whoWon) won the match!"
        
        // Create an alert controller
        let alertController = UIAlertController(title: "Game Over", message: message, preferredStyle: .alert)
        
        // Create an action for the OK button
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            // Handle OK button tap
        }
        
        // Add the OK action to the alert controller
        alertController.addAction(okAction)
        
        // Present the alert controller
        self.present(alertController, animated: true, completion: nil)
    }
    
    private func gameOverFlag() -> Bool{
        return sets.gameOver()
    }
    
    
    
    
    
    
    
}
