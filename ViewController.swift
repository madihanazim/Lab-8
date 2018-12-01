//
//  ViewController.swift
//  Lab1-flash card
//
//  Created by Owner on 10/13/18.
//  Copyright © 2018 codepath. All rights reserved.
//

import UIKit


struct Flashcard{
    var question:String
    var answer:String
}
class ViewController: UIViewController {
    
    @IBOutlet weak var Container: UIView!
    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var backLabel: UILabel!
    
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    var currentIndex = 0
    //Array to hold our flashcard
    var flashcards = [Flashcard]()
    
    
    @IBAction func didTapOnNext(_ sender: Any) {
     
        //increase current index
        currentIndex = currentIndex + 1
        
        //Update labels
        updateLabels()
        //Update buttons
        updateNextPrevButtons()
    }
    
    @IBAction func didTapOnPrev(_ sender: Any) {
    
        //increase current index
        currentIndex = currentIndex - 1
        
        //Update labels
        updateLabels()
        //Update buttons
        updateNextPrevButtons()
    
    }
    //Array to hold our flashcard
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateFlashcard(question:"What is the capital of Brazil?", answer: "Brasilia")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didTapOnFlashcard(_ sender: Any) {
        //frontLabel.isHidden=true
        flipFlashcard()
    }
    func flipFlashcard(){
        frontLabel.isHidden=true
        UIView.transition(with:Container, duration: 0.3, options:.transitionFlipFromRight, animations:{
            self.frontLabel.isHidden = true
        })
    }
    
    
    func updateFlashcard(question: String, answer: String) {
        let flashcard = Flashcard(question: question, answer: answer)
        frontLabel.text = question
        backLabel.text = answer
     //Adding flashcard in the flashcar array
        flashcards.append(flashcard)
        print("Added new flashcard!")
        print("We now have \(flashcards.count)flashcards")
        currentIndex = flashcards.count - 1
        print("Our current index is\(currentIndex)")
        
        
        
        //update buttons
    updateNextPrevButtons()
    }
    
    
        func updateNextPrevButtons() {
            if currentIndex == flashcards.count - 1{
                nextButton.isEnabled = false
            } else {
                nextButton.isEnabled = true
            }
            if currentIndex == 0 {
                prevButton.isEnabled = false
            } else {
                prevButton.isEnabled = true
            }
    }
        
    func animateContainerOut(){
    
    UIView.animate(withDuration: 0.3,animations: {
        self.Container.transform = CGAffineTransform.identity.translatedBy(x: -300.0, y: 0.0)
    }, completion: { finished in
    
    // updte labels
        self.updateLabels()
    
    // Run other animation
        self.updateLabels()
    })
    }
    func updateLabels(){
        
        //Get current flashcard
        let currentFlashcard = flashcards[currentIndex]
            
            //update labels
            frontLabel.text = currentFlashcard.question
            backLabel.text = currentFlashcard.answer
        
    }
    
    func saveAllFlashcardsToDisk(){
        
        let dictionaryArray = flashcards.map { (card) -> [String: String] in
            return ["question": card.question,"answer": card.answer]
            
            
        }
        UserDefaults.standard.set(dictionaryArray, forKey: "flashcards")
        
        print("My flash cards saved")
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender:Any?) {
        let navigationController = segue.destination as! UINavigationController
        
        let creationController = navigationController.topViewController as! CreationViewController
        creationController.flashcardController = self
        
    }
    
}
