//
//  main.swift
//  DelegateCoffee
//
//  Created by Fauzi Achmad Haruna on 05/11/19.
//  Copyright © 2019 Fauzi Achmad Haruna. All rights reserved.
//

import Foundation

//Delegation is a design pattern that enables a class to hand off (or “delegate”) some of its responsibilities to an instance of another class.
//Delegates Paradigma Programming : mendelegasikan task/method ke object lain


///abstraksi object coffee
///1. Membuat Struct untuk meeting
struct Meeting {
    var time: String = ""
    var agenda: String = ""
}

///2. Membuat tata cara/method bagaimana sekretaris bekerja
protocol SekretarisDelegates{
    func managedSchedule(_ meeting: Meeting)
}
///3. Impelementasi protocol pada kelas sekretaris
class Sekretaris: SekretarisDelegates{
    func managedSchedule(_ meeting: Meeting) {
        print("Meeting harian dengan agenda \(meeting.agenda) pada hari \(meeting.time)")
    }
}
///4. Kelas Bos dapat melakukan delegasi sehingga memiliki atribut delegates dan menentukan jadwal dan agenda meeting
class Bos {
    var meetingDelegates: SekretarisDelegates?
    func determineMeeting(){
        var meeting =  Meeting()
        meeting.agenda = "Pembahasan RUU"
        meeting.time = "Senin"
        meetingDelegates?.managedSchedule(meeting)
    }
}
///5. instansiasi User menjadi Bos dan Sekretaris
let fauzi = Bos()
let haruna = Sekretaris()
///6. Fauzi menyuruh haruna untuk mengatur jadwal , dan fauzi bisa menentukan meeting atas bantuan haruna
fauzi.meetingDelegates = haruna
fauzi.determineMeeting()
///fauzi dengan bantuan method protocol managedSchedule kini dapat mengatur jadwal meeting



