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
    @IBOutlet weak var sensorValueLabel: UILabel!
    
    static let identifier = "MeasurementPointTableViewCell"
    
    var pointId = Int()
    var paramName = String()
    var paramFormula = String()
    var sensorValue = String()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setDataMeasurementPoint(with id: Int, name: String, formula: String, value: String = "N/A"){
        pointId = id
        setParamData(name.capitalized, formula, value)
    }
    
    fileprivate func setParamData(_ name: String,_ formula: String, _ value: String){
        setParamFormula(formula)
        setParamName(name)
        setSensorValue(value)
    }
    
    fileprivate func setParamFormula(_ formula: String){
        paramFormula = formula
        setParamFormulaLabel(formula)
    }
    
    fileprivate func setParamFormulaLabel(_ text: String){
        paramFormulaLabel.text = text
    }
    
    fileprivate func setSensorValue(_ value: String){
        sensorValue = value
        setSensorValueLabel(value)
    }
    
    fileprivate func setSensorValueLabel(_ text: String){
        sensorValueLabel.text = text
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
