//
//  AlertManager.swift
//  Diary
//
//  Created by Erick on 2023/09/09.
//

import UIKit

final class AlertManager {
    
    // MARK: - Private Property
    private var title: String?
    private var message: String?
    private var style: UIAlertController.Style = .alert
    private var actions: [UIAlertAction] = []
}

// MARK: - Setting Method
extension AlertManager {
    func setTitle(_ text: String) -> AlertManager {
        title = text
        
        return self
    }
    
    func setMessage(_ text: String) -> AlertManager {
        message = text
        
        return self
    }
    
    func setStyle(_ alertStyle: UIAlertController.Style) -> AlertManager {
        style = alertStyle
        
        return self
    }
    
    func setAction(_ alertAction: UIAlertAction) -> AlertManager {
        actions.append(alertAction)
        
        return self
    }
    
    func buildAlert() -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        
        actions.forEach {
            alert.addAction($0)
        }
        
        return alert
    }
}

// MARK: - Managers
extension AlertManager {
    static func failAlertManager() -> AlertManager {
        let alertAction = UIAlertAction(title: "확인", style: .cancel)
        
        return AlertManager()
            .setTitle("실패")
            .setStyle(.alert)
            .setAction(alertAction)
    }
    
    static func deleteAlertManager() -> AlertManager {
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        
        return AlertManager()
            .setTitle("진짜요?")
            .setMessage("정말로 삭제하시겠어요?")
            .setStyle(.alert)
            .setAction(cancelAction)
    }
}
