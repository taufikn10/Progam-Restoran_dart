import 'dart:io';

// List Menu
class ListMenu {
  menu() {
    // Dart Sdk versi 2.10.0
    print("\x1B[2J\x1B[0;0H");

    // Menggunakan ListMenu
    int i = 0;
    List listMenu = [
      'Isi Nama Pemesan',
      'Lihat Daftar Pemesan',
      'Edit Nama Pemesan',
      'Hapus Nama Pemesan',
      'Menu Makanan',
      'Menu Minuman',
      'Struk Pemesanan',
    ];

    // Membuat Nama
    stdout.writeln('------------Progam Restoran------------');
    stdout.writeln('- NIM: 19051397019 / Taufik Nurrahman -');
    stdout.writeln('---------------------------------------');
    // Penomoran List Menu
    listMenu.forEach((elemen) {
      i++;
      print("$i. $elemen");
    });
    stdout.writeln('0. Keluar Progam');
    stdout.writeln('---------------------------------------');
    stdout.write('Masukkan Angka Pilihan Anda : ');
  }
}

// Perulangan Menu1
class Menu {
  String input;
  bool pilihan = true;

  perulangan() {
    print('==================================================');
    stdout.write("Ketikkan Sesuatu Untuk Melajutkan ");
    String jawaban = stdin.readLineSync();
    if (jawaban.toUpperCase() == "anyting") pilihan = false;
  }
}

// Pemesan
mixin Pemesan {
  List pemesan = [];
  // Input Pemesan
  String nama;

  input() {
    stdout.write('\nMasukkan Nama Anda : ');
    nama = stdin.readLineSync();
    print(
        '\nSelamat Datang di SeafoodResto => ' + (nama.toUpperCase()) + ' <=');
    List namaPemesan = [nama];
    pemesan.add(namaPemesan);
  }

  // List Pemesan
  input2() {
    stdout.writeln('\nList Pemesan Hari Ini');
    stdout.writeln('------------------------');
    if (pemesan.isNotEmpty) {
      print('Nama Pemesan : ' + pemesan[0].toString().toUpperCase());
    } else {
      print('\nBelum Ada Pemesan');
    }
  }

  // Edit Nama Pemesan
  input3() {
    stdout.writeln('Update Penunjung Hari Ini');
    stdout.writeln('-------------------------');
    if (pemesan.isNotEmpty) {
      print("\nNama Lama : " + pemesan[0].toString().toUpperCase());
      stdout.write("\nMasukkan Nama Baru : ");
      dynamic namaPemesan = stdin.readLineSync();

      pemesan[0] = namaPemesan;

      print("\n----------------------------");
      print("Nama Pemesan Berhasil Diubah");
      print("----------------------------");
      print("\nNama Pemesan Baru : " + pemesan[0].toString().toUpperCase());
    } else {
      print("\nBelum Ada Pemesan !!!");
    }
  }

  // Hapus Nama Pemesan
  input4() {
    pemesan.clear();
    if (pemesan.isEmpty) {
      print("\nPemesan Kosong");
    }
  }
}

class NegatifSalah implements Exception {
  String message;
  NegatifSalah([this.message]);
}

