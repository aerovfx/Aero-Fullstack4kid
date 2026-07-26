import Foundation

struct QuizBrain {
    let quiz = [
        Question(q: "Trí tuệ nhân tạo là một lĩnh vực của khoa học máy tính", a: "True"),
        Question(q: "AI có thể học và cải thiện qua kinh nghiệm", a: "True"),
        Question(q: "Trí tuệ nhân tạo chỉ được sử dụng trong các ngành công nghệ", a: "False"),
        Question(q: "Học máy (Machine Learning) là một nhánh của AI", a: "True"),
        Question(q: "Mạng nơ-ron nhân tạo mô phỏng cách hoạt động của não người", a: "True")
    ]
    
    var questionNumber = 0
    
    func getQuestionText() -> String {
        return quiz[questionNumber].text
    }
    
    func getProgress() -> Float {
        return Float(questionNumber + 1) / Float(quiz.count)
    }
    
    mutating func checkAnswer(userAnswer: String) -> Bool {
        if userAnswer == quiz[questionNumber].answer {
            return true
        } else {
            return false
        }
    }
    
    mutating func nextQuestion() {
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
    }
}
