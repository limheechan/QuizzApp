//
//  QuizeBrain.swift
//  QuizzApp
//
//  Created by 임희찬 on 2022/07/11.
//

import Foundation

struct QuizeBrain {
    let quizz = [
                Question(q: "A slug's blood is green.", a: "True"),
                Question(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
                Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
                Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
                Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
                Question(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
                Question(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
                Question(q: "Google was originally called 'Backrub'.", a: "True"),
                Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
                Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
                Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
                Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")
    ]
    var questionNumber = 0
    
    var point: Int = 0
    
    //mutating
    //특정 메소드 내에서 구조체 또는 열거형의 프로퍼티를 수정해야 하는 경우, 해당 메소드의 동작을 변경하도록 하는 것
    mutating func nextQuestion(){
        //count 길이 구하기
        if questionNumber  <  quizz.count-1{
            self.questionNumber +=  1
        }else{
            self.questionNumber = 0
            self.point = 0
        }
    }
  
    mutating func checkQuizeAnswer (answr userAnswer: String)  ->  Bool {
        if userAnswer ==  self.quizz[questionNumber].answer{
            //Right
            point += 1
            return true
        }else{
            //Wrong
            return false
        }
    }
    
    func getQuestionText(n : Int) -> String {
        return quizz[n].text
    }
    
    func getProgress(p : Float) -> Float {
        let percentProgress =  p / Float(quizz.count)
        return Float(percentProgress)
    }
    
     func getPoint() -> Int {
        //끝나면 0
        // true 일떄마다 1 point
        
        return self.point
    }
}