// Daftar Menu
mixin DaftarMenu {
  // input
  int x;
  int m = 0;

  // pembayaran
  String menu;
  int jumlah, makanan, total;
  Map rego = {
    1: 40000,
    2: 20000,
    3: 50000,
    4: 30000,
  };

  input5() {
    // Makanan
    print("\x1B[2J\x1B[0;0H");
    print('---------------------------------------------');
    print("|         Daftar Makanan SeafoodResto       |");
    print('---------------------------------------------');
    List<Map> daftarMakanan = [
      // Mencoba membuat map di dalam list
      {},
      {'Menu 1': 'Kepiting Rebus', 'harga': 40000},
      {'Menu 2': 'Nasi Goreng Hiu', 'harga': 20000},
      {'Menu 3': 'Udang Cah Jamur', 'harga': 50000},
      {'Menu 4': 'Sate Cumi - Cumi', 'harga': 30000},
    ];

    for (int i = 1; i < daftarMakanan.length; i++) {
      // for looping
      print('$i. ' + daftarMakanan[i].toString());
    }

    print('=============================================\n');
    // Input Apa yang Akan dipesan
    try {
      stdout.write('Masukan Angka Makanan Yang akan Dipesan : ');
      x = int.parse(stdin.readLineSync());

      // Penamaan dan Rego
      switch (x) {
        case 1:
          menu = 'Kepiting Rebus';
          m = 1;
          break;
        case 2:
          menu = 'Nasi Goreng Hiu';
          m = 2;
          break;
        case 3:
          menu = 'Udang Cah Jamur';
          m = 3;
          break;
        case 4:
          menu = 'Sate Cumi - Cumi';
          m = 4;
          break;
        default:
          print('Pilihan Menu tidak tersedia');
          return (x);
      }

      // Input Jumlah Makanan yang akan dipesan
      stdout.write('Jumlah yang akan dipesan : ');
      jumlah = int.parse(stdin.readLineSync());
      if (jumlah < 0) {
        throw NegatifSalah(); // melempar eksepsi NegativeError
      }
      // Hasil Output
      makanan = jumlah * rego[m];
      total = makanan;

      print('\n--------------------');
      print('SeafoodResto Pesanan');
      print('--------------------');
      print('Menu Makanan : ' + menu);
      print('Jumlah Makanan : ' + jumlah.toString() + ' Porsi');
      print(
          'Harga Makanan : ' + rego[m].toString() + " * " + jumlah.toString());
      print('Total : Rp ' + total.toString());
    } on FormatException {
      print('SALAH: Nilai yang dimasukkan bukan bilangan.');
    } on NegatifSalah {
      print('SALAH: Anda memasukkan nilai negatif.');
    } catch (e) {
      print('SALAH: terjadi eksepsi bertipe $e.');
    }
  }

  int y, n, minuman, total2, jumlah2;
  String menu2;

  input6() {
    // Minuman
    print("\n--------Daftar Minuman SeafoodResto----------");
    print('---------------------------------------------');
    // Minuman
    void printMinuman(Map minuman) {
      minuman.forEach((menu2, harga) {
        print('$menu2: $harga');
      });
    }

    Map minum = {
      '(1) Es Jeruk Harga': 5000,
      '(2) Es Teh Harga': 3000,
      '(3) Es Kelapa Harga': 10000,
    };
    print("\x1B[2J\x1B[0;0H");
    print('-------------------------------');
    print("| Daftar Minuman SeafoodResto |");
    print('-------------------------------');
    printMinuman(minum);
    print('=============================\n');
    // Input Apa yang Akan dipesan
    try {
      stdout.write('Masukan Angka Minuman Yang akan Dipesan : ');
      y = int.parse(stdin.readLineSync());

      if (y == 1) {
        menu2 = 'Es Jeruk';
        n = minum['(1) Es Jeruk Harga'];
      } else if (y == 2) {
        menu2 = 'Es Teh';
        n = minum['(2) Es Teh Harga'];
      } else if (y == 3) {
        menu2 = 'Es Kelapa';
        n = minum['(3) Es Kelapa Harga'];
      } else {
        print('Pilihan Menu tidak tersedia');
        return (y);
      }
      // Input Jumlah Minuman yang akan dipesan
      stdout.write('Jumlah yang akan dipesan : ');
      jumlah2 = int.parse(stdin.readLineSync());
      if (jumlah2 < 0) {
        throw NegatifSalah(); // melempar eksepsi NegativeError
      }
      // Hasil Output
      minuman = jumlah2 * n;
      total2 = minuman;

      print('\n--------------------');
      print('SeafoodResto Pesanan');
      print('--------------------');
      print('Menu Minuman : ' + menu2);
      print('Jumlah Minuman : ' + jumlah2.toString() + ' Minuman');
      print('Harga Minuman : ' + n.toString() + " * " + jumlah2.toString());
      print('Total : Rp ' + total2.toString());
    } on FormatException {
      print('SALAH: Nilai yang dimasukkan bukan bilangan.');
    } on NegatifSalah {
      print('SALAH: Anda memasukkan nilai negatif.');
    } catch (e) {
      print('SALAH: terjadi eksepsi bertipe $e.');
    }
  }
}

// Struk Pemesanan
class Struk with Pemesan, DaftarMenu {
  bool saldo;
  int kurang, kembalian, totalKeseluruhan, bayar;

