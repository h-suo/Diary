//
//  DiaryViewControllerDelegate.swift
//  Diary
//
//  Created by Erick on 2023/11/06.
//

protocol DiaryViewControllerDelegate: AnyObject {
    func diaryViewController(_ diaryViewController: DiaryViewController, updateDiary isSuccess: Bool)
}
