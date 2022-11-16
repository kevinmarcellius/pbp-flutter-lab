# Tugas PBP Flutter

- [Tugas 7](#tugas-7)
- [Tugas 8](#tugas-8)

## Tugas 7

Kevin Marcellius Alrino <br>
PBP C<br>
2106706193

1. Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya. <br>
State adalah informasi yang bisa dibaca secara synchronous saat widget dibuat dan bisa saja berubah.
Stateless widget adakah widget yang statenya tidak dapat diubah setelah dibuat. Stateless widget meng override build() method returns widget. Contohnya adalah Text, RaisedButton, IconButtons. Stateful widget adalah widget yang statenya bisa diubah setelah dibuat. Stateful widget meng override createState() dan return State. Contohnya CheckBox, RadioButton, Form, TextField.
2. Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya. <br>
    - Scaffold :
    widget dalam flutter yang digunakan untuk mengimplementasikan struktur visual layout dasar sebagai tempat untuk menempatkan widget.
    - Appbar : sebagai header, tempat meletakkan teks "Program Counter"
    - Center : berfungsi untuk meratakan child widget ke tengah
    - Row & Column : berfungsi untuk mengatur cara meletakkan widget-widget, misalnya untuk mengatur children widget secara vertikal bisa menggunakan column
    - Text : berfungsi untuk menampilkan text
    - Visibility : berfungsi untuk mengatur visibilitas suatu widget, misal suatu kondisi harus terpenuhi jika ingin menampilkan widget. Pada tugas ini, saya menggunakan visibility untuk mengatur button "-" agar tidak muncul di layar jika _counter == 0.
    - Floating Action Button : icon button berbentuk lingkaran yang melayang di atas sebuah content yang biasanya untuk melakukan primary action dari sebuah aplikasi.
    - Padding : berfungsi untuk memberikan jarak antar widget.
3. Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut. <br>
setState memberi tahu framework bahwa state dari suatu object telah berubah, sehingga framework akan melakukan build ulang object dari state ini.
4. Jelaskan perbedaan antara const dengan final. <br>
Keyword "final" digunakan untuk menyatakan variabel yang tidak dapat diubah lagi setelah dibuat. Pada dart, final yang digunakan pada object menyebabkan objectnya masih bisa diubah. Pada dart, keyword "const" bertindak sama seperti keyword "final". Bedanya const membuat variabel constant dari compile-time saja. Menggunakan const pada suatu object akan membuat state suat object akan strictly fixed saat compile-time.
5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas <br>
    1. buat aplikasi flutter baru dengan command `flutter create counter_7`
    2. pada file `lib\main.dart`, ubah title.
    ```shell
    ...
    home: const MyHomePage(title: 'Program Counter'),
    ...
    ```
    3. pada file `lib\main.dart`, buat suatu method untuk decrement _counter
    ```shell
      void _decrementCounter() {
    setState(() {
      if (_counter != 0) {
        _counter--;
      }
    });
    }
    ```
    4. karena kita akan membuat 2 floating button,tambahkan widget padding  untuk mengatur jaraknya. Lalu, tambahkan widget visibility untuk mengatur visibility dari button decrement.
    ```shell
    ...
     floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // add visibility so that decrement button only visible if counter > 0
            Visibility(
              visible: _counter > 0,
              child: FloatingActionButton(
                onPressed: _decrementCounter,
                tooltip: 'Decrement',
                child: const Icon(Icons.remove),
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                _incrementCounter();
              },
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            )
          ],
        ),
      ),
      ...
    ```

    5. Tambahkan text "GENAP" dan "GANJIL" serta condition yg diperlukan untuk memunculkan text tersebut
    ```shell 
              children: <Widget>[
            _counter % 2 == 0
                ? const Text(
                    // if counter % 2 == 0, display "GANJIL" with text color red.
                    // else, display "GENAP" with text color blue.
                    "GENAP",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  )
                : const Text(
                    "GANJIL",
                    style: TextStyle(color: Colors.blue),
                  ),
    ```

## Tugas 8
1. Jelaskan perbedaan Navigator.push dan Navigator.pushReplacement.<br>
navigator.push =  menambahkan route baru ke puncak stack.<br>
navigator.pushReplacement = membuang route yang berada pada puncak stack lalu menambahkan route baru ke puncak stack.

2. Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.<br>
  - drawer : untuk mengakses page-page atau fungsionalitas berbeda dalam aplikasi. Dilambangkan dengan 3 garis horizontal di ujung kiri atas.
  - dropdownButton : untuk memilih 1 value dari beberapa opsi.
  - Form : untuk wadah input field widget
  - TextFormField : untuk menerima input teks dari user.
  - TextButton : button yang memiliki listener onPressed() dan onLongPressed() untuk memanggil suatu fungsi
  - ListTile : untuk mem-build sebuah ListView baru. ListTile memiliki widget title, leading, dan trailling icons
  - ListView : list of widgets yang dapat discroll secara vertikal atau horizontal


3. Sebutkan jenis-jenis event yang ada pada Flutter (contoh: onPressed).<br>
onPressed : memanggil function ketika widget ditekan<br>
onChanged : memanggil function ketika isi value dari widget berubah<br>
onLongPress : memanggil function ketika user melakukan long press ke suatu button<br>
4. Jelaskan bagaimana cara kerja Navigator dalam "mengganti" halaman dari aplikasi Flutter.<br>
Widget Navigator menampilkan layar seakan sebagai sebuah tumpukan (stack). Untuk menavigasi sebuah halaman baru, kita dapat mengakses Navigator melalui BuildContext dan memanggil fungsi push() atau pop() <br>

5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.<br>

(1) buat pada folder lib, buat file `drawer.dart`, lalu buat drawer yang diperlukan <br>
```shell
    import 'package:flutter/material.dart';
import 'package:counter_7/form.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/show_budget.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Menambahkan clickable menu
          ListTile(
            title: const Text('Counter'),
            onTap: () {
              // Route menu ke halaman utama
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyHomePage()),
              );
            },
          ),
          ListTile(
            title: const Text('Tambah Budget'),
            onTap: () {
              // Route menu ke halaman form
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyFormPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Data Budget'),
            onTap: () {
              // Route menu ke halaman utama
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const ShowBudgetPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}

``` 
Jangan di run dulu karena kita belum membuat `form.dart` dan `show_budget.dart`<br>
(2) pada folder `lib`, buat file `budget.dart` lalu buat class budget dan list untuk menampung object budget.

```shell
class Budget {
  String judul;
  int nominal;
  String jenis;
  DateTime tanggal;

  Budget(this.judul, this.nominal, this.jenis, this.tanggal);
}

List<Budget> budgets = <Budget>[];
```

(3) pada `lib/main.dart` import file `drawer.dart` dan tambahkan drawer.

```shell
import 'package:counter_7/drawer.dart';

...
drawer: const AppDrawer(),
```
(4) buat file `lib\form.dart` lalu buat form dan field yang diperlukan. Import file `budget.dart` untuk membuat object budget dan ditambahkan ke dalam list. Tambahkan juga drawer yang sudah dibuat.
 ```shell
 import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:counter_7/budget.dart';
import 'package:counter_7/drawer.dart';

class MyFormPage extends StatefulWidget {
  const MyFormPage({super.key});
  final String title = 'Form Budget';
  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _judul = "";
  int nominal = 0;
  String jenis = 'Pengeluaran';
  List<String> listJenis = ['Pengeluaran', 'Pemasukan'];
  DateTime tanggal = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Budget'),
      ),
      drawer: const AppDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Contoh: Beli Sate Pacil",
                      labelText: "Judul",
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        _judul = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _judul = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Judul tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "50000",
                      labelText: "Nominal",
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        nominal = int.parse(value!);
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        nominal = int.parse(value!);
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Nominal tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.class_),
                  title: const Text(
                    'Pilih Jenis',
                  ),
                  trailing: DropdownButton(
                    value: jenis,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: listJenis.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        jenis = newValue!;
                      });
                    },
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.calendar_month),
                  title: Text(
                    tanggal.toString().substring(0, 10),
                  ),
                  trailing: ElevatedButton(
                    child: const Text(
                      "Pilih Tanggal",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                    onPressed: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1990),
                        lastDate: DateTime(2050),
                      ).then((date) {
                        setState(() {
                          date != null ? tanggal = date : tanggal = tanggal;
                        });
                      });
                    },
                  ),
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      budgets.add(Budget(_judul, nominal, jenis, tanggal));
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 15,
                            child: Container(
                              child: ListView(
                                padding:
                                    const EdgeInsets.only(top: 20, bottom: 20),
                                shrinkWrap: true,
                                children: <Widget>[
                                  Center(child: const Text('Success')),
                                  SizedBox(height: 20),
                                  // Munculkan informasi yang didapat dari form
                                  Center(
                                      child:
                                          Text("Berhasil menambahkan budget")),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('Kembali'),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                  child: const Text(
                    "Simpan",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

 ```
(5) buat file `lib/show_budget.dart` untuk menampilkan object budget yang sudah diimport oleh user. tambahkan juga drawer yang sudah dibuat di `lib/drawer.dart`.
```shell
import 'package:flutter/material.dart';
import 'package:counter_7/drawer.dart';
import 'package:counter_7/budget.dart';

class ShowBudgetPage extends StatelessWidget {
  const ShowBudgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Budget Data'),
      ),
      drawer: const AppDrawer(),
      body: ListView.builder(
          itemCount: budgets.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(budgets[index].judul),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(budgets[index].nominal.toString()),
                  Text(budgets[index].jenis),
                  Text("Tanggal: " +
                      budgets[index].tanggal.toString().substring(0, 10)),
                ],
              ),
            );
          }),
    );
  }
}
``` 


<hr>
## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
