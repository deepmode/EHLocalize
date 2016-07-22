//
//  LocalizeVC.swift
//  EHLocalize
//
//  Created by EricHo on 22/7/2016.
//  Copyright © 2016 E H. All rights reserved.
//

import UIKit

class LocalizeVC: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    
    
    enum AppLanguageCode: String {
        case en = "Base"
        case cnt = "zh-Hant"
        case cns = "zh-Hans"
        case ja = "ja"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func languageChange(sender: UISegmentedControl) {
        if let selectedKey = sender.titleForSegmentAtIndex(sender.selectedSegmentIndex) {
            
            var targetLanguage = selectedKey
            
            switch selectedKey {
            case "en":
                targetLanguage = AppLanguageCode.en.rawValue
            case "cnt":
                targetLanguage = AppLanguageCode.cnt.rawValue
            case "cns":
                targetLanguage = AppLanguageCode.cns.rawValue
            case "ja":
                targetLanguage = AppLanguageCode.ja.rawValue
            default:
                targetLanguage = AppLanguageCode.en.rawValue
            }
            
            if let path = NSBundle.mainBundle().pathForResource(targetLanguage, ofType: "lproj") {
                print("--- current path ---")
                print(path)
                
                let bundle = NSBundle(path: path)!
                self.displayLabel.text = NSLocalizedString("My wording", comment:"hello world").translateText(bundle)
            }
        }
    }

}

extension String {
    func translateText(bundle:NSBundle) -> String {
        let translation = NSLocalizedString(self, tableName: "", bundle: bundle, value: "", comment: "")
        return translation
    }
}
