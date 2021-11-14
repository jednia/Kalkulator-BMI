//  Created by Kamil Pietrzak on 14/11/2021.
//  Copyright © 2021 Kamil Pietrzak. All rights reserved.

import UIKit

struct Core {
    var bmi: BMI?
    
    func getBMIValue() -> String {
        let bmiValueTo1DecPlace = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiValueTo1DecPlace
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? ""
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / (height * height)
        
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Spożywaj więcej kalorii", color: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1))
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Twoje BMI jest w normie", color: #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1))
        } else {
            bmi = BMI(value: bmiValue, advice: "Więcej aktywności fizycznej", color: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))
        }
    }
    
}
