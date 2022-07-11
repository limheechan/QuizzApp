//
//  ViewController.swift
//  QuizzApp
//
//  Created by 임희찬 on 2022/07/11.
//

import UIKit
//구성요소의 무엇을 하고 구성요소의 무엇을 변경 사항에 응답하도록 지시
class ViewController: UIViewController {

    @IBOutlet weak var pointLabel: UILabel!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var trueButton: UIButton!
    
    @IBOutlet weak var falseButton: UIButton!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
   
    
    var quizeBrain = QuizeBrain()
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
            
    }

    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        //유저의 답
        let userAnswer = sender.currentTitle
        //질문의 답
        if let userAnswer = userAnswer {
            let userGotIt = quizeBrain.checkQuizeAnswer(answr: userAnswer)
            
            if userGotIt == true {
                //print("참")
                sender.backgroundColor = UIColor.green
                sender.alpha = 0.4
            }else{
                //print("거짓")
                sender.backgroundColor = UIColor.red
                sender.alpha = 0.4
            }
            
        }else{
            print("nil")
        }
        
        //let actualAnswer =  quizz[questionNumber].answer
        
        // 미리 정해져있는 답과 유저의 답과 맞는지 확인
        
        quizeBrain.nextQuestion()
        
        // 반복할 필요 없어 repeats: false 설정합니다.
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    
    }
    
    @objc func updateUI() {
        // 라벨에 질문 보여주기
        
        self.questionLabel.text = quizeBrain.getQuestionText(n: quizeBrain.questionNumber ) // quizz[questionNumber].text
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        trueButton.alpha = 1.0
        falseButton.alpha = 1.0
        
        //progressBar
        //if quizeBrain.questionNumber <=  quizeBrain.quizz.count {
            //현재 진행 수 나누기 전체 값
            
        progressBar.progress = quizeBrain.getProgress(p: Float(quizeBrain.questionNumber + 1))
        
      //  }
        pointLabel.text  =  "Point \(quizeBrain.getPoint())"
        
    }

}

