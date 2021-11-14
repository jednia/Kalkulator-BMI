//  Created by Kamil Pietrzak on 14/11/2021.
//  Copyright © 2021 Kamil Pietrzak. All rights reserved.

import UIKit

class CalculateViewController: UIViewController {
    
    var core = Core()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        heightSlider.value = 1.5
        weightSlider.value = 100
        heightSlider.maximumTrackTintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        weightSlider.maximumTrackTintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        calculateOutlet.layer.cornerRadius = 15
        divLook.layer.masksToBounds = true
        divLook.layer.cornerRadius = 15
    }
    
    @IBOutlet weak var divLook: UILabel!
    @IBOutlet weak var calculateOutlet: UIButton!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        let heightValue = String(format: "%.2f", sender.value)
        heightLabel.text = "\(heightValue) m"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let weightValue = String(format: "%.0f", sender.value)
        weightLabel.text = "\(weightValue) kg"
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        core.calculateBMI(height: height, weight: weight)
        performSegue(withIdentifier: "goToResultVC", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResultVC" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.value = core.getBMIValue()
            destinationVC.advice = core.getAdvice()
            destinationVC.color = core.getColor()
        }
        
    }
}


