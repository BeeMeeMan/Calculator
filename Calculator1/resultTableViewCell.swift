//
//  resultTableViewCell.swift
//  Calculator1
//
//  Created by user206820 on 10/25/21.
//

import UIKit

    class resultTableViewCell: UITableViewCell {
    
    @IBOutlet weak var oldFormulaLabel: UILabel!
    
    
    @IBOutlet weak var oldAnswerLabel: UILabel!
    
   
    @IBInspectable var oldFormulaText: String {
        
        
        get {
            return oldFormulaLabel.text!
        }
        
        set (textLabelText) {
            
            oldFormulaLabel.text = textLabelText
        }
    }
    
    var view: UIView!
    var nibName: String = "resultTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    
    func loadFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        
        return view
    }
    
    
    func setup(){
        
        view = loadFromNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
