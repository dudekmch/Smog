//
//  MeasurementPointTableViewCell.swift
//  SmogInfo
//
//  Created by Pawel Dudek on 27.01.2018.
//  Copyright © 2018 cookieIT. All rights reserved.
//

import UIKit

class MeasurementPointTableViewCell: UITableViewCell {

    @IBOutlet weak var paramFormulaLabel: UILabel!
    @IBOutlet weak var paramNameLabel: UILabel!
    
    static let identifier = "MeasurementPointTableViewCell"
    
    var pointId = Int()
    var paramName = String()
    var paramFormula = String()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setDataMeasurementPoint(with id: Int, name: String, formula: String){
        pointId = id
        setParamData(name.capitalized, formula)
    }
    
    fileprivate func setParamData(_ name: String,_ formula: String){
        setParamFormula(formula)
        setParamName(name)
    }
    
    fileprivate func setParamFormula(_ formula: String){
        paramFormula = formula
        setParamFormulaLabel(formula)
    }
    
    fileprivate func setParamFormulaLabel(_ text: String){
        paramFormulaLabel.text = text
    }
    
    fileprivate func setParamName(_ name: String){
        paramName = name
        setParamNameLabel(name)
    }
    
    fileprivate func setParamNameLabel(_ text: String){
        paramNameLabel.text = text
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