  // struk
  methodStruk() {
    print("\x1B[2J\x1B[0;0H");
    print('-----------------------------------------------');
    print('|           SeafoodResto By Taufik            |');
    print('-----------------------------------------------');

    // Pemesan
    if (pemesan.isNotEmpty) {
      print('Nama Pemesan : ' + pemesan[0].toString().toUpperCase());
    } else {
      print('\nNama Pemesan Masih Kosong Tolong Diisi');
      print('-----------------------------------------------');
    }

    // Struk Makanan
    if (menu?.isNotEmpty ??
        false & rego[m].toString().isNotEmpty ??
        false & jumlah.toString().isNotEmpty ??
        false & total.toString().isNotEmpty ??
        false) {
      print('\nMakanan Yang Dipesan');
      print('--------------------- ');
      print('Menu Makanan \t \t : ' + menu);
      print('Harga dan Banyak Makanan : Rp ' +
          rego[m].toString() +
          " * " +
          jumlah.toString() +
          ' Porsi');
      print('Total Harga Makanan \t : Rp ' + total.toString());
      print('-----------------------------------------------');
    } else {
      print('Anda belum Memesan Makanan');
      print('-----------------------------------------------');
    }

    // Struk Minuman
    if (menu2?.isNotEmpty ??
        false & n.toString().isNotEmpty ??
        false & jumlah2.toString().isNotEmpty ??
        false & total2.toString().isNotEmpty ??
        false) {
      print('\nMinuman Yang Dipesan');
      print('--------------------- ');
      print('Menu Minuman \t \t : ' + menu2);
      print('Harga dan Banyak Minuman : Rp ' +
          n.toString() +
          " * " +
          jumlah2.toString() +
          " Minuman");
      print('Total Harga Makanan \t : Rp ' + total2.toString());
      print('-----------------------------------------------');
    } else {
      print('Anda belum Memesan Minuman');
      print('-----------------------------------------------');
    }

    //
    try {
      if (total.toString().isNotEmpty ??
          false & total2.toString().isNotEmpty ??
          false) {
        totalKeseluruhan = total + total2;
        print('Total Pembayaran : Rp ' + totalKeseluruhan.toString());
        stdout.write('\nSilahkan Bayar Disini : Rp ');
        bayar = int.parse(stdin.readLineSync());
        print('-----------------------------------------------');
        if (saldo = bayar < totalKeseluruhan) {
          print('Saldo Kurang, Bayarlah dengan uang yang cukup ');
        } else if (saldo = bayar >= totalKeseluruhan) {
          kembalian = bayar - totalKeseluruhan;
          print('Uang Yang Anda Bayar \t Rp ' + bayar.toString());
          print('Uang Kembalian \t\t Rp ' + kembalian.toString());
          print('=============================================');
          print('Terimakasih Telah Memesan di SeafoodResto ' +
              pemesan[0].toString().toUpperCase());
          exit(1);
        }
      } else {
        print('Anda Belum Memesan Apapun');
      }
    } on FormatException {
      print('SALAH: Nilai yang dimasukkan bukan bilangan.');
    } catch (e) {
      print('Tidak Ada Yang Perlu Di Total');
    }
  }
}

// Mencoba get and Setter
// Pemilik
class Pemilik {
  String _namaPemilik;

  set setNamaPemilik(String _namaP) {
    _namaPemilik = _namaP;
  }

  String get getPemilik {
    return _namaPemilik;
  }
}

void main(List<String> args) {
  // List Menu
  ListMenu lm = ListMenu();

  // Navigation
  Menu m = Menu();

  // Struk
  Struk s = Struk();

  // Pemilik
  Pemilik taufik = Pemilik();
  taufik._namaPemilik = 'SeafoodResto';

  // output
  do {
    lm.menu();
    m.input = stdin.readLineSync();
    switch (m.input) {
      case '1':
        s.input();
        break;
      case '2':
        s.input2();
        break;
      case '3':
        s.input3();
        break;
      case '4':
        s.input4();
        break;
      case '5':
        s.input5();
        break;
      case '6':
        s.input6();
        break;
      case '7':
        s.methodStruk();
        break;
      case '0':
        print('\nTerimakasih sudah menggunakan Aplikasi => ' +
            taufik._namaPemilik +
            ' <=');
        print('=====================================================');
        return;
      default:
        print('ERROR: Silahkan Masukkan Input Dengan Benar');
        break;
    }
    m.perulangan();
  } while (m.pilihan != 0);
}
