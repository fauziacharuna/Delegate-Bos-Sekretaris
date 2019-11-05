# Implementasi Delegates Programming pada Swift
Delegates adalah paradigma programming dengan penyerahan tugas kepada pihak lain. 
Dalam konteks pemrograman iOS baik menggunakan Swift ataupun Objective-C, 
pendelegasian disini adalah menyerahkan tugas dari objek tertentu ke objek yang lain

## Studi Kasus 

Pada kasus Bos yang terlalu sibuk sehingga mendelegasikan ke sekretaris untuk mengatur jadwal meeting. Dengan delegates Bos akan dibantu oleh
Sekretaris dalam mengimplementasi kemampuan mengatur jadwal. 
### Langkah-langkah 

1. Membuat Abstraksi meeting (struct)

```
struct Meeting {
    var time: String = ""
    var agenda: String = ""
}
```
2. Membuat tata cara/method bagaimana sekretaris bekerja

```
protocol SekretarisDelegates{
    func managedSchedule(_ meeting: Meeting)
}
```
3. Impelementasi protocol pada kelas sekretaris

```
class Sekretaris: SekretarisDelegates{
    func managedSchedule(_ meeting: Meeting) {
        print("Meeting harian dengan agenda \(meeting.agenda) pada hari \(meeting.time)")
    }
}
```
4. Kelas Bos dapat melakukan delegasi sehingga memiliki atribut delegates dan menentukan jadwal dan agenda meeting

```
class Bos {
    var meetingDelegates: SekretarisDelegates?
    func determineMeeting(){
        var meeting =  Meeting()
        meeting.agenda = "Pembahasan RUU"
        meeting.time = "Senin"
        meetingDelegates?.managedSchedule(meeting)
    }
}
```
5. Instansiasi User menjadi Bos dan Sekretaris

```
let fauzi = Bos()
let haruna = Sekretaris()
```
6. Fauzi menyuruh haruna untuk mengatur jadwal , dan fauzi bisa menentukan meeting atas bantuan haruna
```
fauzi.meetingDelegates = haruna
fauzi.determineMeeting()
```
fauzi dengan bantuan method protocol managedSchedule kini dapat mengatur jadwal meeting

