//
//  PresidentTableCell.swift
//  Nav
//
//  Created by demon on 14-7-23.
//  Copyright (c) 2014年 demon. All rights reserved.
//

import UIKit

class PresidentTableCell: UITableViewCell {
    var label:UILabel?
    var textField:UITextField?
    override init(style: UITableViewCellStyle, reuseIdentifier: String) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        label=UILabel(frame: CGRectMake(10, 10, 75, 25))
        label!.tag=kLabelTag
        label!.textAlignment=NSTextAlignment.Right
        label!.font=UIFont.boldSystemFontOfSize(14)
        self.contentView.addSubview(label!)
        
        textField=UITextField(frame:CGRectMake(90, 12, 200, 25))
        textField!.tag=kTextFieldTag
        textField!.clearsOnBeginEditing=false
        //textField.delegate=self
        textField!.returnKeyType=UIReturnKeyType.Done
       // textField.addTarget(self, action: Selector("textFieldDone:"), forControlEvents: UIControlEvents.EditingDidEndOnExit)
        self.contentView.addSubview(textField!)

        // Initialization code
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
