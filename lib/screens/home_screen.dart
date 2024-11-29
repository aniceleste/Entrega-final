import 'package:flutter/material.dart';
import '../db/db_helper.dart';
import '../models/auto.dart';
import '../widgets/auto_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Auto> autos = [];

  @override
  void initState() {
    super.initState();
    _loadAutos();
  }

  Future<void> _loadAutos() async {
    final db = DBHelper();
    final data = await db.getAutos();
    setState(() {
      autos = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Colección de Autos'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Menú', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              title: Text('Colección'),
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: autos.length,
        itemBuilder: (context, index) {
          return AutoCard(
            auto: autos[index],
            onDelete: () async {
              await DBHelper().deleteAuto(autos[index].id!);
              _loadAutos();
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/addAuto').then((_) => _loadAutos());
        },
      ),
    );
  }
}
