//
//  Question.swift
//  PersonalityQuiz
//
//  Created by PhyoWai Aung on 7/3/23.
//

import Foundation

struct Question {
    var text : String
    var type : ResponseType
    var answer : [Answer]
}

enum ResponseType {
    case singel, multiple, ranged
}

struct Answer {
    var text : String
    var type : AnimalType
}

enum AnimalType : Character {
    case dog = "🐶",cat = "🐱",rabbit = "🐰",turtle = "🐢"
    
    var definition : String {
        switch self{
        case .dog :
            return "You are incredibly outgoing. You surround yourself with the people you love and enjoy activities with your friends."
        case .cat:
            return "Mischievous, yet mind-temperd, you enjoy doing things on your own terms."
        case .rabbit:
            return "You love everyting that's soft. You are healty and full of energy."
        case .turtle:
            return "You are wise beyond your years, and you focus on the detail.Slow and steady win the race."
        }
    }
}
var questions : [Question] = [
    Question(
        text: "Which food do you like the most?", type: .singel, answer: [
            Answer(text: "Steak", type: .dog),
            Answer(text: "Fish", type: .cat),
            Answer(text: "Carrot", type: .rabbit),
            Answer(text: "Corn", type: .turtle)
        ]
    ),
    Question(
        text: "Which activites do you enjoy?", type: .multiple, answer: [
            Answer(text: "Swimming", type: .turtle),
            Answer(text: "Sleeping", type: .cat),
            Answer(text: "Cuddling", type: .rabbit),
            Answer(text: "Eating", type: .dog)
        ]
    ),
    Question(
        text: "How much do you enjoy car ride?", type: .ranged, answer: [
            Answer(text: "I dislike them.", type: .cat),
            Answer(text: "I get a little nervous.", type: .rabbit),
            Answer(text: "I barely notice them.", type: .turtle),
            Answer(text: "I love them.", type: .dog)
        ]
    ),
]
