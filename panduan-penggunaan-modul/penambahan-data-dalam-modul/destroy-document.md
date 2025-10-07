# Destroy Document

Fitur **Destroy Document** digunakan untuk melakukan pemusnahan dokumen yang sudah tidak diperlukan. Semua aktivitas destroy akan tercatat sebagai histori dan dapat dilihat kembali kapan saja.

### 1. Masuk ke Menu Document Management

* Dari **Dashboard Odoo**, pilih menu **Documents** pada sidebar kiri.
* Sistem akan menampilkan **Document Dashboard** berisi ringkasan data dokumen.

### 2. Buka Menu Destroy

* Klik tab **Destroy** pada menu atas.
* Halaman **Document Destroyed** akan terbuka, menampilkan daftar histori dokumen yang pernah dimusnahkan.
* Informasi yang tampil meliputi:
  * **Reference**
  * **Method**
  * **Reason**
  * **Customer**
  * **Responsible**
  * **Date**
  * **Status**

> Semua histori destroy akan tetap tersimpan di sini.

### 3. Membuat Destroy Baru

1. Klik tombol **New** untuk membuat pemusnahan baru.
2. Sistem akan membuka form **New Document Destroyed** dengan status awal **Draft**.

### 4. Isi Detail Destroy

Isi data berikut sesuai kebutuhan:

* **Method** → Pilih metode pemusnahan (contoh: _Physically Destroyed_).
* **Reason** → Masukkan alasan pemusnahan (contoh: _Legal Requirement_, _Damaged Beyond Repair_).
* **Customer** → Pilih customer yang terkait dokumen.
* **Responsible** → Secara otomatis terisi user yang membuat, tetapi dapat diganti.
* **Date** → Tanggal pemusnahan (default sesuai tanggal hari ini).
* **Description** → Catatan tambahan mengenai pemusnahan.

### 5. Tambahkan Dokumen

* Pada bagian **Documents**, klik **Add a line**.
* Pilih dokumen yang ingin dimusnahkan.
* Kolom berikut akan otomatis terisi:
  * **Type**
  * **Warehouse**
  * **Total Quantity**
  * **Available**
  * **Destroy**

### 6. Konfirmasi Destroy

* Setelah semua data terisi, klik **Confirm**.
* Status akan berubah:
  * **Draft → Confirmed → Completed**
* Jika sudah selesai diproses, status akhir menjadi **Completed**.

### 7. Melihat History Destroy

* Kembali ke menu **Destroy** untuk melihat daftar destroy.
* Semua histori akan tersimpan lengkap dengan detail:
  * **Reference**
  * **Reason**
  * **Responsible**
  * **Status**
