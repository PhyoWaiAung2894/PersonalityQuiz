//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by PhyoWai Aung on 7/3/23.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var response : [Answer]
    init?(coder: NSCoder,reponse : [Answer]){
        self.response = reponse
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @IBOutlet var resultAnswerLabel: UILabel!
    
    @IBOutlet var resultDefinitionLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        calculatePersonalityResult()
        navigationItem.hidesBackButton = true
    }
    func calculatePersonalityResult() {
        let frequencyAnswers = response.reduce(into: [:]){
            (counts,answer) in
            counts[answer.type,default : 0] += 1
        }
        
//        let frequentAnswerSorted = frequencyAnswers.sorted(by:
//        { (pair1, pair2) in
//            return pair1.value > pair2.value
//
//        }
//        )
        let mostCommonAnswer = frequencyAnswers.sorted{ $0.1 > $1.1 }.first!.key
        
        resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
        resultDefinitionLabel.text = mostCommonAnswer.definition
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
