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
        let mockString = "[{\"name\":\"aleks\",\"commitHash\":\"fiewojfiowejf\",\"email\":\"aleks@gmail.com\",\"subject\":\"subject1\",\"date\":\"2018-02-01T19:10:04+00:00\"},{\"name\":\"ontoni\",\"commitHash\":\"dawdawgergaw\",\"email\":\"aleks2@gmail.com\",\"subject\":\"subject2\",\"date\":\"2019-02-01T19:10:04+00:00\"},{\"name\":\"german\",\"commitHash\":\"verbareg\",\"email\":\"alerk@gmail.com\",\"subject\":\"subject3\",\"date\":\"2020-02-01T19:10:04+00:00\"}]"
        self.data = Data(mockString.utf8)
    }
}
