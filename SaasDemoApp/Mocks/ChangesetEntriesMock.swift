//
//  ChangesetEntriesMock.swift
//  SaasDemoApp
//
//  Created by Aleksandr on 20.09.2022.
//

import Foundation

struct ChangesetEntryDataMock: MockData {
    var data: Data
    
    init() {
        let mockString = """
[{
        "status": "Deleted",
        "fileName": "firstFile",
        "isExpand": false,
        "diff": {
            "content": "poejwfpowjefopimweiofmweiofniowenfiowenfiowneiofonweoifnwoindaiowndoiwnvionewiovnoiwenvoianweiovnawioenviowenvionaweoivnwioenvoiawenvionaweiovnaweionvioawenviowaenvionaweiovn"
        }
    },
    {
        "status": "Modified",
        "fileName": "secondFile",
        "isExpand": false,
        "diff": {
            "content": "ap[wdkpoewmbomeroiabmoermboiaenriobnearb"
        }
    },
    {
        "status": "Added",
        "fileName": "thirdFile",
        "isExpand": false,
        "diff": {
            "content": "wegmopawemvopmariobnaeiorwnbioaernb"
        }
    }
]
""".replacingOccurrences(of: " ", with: "")
        self.data = Data(mockString.utf8)
    }
}
