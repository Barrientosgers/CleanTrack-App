import SwiftUI

struct ContentView: View {
    @StateObject private var taskStore = TaskStore()

    var body: some View {
        NavigationView {
            ZStack {
                // Background gradient
                LinearGradient(
                    gradient: Gradient(colors: [Color.gray.opacity(0.1), Color.white]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()

                ScrollView {
                    VStack(spacing: 30) {
                        // Room task cards
                        ForEach(taskStore.tasksByRoom.keys.sorted(), id: \.self) { room in
                            if taskStore.tasksByRoom[room] != nil {
                                RoomCardView(
                                    title: room,
                                    tasks: Binding(
                                        get: { taskStore.tasksByRoom[room] ?? [] },
                                        set: { taskStore.tasksByRoom[room] = $0 }
                                    )
                                )
                                .padding(.horizontal)
                            }
                        }
                    }
                    .padding(.vertical)
                }
            }
        }
    }
}
