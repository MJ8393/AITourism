//
//  File.swift
//  AITourism
//
//  Created by Mekhriddin Jumaev on 21/01/23.
//

import UIKit

struct Question {
    let question: String
    let answer: String
    let image: UIImage
}

let questions = [
    Question(question: "Where is Uzbekistan?", answer: "In central Asia!", image: UIImage(named: "question1")!),
    Question(question: "Is Uzbekistan famous for?", answer: "Uzbekistan lies at the core of the ancient Silk Road, it a country that is home to the three most important Silk Road cities, Samarkand, Bukhara, and Khiva. Uzbekistan's UNESCO World Heritage gem, the incredibly historic town of Samarkand is a melting pot of cultures from all over the world.", image: UIImage(named: "question2")!),
    Question(question: "Which city is the capital of Uzbekistan?", answer: "Tashkent", image: UIImage(named: "question3")!),
    Question(question: "Is Uzbekistan cheap?", answer: "Although not as cheap as other Central Asian countries like Kyrgyzstan or Tajikistan, Uzbekistan is still extremely affordable by Western standards. It's just slightly more expensive than Kazakhstan. Mosques, shrines, madrasahs, and museums are generally very cheap (between 1 and 3 USD for the visit).", image: UIImage(named: "question4")!),
    Question(question: "Is Uzbekistan safe?", answer: "Starting from 30-35 USD per person a day for accommodation, meals, and wandering around the city. This small post shows that traveling in Uzbekistan can be as cheap as 35 USD per day or can be 135 USD and more for one day with all services included.", image: UIImage(named: "question5")!),
]
