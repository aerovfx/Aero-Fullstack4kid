import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var quizBrain = QuizBrain()

    override func viewDidLoad() {
        super.viewDidLoad()
        trueButton.setTitle("True", for: .normal)
        falseButton.setTitle("False", for: .normal)
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        guard let userAnswer = sender.currentTitle else { return }
        
        let isCorrect = quizBrain.checkAnswer(userAnswer: userAnswer)
        
        if isCorrect {
            print("Đáp án đúng!")
        } else {
            print("Sai rồi!")
        }
        
        quizBrain.nextQuestion()
        updateUI()
    }
    
    func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
    }
}
