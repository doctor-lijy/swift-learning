//
//  HabitListViewController.swift
//  Day15-UIKitShell
//
//  Created by RD前端-dodo on 2026/6/1.
//

import UIKit
import SnapKit

nonisolated enum HabitListSection: Hashable, Sendable {
    case main
}

final class HabitListViewController: UIViewController {

    private typealias DataSource = UICollectionViewDiffableDataSource<HabitListSection, Habit>
    private typealias Snapshot = NSDiffableDataSourceSnapshot<HabitListSection, Habit>

    private var collectionView: UICollectionView!
    private var dataSource: DataSource!
    private var habits: [Habit] = Habit.sampleList

    private let dateFormatter: DateFormatter = {
        let f = DateFormatter()
        f.dateStyle = .medium
        f.timeStyle = .short
        return f
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "习惯"
        view.backgroundColor = .systemGroupedBackground
        configureCollectionView()
        configureDataSource()
        applySnapshot(animated: false)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addTapped)
        )
    }

    private func configureCollectionView() {
        var config = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        config.backgroundColor = .systemGroupedBackground
        config.showsSeparators = false

        let layout = UICollectionViewCompositionalLayout.list(using: config)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.delegate = self

        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }

        collectionView.register(
            HabitCollectionViewCell.self,
            forCellWithReuseIdentifier: HabitCollectionViewCell.reuseID
        )
    }

    private func configureDataSource() {
        dataSource = DataSource(collectionView: collectionView) { [weak self] collectionView, indexPath, habit in
            guard let self,
                  let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: HabitCollectionViewCell.reuseID,
                    for: indexPath
                  ) as? HabitCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.configure(with: habit, dateFormatter: self.dateFormatter)
            cell.onToggle = { [weak self] in
                self?.toggle(habitID: habit.id)
            }
            return cell
        }
    }

    // MARK: - Snapshot（唯一 UI 更新入口）

    private func applySnapshot(animated: Bool) {
        var snapshot = Snapshot()
        snapshot.appendSections([.main])
        snapshot.appendItems(habits, toSection: .main)
        dataSource.apply(snapshot, animatingDifferences: animated)
    }

    // MARK: - 增删改

    @objc private func addTapped() {
        let new = Habit(
            id: UUID().uuidString,
            title: "新习惯 \(habits.count + 1)",
            isDone: false,
            createdAt: Date()
        )
        habits.insert(new, at: 0)

        var snapshot = dataSource.snapshot()
        snapshot.insertItems([new], beforeItem: snapshot.itemIdentifiers.first!)
        dataSource.apply(snapshot, animatingDifferences: true)
    }

    private func toggle(habitID: String) {
        guard let index = habits.firstIndex(where: { $0.id == habitID }) else { return }
        habits[index].toggleDone()
        let updated = habits[index]

        var snapshot = dataSource.snapshot()
        snapshot.reloadItems([updated])
        dataSource.apply(snapshot, animatingDifferences: true)
    }

    private func delete(habitID: String) {
        guard let index = habits.firstIndex(where: { $0.id == habitID }) else { return }
        let removed = habits.remove(at: index)

        var snapshot = dataSource.snapshot()
        snapshot.deleteItems([removed])
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}

extension HabitListViewController: UICollectionViewDelegate {
    // 左滑删除
    func collectionView(
        _ collectionView: UICollectionView,
        trailingSwipeActionsConfigurationForItemAt indexPath: IndexPath
    ) -> UISwipeActionsConfiguration? {
        guard let habit = dataSource.itemIdentifier(for: indexPath) else { return nil }
        let delete = UIContextualAction(style: .destructive, title: "删除") { [weak self] _, _, done in
            self?.delete(habitID: habit.id)
            done(true)
        }
        return UISwipeActionsConfiguration(actions: [delete])
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let habit = dataSource.itemIdentifier(for: indexPath) else { return }
        let detail = HabitDetailViewController()
        detail.habitTitle = habit.title
        navigationController?.pushViewController(detail, animated: true)
    }
}
