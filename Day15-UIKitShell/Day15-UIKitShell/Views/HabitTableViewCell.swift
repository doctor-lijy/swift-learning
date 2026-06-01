//
//  HabitTableViewCell.swift
//  Day15-UIKitShell
//
//  Created by RD前端-dodo on 2026/6/1.
//

import UIKit
import SnapKit

class HabitTableViewCell: UITableViewCell {
    
    private let cardView = UIView()
    private let checkButton = UIButton(type: .custom)
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    
    var onToggle: (() -> Void)?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        selectionStyle = .none
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        cardView.backgroundColor = .secondarySystemGroupedBackground
        cardView.layer.cornerRadius = 12
        contentView.addSubview(cardView)
        
        var config = UIButton.Configuration.plain()
        config.image = UIImage(systemName: "circle")
        config.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(pointSize: 22)
        checkButton.configuration = config
        checkButton.tintColor = .systemBlue
        checkButton.addTarget(self, action: #selector(toggletapped), for: .touchUpInside)
        cardView.addSubview(checkButton)
        
        titleLabel.font = .preferredFont(forTextStyle: .headline)
        titleLabel.textColor = .label
        titleLabel.numberOfLines = 0
        titleLabel.adjustsFontForContentSizeCategory = true
        cardView.addSubview(titleLabel)
        
        subtitleLabel.font = .preferredFont(forTextStyle: .subheadline)
        subtitleLabel.textColor = .secondaryLabel
        subtitleLabel.numberOfLines = 1;
        subtitleLabel.adjustsFontForContentSizeCategory = true
        cardView.addSubview(subtitleLabel)
        
        layoutWithSnapKit()
    }
    
    private func layoutWithSnapKit() {
        cardView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(6)
            make.leading.trailing.equalToSuperview().inset(6)
        }
        
        checkButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(8)
            make.centerY.equalToSuperview()
            make.size.equalTo(44)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(14)
            make.leading.equalTo(checkButton.snp.trailing).offset(8)
            make.trailing.equalToSuperview().inset(14)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(6)
            make.leading.trailing.equalTo(titleLabel)
            make.bottom.equalToSuperview().inset(14)
        }
        
    }
    
    func configure(with habit: Habit, dateFormatter:DateFormatter) {
        titleLabel.text = habit.title
        subtitleLabel.text = dateFormatter.string(from: habit.createdAt)
        
        let symbol = habit.isDone ? "checkmark.circle.fill" : "circle"
        checkButton.configuration?.image = UIImage(systemName: symbol)
        checkButton.tintColor = habit.isDone ? .systemGreen : .systemBlue
        
        titleLabel.textColor = habit.isDone ? .secondaryLabel : .label
    }
    
    @objc func toggletapped() {
        onToggle?()
    }

}
