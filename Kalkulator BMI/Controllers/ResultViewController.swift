//  Created by Kamil Pietrzak on 14/11/2021.
//  Copyright © 2021 Kamil Pietrzak. All rights reserved.

import UIKit

class ResultViewController: UIViewController {

    var value: String?
    var advice: String?
    var color: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bmiLabel.text = value
        adviceLabel.text = advice
        view.backgroundColor = color
    }
    
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
