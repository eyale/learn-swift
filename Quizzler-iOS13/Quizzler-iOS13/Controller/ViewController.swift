//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var option2: UIButton!
    @IBOutlet weak var option3: UIButton!
    @IBOutlet weak var score: UILabel!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        question.text = quizBrain.getQuestionText()
        option1.setTitle(quizBrain.getButtonsTitle(0), for: .normal)
        option2.setTitle(quizBrain.getButtonsTitle(1), for: .normal)
        option3.setTitle(quizBrain.getButtonsTitle(2), for: .normal)
        option1.layer.cornerRadius = 20
        option2.layer.cornerRadius = 20
        option3.layer.cornerRadius = 20
        score.text = "Score: \(quizBrain.getScore())"
        progressBar.progress = quizBrain.getProgress()
    }
    
    @IBAction func answerBtnHandler(_ sender: UIButton) {
        let isAnswerCorrect = quizBrain.checkAnswer(sender.currentTitle!)
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        if isAnswerCorrect {
            sender.backgroundColor = .green
        } else {
            sender.backgroundColor = .systemPink
        }
        quizBrain.nextQuestion()
    }
    @objc func updateUI() {
        question.text = quizBrain.getQuestionText()
        option1.setTitle(quizBrain.getButtonsTitle(0), for: .normal)
        option2.setTitle(quizBrain.getButtonsTitle(1), for: .normal)
        option3.setTitle(quizBrain.getButtonsTitle(2), for: .normal)
        progressBar.progress = quizBrain.getProgress()
        score.text = "Score: \(quizBrain.getScore())"
        option1.backgroundColor = .clear
        option2.backgroundColor = .clear
        option3.backgroundColor = .clear
    }
}

