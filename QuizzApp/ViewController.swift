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
        ["2 더하기 4 은 6 이다.","True"],
        ["5 더하기 7 은 12 이다?","True"],
        ["9 더하기 3 은 10 이다?","False"]
    ]
    
    var questionNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
            
    }

    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle
        let actualAnswer =  quizz[questionNumber][1]
        
        // 미리 정해져있는 답과 유저의 답과 맞는지 확인
        if userAnswer == actualAnswer {
            print("참")
        }else{
            print("거짓")
        }
        //count 길이 구하기
        if questionNumber  <  quizz.count-1{
            questionNumber +=  1
        }else{
            questionNumber = 0
        }
        
        updateUI()
    }
    
    func updateUI() {
        // 라벨에 질문 보여주기
        self.questionLabel.text = quizz[questionNumber][0]
    }

}

