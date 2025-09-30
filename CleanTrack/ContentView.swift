import SwiftUI

struct ContentView: View {
    @StateObject private var taskStore = TaskStore()
    @State private var aiSuggestion: String?
    private var aiHelper = AICleaningHelper()

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
                        // Room cards
                        ForEach(taskStore.tasksByRoom.keys.sorted(), id: \.self) { room in
                            if taskStore.tasksByRoom[room] != nil {
                                RoomCardView(
                                    title: room,
                                    tasks: Binding(
                                        get: { taskStore.tasksByRoom[room] ?? [] },
                                        set: { taskStore.tasksByRoom[room] = $0 }
                                    )
                                )
                            }
                        }

                        // AI Suggestion Button
                        Button(action: {
                            aiHelper.suggestTask { suggestion in
                                aiSuggestion = suggestion
                            }
                        }) {
                            HStack {
                                Image(systemName: "sparkles")
                                Text("Get AI Cleaning Suggestion")
                            }
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                        }
                    }
                    .padding(.vertical)
                }
            }
            .navigationTitle("CleanTrack 🧹")
            .alert("🧠 AI Suggestion", isPresented: Binding(
                get: { aiSuggestion != nil },
                set: { if !$0 { aiSuggestion = nil } }
            )) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(aiSuggestion ?? "")
            }
        }
    }
}
