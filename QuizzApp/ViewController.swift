//
//  ViewController.swift
//  QuizzApp
//
//  Created by 임희찬 on 2022/07/11.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var trueButton: UIButton!
    
    @IBOutlet weak var falseButton: UIButton!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
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
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
            
    }

    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        //유저의 답
        let userAnswer = sender.currentTitle
        //질문의 답
        let actualAnswer =  quizz[questionNumber].answer
        
        // 미리 정해져있는 답과 유저의 답과 맞는지 확인
        if userAnswer == actualAnswer {
            //print("참")
            sender.backgroundColor = UIColor.green
            sender.alpha = 0.4
        }else{
            //print("거짓")
            sender.backgroundColor = UIColor.red
            sender.alpha = 0.4
        }
        //count 길이 구하기
        if questionNumber  <  quizz.count-1{
            questionNumber +=  1
        }else{
            questionNumber = 0
        }
        
        // 반복할 필요 없어 repeats: false 설정합니다.
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    
    }
    
    @objc func updateUI() {
        // 라벨에 질문 보여주기
        self.questionLabel.text = quizz[questionNumber].text
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        trueButton.alpha = 1.0
        falseButton.alpha = 1.0
        
        //progressBar
        if questionNumber <= quizz.count {
            //현재 진행 수 나누기 전체 값
            let percentProgress = Float(questionNumber + 1) / Float(quizz.count)
            progressBar.progress = Float(percentProgress)
            
        }
        
        
    }

}

