import SwiftUI

struct RoomCardView: View {
    var title: String
    @Binding var tasks: [Task]

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(title)
                    .font(.title2).bold()
                Spacer()
                Text(roomIcon(for: title))
                    .font(.title2)
            }

            ForEach(tasks.indices, id: \.self) { index in
                Button(action: {
                    tasks[index].isCompleted.toggle()
                }) {
                    HStack {
                        Image(systemName: tasks[index].isCompleted ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(tasks[index].isCompleted ? .green : .gray)
                        Text(tasks[index].name)
                            .foregroundColor(.primary)
                    }
                    .padding(.vertical, 5)
                }
            }
        }
        .padding()
        .background(Color.gray.opacity(0.1)) // ✅ safe and subtle
        .cornerRadius(12)
        .shadow(radius: 3)
        .padding(.horizontal)
    }

    func roomIcon(for room: String) -> String {
        switch room.lowercased() {
        case "kitchen": return "🍽️"
        case "bathroom": return "🛁"
        case "bedroom": return "🛏️"
        default: return "🧹"
        }
    }
}
