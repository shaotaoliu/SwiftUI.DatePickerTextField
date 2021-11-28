import SwiftUI

struct CalendarSheet: ViewModifier {
    @Binding var presented: Bool
    @Binding var value: String
    @State private var calendarDate = Date()
    
    func body(content: Content) -> some View {
        ZStack {
            content
            
            VStack {
                Spacer()
                
                VStack {
                    DatePicker("", selection: $calendarDate, displayedComponents: [.date])
                        .datePickerStyle(.wheel)
                        .labelsHidden()
                }
                .frame(maxWidth: .infinity)
                .background(.white)
                .cornerRadius(15)
                .shadow(radius: 5)
                .offset(y: presented ? 0 : 250)
            }
        }
        .animation(.default, value: presented)
        .ignoresSafeArea()
        .onChange(of: calendarDate, perform: { _ in
            value = Globals.dateFormatter.string(from: calendarDate)
        })
    }
}

extension View {
    func calendarSheet(presented: Binding<Bool>, value: Binding<String>) -> some View {
        modifier(CalendarSheet(presented: presented, value: value))
    }
}

struct CalendarSheet_Previews: PreviewProvider {
    static var previews: some View {
        @State var presented = false
        @State var date: Date?
        @State var value = ""
        
        return DateField(placeholder: "Date", presented: $presented, date: $date, value: $value)
            .textFieldStyle(.roundedBorder)
            .padding()
            .calendarSheet(presented: $presented, value: $value)
    }
}
