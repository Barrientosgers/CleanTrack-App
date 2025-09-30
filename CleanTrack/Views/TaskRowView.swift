import SwiftUI

struct TaskRowView: View {
    @Binding var task: Task

    var body: some View {
        HStack {
            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                .onTapGesture {
                    task.isCompleted.toggle()
                }
            Text(task.name)
                .strikethrough(task.isCompleted)
        }
    }
}
