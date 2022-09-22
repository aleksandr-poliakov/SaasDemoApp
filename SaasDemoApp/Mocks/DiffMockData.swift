//
//  DiffMockData.swift
//  SaasDemoApp
//
//  Created by Aleksandr on 22.09.2022.
//

import Foundation

struct DiffMockData: MockData {
    var data: Data
    
    init() {
        let mockString = """
[
 {
            "idFile": "firthFile",
            "content": "Prouder"
        },{
           "idFile": "deletedFile",
            "content": "Real name"
        },
{
            "idFile": "enjoyableFile",
            "content": "gpwoamgopmwpaomvoiaernbiopnaeioprbniopaen"
        },
{
            "idFile": "donwloadDelFile",
            "content": "poejwfpowjefopimweiofmweiofniowenfiowenfiowneiofonweoifnwoindaiowndoiwnvionewiovnoiwenvoianweiovnawioenviowenvionaweoivnwioenvoiawenvionaweiovnaweionvioawenviowaenvionaweiovn"
        },
{
            "idFile": "secondSickfwFile",
            "content": "ap[wdkpoewmbomeroiabmoermboiaenriobnearb"
        },
{
            "idFile": "thirdgweggFile",
            "content": "wegmopawemvopmariobnaeiorwnbioaernb"
        },
{
            "idFile": "gracefullFile",
            "content": "poejwfpowjefopimweiofmweiofniowenfiowenfiowneiofonweoifnwoindaiowndoiwnvionewiovnoiwenvoianweiovnawioenviowenvionaweoivnwioenvoiawenvionaweiovnaweionvioawenviowaenvionaweiovn"
        },
{
            "idFile": "goodFile",
            "content": "ap[wdkpoewmbomeroiabmoermboiaenriobnearb"
        },
{
            "idFile": "feelfreeFile",
            "content": "My enjoyness"
        }
]
"""
        self.data = Data(mockString.utf8)
    }
}
