import Foundation

struct Task: Identifiable, Codable, Hashable, Equatable {
    let id: UUID
    var name: String
    var isCompleted: Bool = false

    init(id: UUID = UUID(), name: String, isCompleted: Bool = false) {
        self.id = id
        self.name = name
        self.isCompleted = isCompleted
    }
}

struct RoomTasks {
    static let defaultTasks: [String: [Task]] = [
        "Kitchen": [
            Task(name: "Wipe countertops"),
            Task(name: "Clean sink"),
            Task(name: "Sweep floor")
        ],
        "Bedroom": [
            Task(name: "Make the bed"),
            Task(name: "Vacuum carpet"),
            Task(name: "Organize closet")
        ],
        "Bathroom": [
            Task(name: "Clean toilet"),
            Task(name: "Wipe mirror"),
            Task(name: "Mop floor")
        ]
    ]
}
