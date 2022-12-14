//
//  AuthorCommitDataMock.swift
//  SaasDemoApp
//
//  Created by Aleksandr on 20.09.2022.
//

import Foundation

struct AuthorCommitDataMock: MockData {
    var data: Data
    
    init() {
        let mockString = """
[
{"name":"aleks",
"commitHash":"fiewojfiowejf",
"email":"aleks@gmail.com",
"subject":"subject1",
"date":"2018-02-01T19:10:04+00:00",
"timeInterval": 3.3,
"entries" : [{
        "status": "Modified",
        "fileName": "firthFile",
        "isExpand": false
    },
    {
        "status": "Deleted",
        "fileName": "deletedFile",
        "isExpand": false
    },
    {
        "status": "Added",
        "fileName": "enjoyableFile",
        "isExpand": false
    }
]
},
{"name":"ontoni",
"commitHash":"dawdawgergaw",
"email":"aleks2@gmail.com",
"subject":"subject2",
"date":"2019-02-01T19:10:04+00:00",
"timeInterval": 3.4,
"entries": [{
        "status": "Modified",
        "fileName": "donwloadDelFile",
        "isExpand": false
    },
    {
        "status": "Modified",
        "fileName": "secondSickfwFile",
        "isExpand": false
    },
    {
        "status": "Added",
        "fileName": "thirdgweggFile",
        "isExpand": false
    }
]
},
{"name":"german",
"commitHash":"verbareg",
"email":"alerk@gmail.com",
"subject":"subject3",
"date":"2020-02-01T19:10:04+00:00",
"timeInterval": 1.3,
"entries": [{
        "status": "Added",
        "fileName": "gracefullFile",
        "isExpand": false
    },
    {
        "status": "Modified",
        "fileName": "goodFile",
        "isExpand": false
    },
    {
        "status": "Added",
        "fileName": "feelfreeFile",
        "isExpand": false
    }
]
}]
"""
        self.data = Data(mockString.utf8)
    }
}
