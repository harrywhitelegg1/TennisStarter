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
            self?.updatePointUI()
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
    
    

    private func newMatch(){
        match = Match()
        viewDidLoad()
        updatePointUI()
        updateGameUI()
        updateSetsUI()
    }
    
    
    /********Methods*********/
    @IBAction func p1AddPointPressed(_ sender: UIButton) {
        if setGame.tiebreak(){
            tieBreakGameP1()
        }
        else if !setGame.tiebreak(){
            normalGameP1()
        }
        updateGameUI()
        updateSetsUI()
        if gameOverFlag(){
            endOfGameAlert()
        }
        
    }
    
    @IBAction func p2AddPointPressed(_ sender: UIButton) {
        if setGame.tiebreak(){
            tieBreakGameP2()
        }
        else if !setGame.tiebreak(){
            normalGameP2()
        }
        updateGameUI()
        updateSetsUI()
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
        match.setWon()

    }
    
    private func tieBreakGameP2(){
        tieBreakGame.addPointToPlayer2()
        updateTieBreakPointUI()
        if match.tieBreakWon(){
            updatePointUI()
        }
        match.setWon()
    }
    
    
    private func normalGameP1(){
        game.addPointToPlayer1()
        match.gameWon()
        match.setWon()
        updatePointUI()
    }
    
    private func normalGameP2(){
        game.addPointToPlayer2()
        match.gameWon() // new game started here
        match.setWon()
        updatePointUI()
    }
    
        
    func updatePointUI() {
        p1PointsLabel.text = game.player1Score()
        p2PointsLabel.text = game.player2Score()
    }
    
    func updateTieBreakPointUI() {
        p1PointsLabel.text = tieBreakGame.player1Score()
        p2PointsLabel.text = tieBreakGame.player2Score()
    }
    
    func updateGameUI(){
        p1GamesLabel.text = setGame.player1Games()
        p2GamesLabel.text = setGame.player2Games()
    }
    func updateSetsUI(){
        p1SetsLabel.text = sets.player1Sets()
        p2SetsLabel.text = sets.player2Sets()
    }
    

    
    
    private func endOfGameAlert(){
        
        p1Button.isEnabled = false
        p2Button.isEnabled = false
        
        // Create an alert controller
        let alertController = UIAlertController(title: "Game Over", message: "This is an alert message.", preferredStyle: .alert)
        
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
