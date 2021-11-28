import SwiftUI

//TODO: If we can get the outer most view, we can combine DateField and CalenddarSheet to one file.
//TODO: If we know how to resign the focus from the TextField, we can add a Done button to select the date
//TODO: Somehow DatePicker does not support double click; otherwise, we don't need the Done button
//TODO: It seems GeometryReader has a bug, otherwise, we don't need to hard code the offset (250)

struct DateField: View {
    let placeholder: String
    @Binding var presented: Bool
    @Binding var date: Date?
    @Binding var value: String
    
    var body: some View {
        TextField(placeholder, text: $value, onEditingChanged: { value in
            presented = value
        })
            .onChange(of: value, perform: { _ in
                date = Globals.dateFormatter.date(from: value)
            })
    }
}

struct DateField_Previews: PreviewProvider {
    static var previews: some View {
        @State var date: Date? = nil
        @State var presented = false
        return DateField(placeholder: "Enter Date", presented: $presented, date: $date, value: .constant(""))
            .padding()
    }
}
