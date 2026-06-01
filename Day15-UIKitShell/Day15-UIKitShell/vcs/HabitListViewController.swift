//
//  HabitListViewController.swift
//  Day15-UIKitShell
//
//  Created by RD前端-dodo on 2026/6/1.
//

import UIKit
import SnapKit

class HabitListViewController: UIViewController {

    private let tableView = UITableView(frame: .zero, style: .insetGrouped)
    private let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        return dateFormatter
    }()
    
    private var habits: [Habit] = Habit.sampleList
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    private func setupUI() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        tableView.backgroundColor  = .systemGroupedBackground
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 88
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HabitTableViewCell.self, forCellReuseIdentifier: "HabitTableViewCell")
        
    }
    
    @objc private func addTapped() {
//        let deatail = HabitDetailViewController(habitTitle: "新习惯")
        let deatail = HabitDetailViewController()
        deatail.habitTitle = "新习惯"
        navigationController?.pushViewController(deatail, animated: true)
    }

}

extension HabitListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        habits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HabitTableViewCell", for: indexPath) as? HabitTableViewCell else {
            return HabitTableViewCell()
        }
        let habit = habits[indexPath.row]
        cell.configure(with: habit, dateFormatter: dateFormatter)
        cell.onToggle = {[weak self] in
            self?.toggle(at: indexPath)
        }
                return cell
    }
    
    private func toggle(at indexPath: IndexPath) {
        var habit = habits[indexPath.row]
        habit.toggleDone()
        habits[indexPath.row] = habit
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
}
