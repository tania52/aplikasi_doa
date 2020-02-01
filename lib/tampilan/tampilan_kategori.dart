import 'package:doa/tampilan/tampilan_detail.dart';
import 'package:flutter/material.dart';
import '../audio.dart';
import '../komponen/folder_kategori.dart';
import '../pemanggilan_data.dart';

class TampilanKategori extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title: Text("Do'a Anak"),
      ),
      drawer: new Drawer( 
        child: new ListView( 
          children: <Widget>[ 
            new UserAccountsDrawerHeader( 
              accountName: new Text("Teknik Informatika"),
              accountEmail: new Text("TI A"),
              currentAccountPicture: 
              new CircleAvatar( 
                child: new Icon(Icons.home),
              ),
            ),
           new ListTile(
              title: new Text('Audio'),
              trailing: new Icon(Icons.audiotrack),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(context, new MaterialPageRoute(
                  builder: (BuildContext context)=> new LocalAudio())
                );
              },
            ),
          ],
        ),
      ),

      body: GridView( 
        padding: EdgeInsets.all(15),
        children: KATEGORI_PEMANGGILAN_DATA
        .map((cat) => FolderKategori(cat.id, cat.judul, cat.deskripsi, cat.image))
        .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent( 
          maxCrossAxisExtent: 400,
          childAspectRatio: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
      
    );
  }
}