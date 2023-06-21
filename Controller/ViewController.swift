import UIKit
import Dispatch

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var optionOne: UIButton!
    @IBOutlet weak var optionTwo: UIButton!
    @IBOutlet weak var optionThree: UIButton!
    
         
    var quizBrain =  QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func answerButton(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil,repeats: false)
        
    }
    
    @objc func updateUI() {
        let answers = quizBrain.getQuestionAnswers()
        
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        optionOne.setTitle(answers[0], for: .normal)
        optionTwo.setTitle(answers[1], for: .normal)
        optionThree.setTitle(answers[2], for: .normal)
        
        optionOne.backgroundColor = UIColor.clear
        optionTwo.backgroundColor = UIColor.clear
        optionThree.backgroundColor = UIColor.clear
    }

    
} 

