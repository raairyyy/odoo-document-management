---
icon: file-import
---

# Import Dokumen

{% embed url="https://youtu.be/7wUNMVry5sQ" %}

Fitur Import Data Dokumen digunakan untuk memasukkan data dokumen secara masssal ke sistem menggunakan fie CSV. Dengan fitur ini, anda dapat menghemat waktu dibandingkan mengnput satu per satu.

#### Persyaratan File <a href="#persyaratan-file" id="persyaratan-file"></a>

* **Format file wajib:** CSV (Comma Separated Values)
* File dapat dibuat di Microsoft Excel / Google Sheets lalu disimpan sebagai CSV dengan pemisah titik koma (`;`).
* **Kolom Code dan Status tidak perlu diisi** – sistem akan mengisinya otomatis.
* **Kolom Shelf dan Box wajib diisi dengan kode**, bukan nama.
* **Box harus sesuai dengan Shelf**. Jika tidak sesuai, sistem akan menolak dengan pesan error.

#### Format Kolom CSV <a href="#format-kolom-csv" id="format-kolom-csv"></a>

{% file src="../../.gitbook/assets/Document (document.document) (3) (3).csv" %}

| **Kolom**          | **Deskripsi**                                         | **Contoh**               | **Wajib Diisi** |
| ------------------ | ----------------------------------------------------- | ------------------------ | --------------- |
| Code               | Kode dokumen (kosongkan)                              | -                        | ❌               |
| Name               | Judul atau nama dokumen                               | Non-Disclosure Agreement | ✅               |
| Warehouse          | Nama gudang penyimpanan (sesuai yang ada di sistem)   | Gudang Grogol            | ✅               |
| Shelf              | Kode shelf tempat dokumen disimpan                    | S-004                    | ✅               |
| Box                | Kode box tempat dokumen disimpan (harus sesuai shelf) | B-007                    | ✅               |
| Lost Quantity      | Jumlah dokumen hilang                                 | 0                        | Opsional        |
| Damaged Quantity   | Jumlah dokumen rusak                                  | 0                        | Opsional        |
| Available Quantity | Jumlah dokumen tersedia                               | 1                        | ✅               |
| Status             | Status dokumen (kosongkan)                            | -                        | ❌               |
| Customer           | Nama customer pemilik dokumen                         | Pelangi Global Logistic  | ✅               |

**Catatan:**

* Untuk mengetahui kode shelf dan kode box, cek di **Konfigurasi → Shelf** dan **Konfigurasi → Box**.
* Box hanya bisa digunakan pada shelf yang sesuai pada master data

Langkah - Langkah Import di Odoo :

1. Masuk ke Menu Import
   1. Buka modul Document Management
   2. Masuk ke menu Documents
   3. Klik icon gear ⚙ disamping kanan tulisan Document
   4. Pilih menu Import Documents
2. Upload File CSV
   1. Klik Upload File
   2. Pilih file CSV yang sudah disiapkkan
3. Pengaturan File Di panel kiri halaman import :
   1. Enconding : utf-8
   2. Separator : Semicolon (;)
   3. Text Delimiter : "
4.  Mapping Field Setelah file diunggah, Odoo akan menampilkan kolom file 9kiri) dan field Odoo (kanan)\
    \
    Contoh mapping yang benar:

    | **File Column**    | **Odoo Field**   |
    | ------------------ | ---------------- |
    | Code               | (biarkan kosong) |
    | Name               | Name             |
    | Warehouse          | Warehouse        |
    | Shelf              | Shelf            |
    | Box                | Box              |
    | Lost Quantity      | Lost Quantity    |
    | Damaged Quantity   | Damaged Quantity |
    | Available Quantity | Quantity         |
    | Status             | (biarkan kosong) |
    | Customer           | Customer         |

**5. Validasi Data**

* Klik tombol **Test** untuk memeriksa data.
*   Jika muncul pesan:

    Copy

    ```
    Box must belong to the selected shelf
    ```

    Artinya kode box yang diisi tidak sesuai dengan kode shelf. Periksa kembali data master shelf dan box.

**6. Proses Import**

1. Jika data sudah valid, klik **Import**.
2. Tunggu hingga muncul pesan **Import successful**.
3. Periksa daftar dokumen untuk memastikan semua data masuk dengan benar.
