//
//  DiaryViewControllerDelegate.swift
//  Diary
//
//  Created by Erick on 2023/11/06.
//

protocol DiaryEditViewControllerDelegate: AnyObject {
    func diaryEditViewController(_ diaryViewController: DiaryEditViewController, updateDiary isSuccess: Bool)
}
