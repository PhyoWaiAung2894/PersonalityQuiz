//
//  QuestionViewController.swift
//  PersonalityQuiz
//
//  Created by PhyoWai Aung on 7/3/23.
//

import UIKit

class QuestionViewController: UIViewController {

    var questionIndex = 0
    var answerChosen : [Answer] = []
    
    @IBOutlet var questionLabel: UILabel!
    
    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var singleButton1: UIButton!
    @IBOutlet var singleButton2: UIButton!
    @IBOutlet var singleButton3: UIButton!
    @IBOutlet var singleButton4: UIButton!
    
    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var multiLabel1: UILabel!
    @IBOutlet var multiLabel2: UILabel!
    @IBOutlet var multiLabel3: UILabel!
    @IBOutlet var multiLabel4: UILabel!
    @IBOutlet var multiSwitch1: UISwitch!
    @IBOutlet var multiSwitch2: UISwitch!
    @IBOutlet var multiSwitch3: UISwitch!
    @IBOutlet var multiSwitch4: UISwitch!
    
    @IBOutlet var rangedSlider: UISlider!
    
    @IBOutlet var rangeStackView: UIStackView!
    @IBOutlet var rangedLabel1: UILabel!
    @IBOutlet var rangedLabel2: UILabel!
    
    @IBOutlet var questionProgressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        // Do any additional setup after loading the view.
        
        
    }
    
    
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswer = questions[questionIndex].answer
        
        switch sender {
        case singleButton1:
            answerChosen.append(currentAnswer[0])
        case singleButton2:
            answerChosen.append(currentAnswer[1])
        case singleButton3:
            answerChosen.append(currentAnswer[2])
        case singleButton4:
            answerChosen.append(currentAnswer[3])
        default:
            break
            
            
        }
        nextQuestion()
    }
    
    
    @IBSegueAction func showResults(_ coder: NSCoder) -> ResultsViewController? {
        return ResultsViewController(coder: coder,reponse: answerChosen)
    }
    @IBAction func rangedAnswerButtonPressed() {
        let currentAnswer =  questions[questionIndex].answer
        let index = Int(round(rangedSlider.value * Float(currentAnswer.count - 1)))
        answerChosen.append(currentAnswer[index])
        nextQuestion()
    }
    
    @IBAction func multiAnswerButtonPressed() {
        let currentAnswer = questions[questionIndex].answer
        
        if multiSwitch1.isOn{
            answerChosen.append(currentAnswer[0])
        }
        if multiSwitch2.isOn{
            answerChosen.append(currentAnswer[1])
        }
        if multiSwitch3.isOn{
            answerChosen.append(currentAnswer[2])
        }
        if multiSwitch4.isOn{
            answerChosen.append(currentAnswer[3])
            
        nextQuestion()
        }
    }
    
    func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
        }else {
            performSegue(withIdentifier: "Results", sender: nil)
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    func updateUI(){
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangeStackView.isHidden = true
        
        let currentQuestion = questions[questionIndex]
        let currentAnswer = currentQuestion.answer
        let totalProgress = Float(questionIndex)/Float(questions.count)
        
        navigationItem.title = "Question # \(questionIndex + 1)"
        questionLabel.text = currentQuestion.text
        questionProgressView.setProgress(totalProgress, animated: true)
        
        switch currentQuestion.type {
        case .singel :
            updateSingleStack(using: currentAnswer)
        case .multiple :
            updateMultipleStack(using: currentAnswer)
        case .ranged :
            updateRangedStack(using: currentAnswer)
        }
    }
    
    func updateSingleStack(using answers : [Answer]) {
        singleStackView.isHidden = false
        singleButton1.setTitle(answers[0].text, for: .normal)
        singleButton2.setTitle(answers[1].text, for: .normal)
        singleButton3.setTitle(answers[2].text, for: .normal)
        singleButton4.setTitle(answers[3].text, for: .normal)
    }

    func updateMultipleStack(using answers : [Answer]) {
        multipleStackView.isHidden = false
        multiSwitch1.isOn = false
        multiSwitch2.isOn = false
        multiSwitch3.isOn = false
        multiSwitch4.isOn = false
        
        multiLabel1.text = answers[0].text
        multiLabel2.text = answers[1].text
        multiLabel3.text = answers[2].text
        multiLabel4.text = answers[3].text
    }
    
    func updateRangedStack(using answers : [Answer]) {
        rangeStackView.isHidden = false
        rangedSlider.setValue(0.5, animated: false)
        rangedLabel1.text = answers.first?.text
        rangedLabel2.text = answers.last?.text
    }
}
