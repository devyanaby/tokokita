import 'package:flutter/material.dart';
import 'package:pert4_crud/model/produk.dart';
import 'package:pert4_crud/ui/produk_detail.dart';
import 'package:pert4_crud/ui/produk_form.dart';

class ProdukPage extends StatefulWidget {
  const ProdukPage({Key? key}) : super(key: key);
  @override
  _ProdukPageState createState() => _ProdukPageState();
}

class _ProdukPageState extends State<ProdukPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('List Produk Aby'),
          actions: [
            Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  child: const Icon(Icons.add, size: 26.0),
                  onTap: () async {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProdukForm()));
                  },
                ))
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                title: const Text('Logout'),
                trailing: const Icon(Icons.logout),
                onTap: () async {},
              )
            ],
          ),
        ),
        body: ListView(
          children: [
            ItemProduk(
                produk: Produk(
                    id: 1,
                    kodeProduk: 'B001',
                    namaProduk: 'Pisang',
                    hargaProduk: 16000000)),
            ItemProduk(
                produk: Produk(
                    id: 2,
                    kodeProduk: 'B002',
                    namaProduk: 'Apel',
                    hargaProduk: 1200000)),
            ItemProduk(
                produk: Produk(
                    id: 3,
                    kodeProduk: 'B003',
                    namaProduk: 'Anggur',
                    hargaProduk: 42000000)),
          ],
        ));
  }
}

class ItemProduk extends StatelessWidget {
  final Produk produk;

  const ItemProduk({Key? key, required this.produk}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProdukDetail(
                      produk: produk,
                    )));
      },
      child: Card(
        child: ListTile(
          title: Text(produk.namaProduk!),
          subtitle: Text(produk.hargaProduk.toString()),
        ),
      ),
    );
  }
}
