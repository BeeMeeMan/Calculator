//
//  ViewController.swift
//  Calculator1
//
//  Created by user206820 on 10/20/21.
//

import UIKit
import Foundation

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! resultTableViewCell
        
        return cell
    }
    

    
    @IBOutlet var appButtons: [UIButton]!{
        didSet{
            for button in appButtons{
                button.layer.cornerRadius = 20
            }
        }
    }
    
    @IBOutlet weak var textTypingLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
    }
    
    
    
    // MARK: - Actions
    
    @IBAction func buttonsTyping(_ sender: UIButton){
        
        buttonAnimation(sender)
        
        
        
        
        
        let answer = answerLabel.text!
        
        if !answer.isEmpty {
            cancelTyping()
        }
        
        let symbol = sender.currentTitle!
        let text = textTypingLabel.text!
        let char = String(text.last!)
        
        switch symbol {
        case "(", ")" :
            
            BracketTyping(Current: symbol, Typed: text, Last: char)
            
        case ".":
            
            dotTyping(Current: symbol, Typed: text, Last: char)
            
        case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9":
            
            numberTyping(Current: symbol, Typed: text, Last: char)
            
        case "+", "-", "*", "/", "^":
            
            operatorsTyping(Current: symbol, Typed: text, Last: char)
            
        case "←":
            
            backSpaceTyping(Current: symbol, Typed: text, Last: char)
            
        case "=":
            
            equalTyping(Current: symbol, Typed: text, Last: char)
            
        case "C":
            
            cancelTyping()
            
        default: break
            
        }
        
    }
    
    
    
    
    // MARK: - Methods
    
    //  Bracket
    
    func BracketTyping(Current symbol: String, Typed text: String, Last char: String){
        let operators = ["+", "-", "*", "/", "^", "(", ]
        
        if symbol == ")" && unclosedBracketsNum(text) > 0 && !operators.contains(char){
            addTypingSymbol(symbol)
            
        }
        
        if text == "0" {
            clearTextTyping()
            addTypingSymbol(symbol)
            
        } else if operators.contains(char){
            
            addTypingSymbol(symbol)
            
            
        } else {
            
            return
            
        }
        clearAnswer()
        
        
        
        
        
    }
    
    // DotTyping
    
    func dotTyping(Current symbol: String, Typed text: String, Last char: String){
        
        let operators = ["+", "-", "*", "/", "^", "(", ]
        
        if operators.contains(char){
            addTypingSymbol("0\(symbol)")
            
        } else if !isDot(text) {
            
            addTypingSymbol(symbol)
            
        } else {
            return
        }
        
        
        
        func isDot(_ text: String) -> Bool{
            
            var result = false
            let operators = ["+", "-", "*", "/", "^", "(", ")" ]
            
            for i in text.reversed(){
                
                if String(i) == "." {
                    
                    result = true
                    break
                    
                } else if operators.contains(String(i)){
                    
                    result = false
                    break
                    
                }
                
            }
            return result
        }
        
    }
    
    // NumberTyping
    
    func numberTyping(Current symbol: String, Typed text: String, Last char: String){
        
        
        if text == "0" {
            
            clearTextTyping()
            addTypingSymbol(symbol)
            
        } else if char != ")" {
            
            addTypingSymbol(symbol)
            
        } else {
            return
        }
        
    }
    
    // OperatorTyping
    
    func operatorsTyping(Current symbol: String, Typed text: String, Last char: String){
        let operators = ["+", "-", "*", "/", "^", ".", "(" ]
        
        if !operators.contains(char){
            if text == "0" && char == "-" {
                
                clearTextTyping()
                addTypingSymbol(symbol)
                
            } else {
                
                addTypingSymbol(symbol)
                
                
            }
        } else if char == "(" && symbol == "-"{
            
            addTypingSymbol(symbol)
            
            
        } else {
            
            return
        }
    }
    
    
    // BackSpace
    
    func backSpaceTyping(Current symbol: String, Typed text: String, Last char: String){
        
        if text.count == 1{
            
            textTypingLabel.text! = "0"
            
        } else {
            
            textTypingLabel.text!.removeLast()
        }
        
    }
    
    // Equal Typing
    
    func equalTyping(Current symbol: String, Typed text: String, Last char: String){
        
        let operators = ["+", "-", "*", "/", "^", ".", "(" ]
        
        if operators.contains(char) {
            
            textTypingLabel.text!.removeLast()
            
        }
        
        for _ in 0..<unclosedBracketsNum(text) {
            
            addTypingSymbol(")")
            print(")")
        }
        
        
        
        let answer = count(textTypingLabel!.text!)
        answerLabel.text = "= \(String(format: "%.10g",answer))"
        
    }
    
    func cancelTyping(){
        
        textTypingLabel.text = "0"
        clearAnswer()
        
    }
    
    func unclosedBracketsNum(_ text: String) -> Int{
        var result = 0
        
        for i in text{
            
            if String(i) == "(" {
                
                result += 1
                
                
            } else if String(i) == ")" {
                
                result -= 1
            }
            
        }
        
        return result
    }
    
    
    
    func clearAnswer(){
        
        answerLabel.text = ""
        
    }
    
    func addTypingSymbol(_ string: String){
        textTypingLabel.text! += string
    }
    
    func clearTextTyping() {
        textTypingLabel.text! = ""
    }
    
    
}
