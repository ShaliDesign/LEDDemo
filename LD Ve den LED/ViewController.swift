//
//  ViewController.swift
//  LD Ve den LED
//
//  Created by Linh&ShawnD on 2017-02-06.
//  Copyright © 2017 Shali Design. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    var thanhvien = ["ong", "ba", "bo", "me"]
    
    var lastonLED = -1
    
    var n = 5
    
    var _margin: CGFloat = 60

    override func viewDidLoad(){
        super.viewDidLoad()
    
        DrawRowOfBall()
        _ = Timer.scheduledTimer (timeInterval: 0.1, target: self, selector: #selector(runningLED), userInfo: nil, repeats: true)
        
        
    }
    
    @IBOutlet weak var LEDTextField: UITextField!
    
    @IBAction func Draw(_ sender: Any) {
        // n = Int(LEDTextField.text!)!
        
        DrawRowOfBall()
     
    }
    
    
    func runningLED() {
      
        
        if (lastonLED != -1)
        {
        turnoffLED()
        }
        
        if (lastonLED != n - 1)
        
        {
            
        lastonLED = lastonLED + 1
            
        }
        
        else
        
        { lastonLED = 0 }
        
        turnonLED()
    }
    
    func turnonLED() {
        
        if let ball = self.view.viewWithTag(100 + lastonLED) as? UIImageView
        {
        ball.image = UIImage(named: "green")
        }
        
    }
    
    func turnoffLED() {
        
        if let ball = self.view.viewWithTag(100 + lastonLED) as? UIImageView
        {
            ball.image = UIImage(named: "grey")
        }
        
    }
    
    
    func DrawRowOfBall()
    
    {
        for indexHang in 0...n {
            
            
            for indexCot in 0...n {
            
            print(index)
        
        let image = UIImage(named: "green")
        let ball = UIImageView(image: image)
       
            ball.center = CGPoint(x: _margin + CGFloat(indexHang) * SpaceBetweenBallX(),y: CGFloat(indexCot)*SpaceBetweenBallY() + _margin)
         
        ball.tag = indexHang + 100
                
        self.view.addSubview(ball)
        
          }
       }
    }
    
    func SpaceBetweenBallY() -> CGFloat {
        let space = (self.view.bounds.size.height - 2*_margin)/CGFloat(n-1)
        return space
    }

    func SpaceBetweenBallX() -> CGFloat {
        let space = (self.view.bounds.size.width - 2*_margin)/CGFloat(n-1)
        return space
    }
    
    
    
    
    
}
