import Foundation
internal import Combine

class TaskStore: ObservableObject {
    @Published var tasksByRoom: [String: [Task]] = [:] {
        didSet {
            saveTasks()
        }
    }

    private let key = "CleanTrackSavedTasks"

    init() {
        loadTasks()
    }

    private func saveTasks() {
        if let encoded = try? JSONEncoder().encode(tasksByRoom) {
            UserDefaults.standard.set(encoded, forKey: key)
        }
    }

    private func loadTasks() {
        if let data = UserDefaults.standard.data(forKey: key),
           let decoded = try? JSONDecoder().decode([String: [Task]].self, from: data) {
            tasksByRoom = decoded
        } else {
            tasksByRoom = RoomTasks.defaultTasks
        }
    }
}
