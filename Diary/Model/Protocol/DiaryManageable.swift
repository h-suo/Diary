//
//  DiaryStorageProtocol.swift
//  Diary
//
//  Created by Erick on 2023/08/29.
//

protocol DiaryManageable {
    func createDiary(title: String, body: String, weatherResponse: WeatherResponse?) throws
    func updateDiary(_ diary: DiaryEntry) throws
    func deleteDiary(_ diary: DiaryEntry) throws
}
