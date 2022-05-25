import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class Item {
  final String imageUrl;
  final String name;
  final String description;

  Item(this.imageUrl, this.name, this.description);
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Song Galery'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.collections),
              ),
              Tab(
                icon: Icon(Icons.audiotrack),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            // GridView tab content Widget
            GridView.count(
              // Items in row
              crossAxisCount: 2,
              // Vertical spacing between rows
              mainAxisSpacing: 5.0,
              // Horizontal spacing between columns
              crossAxisSpacing: 5.0,
              // Padding of GridView
              padding: const EdgeInsets.all(5.0),
              // The ratio between the width and height of items
              childAspectRatio: 0.75,
              // List of items widgets
              children: items.map<Widget>((Item item) => _ItemGridCellWidget(item)).toList(),
            ),
            // ListView tab content Widget
            ListView.builder(itemCount: items.length, itemBuilder: (BuildContext context, int position) => _ItemListCellWidget(items[position]))
          ],
        ),
      ),
    );
  }
}

class _ItemGridCellWidget extends StatelessWidget {
  final Item _item;

  _ItemGridCellWidget(this._item);

  void _selectItem(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => _ItemFullScreenWidget(_item),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return GridTile(
        footer: GridTileBar(
          title: Text(_item.name),
          subtitle: Text(_item.description),
          backgroundColor: Colors.black38,
        ),
        child: GestureDetector(
          onTap: () => _selectItem(context),
          child: Hero(
            key: Key(_item.imageUrl),
            tag: _item.name,
            child: Image.network(
              _item.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ));
  }
}

class _ItemListCellWidget extends StatelessWidget {
  final Item _item;

  _ItemListCellWidget(this._item);

  void _selectItem(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => _ItemFullScreenWidget(_item),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => _selectItem(context),
//      isThreeLine: true,
      title: Text(
        _item.name,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
      ),
      subtitle: Text(
        _item.description,
        maxLines: 2,
        style: TextStyle(),
      ),
      leading: Hero(
        key: Key(_item.imageUrl),
        tag: _item.name,
        child: Image.network(
          _item.imageUrl,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _ItemFullScreenWidget extends StatelessWidget {
  final Item _item;

  _ItemFullScreenWidget(this._item);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_item.name),
      ),
      body: SizedBox.expand(
        child: Hero(
          tag: _item.name,
          child: Image.network(
            _item.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

List<Item> items = [
  //1
  Item(
    "https://cf.shopee.co.id/file/4ac380fdc2f97f8929445c57bfd4218f",
    "Sepatu Converse Original",
    "450.000 - 500.000",
  ),
  //2
  Item(
    "https://i.pinimg.com/originals/40/c3/be/40c3bef82a8077e5c872808eefff5c6d.png",
    "Everest",
    "02.11",
  ),
  //3
  Item(
    "https://image.freepik.com/free-vector/flat-design-baby-shark-cartoon-style_52683-36255.jpg",
    "Shark",
    "21.52",
  ),
  //4
  Item(
    "https://image.freepik.com/free-vector/fairytale-concept-with-child-reading_23-2148472951.jpg",
    "Dreaming",
    "22.11",
  ),
  //5
  Item(
    "https://img.freepik.com/free-vector/spring-landscape-scene_23-2148860692.jpg",
    "Nature",
    "01.12",
  ),
  //6
  Item(
    "https://pw.artfile.me/wallpaper/20-03-2017/650x366/vektornaya-grafika-priroda--nature-sneg--1143282.jpg",
    "Everest 2",
    "23.44",
  ),
  //7
  Item(
    "https://wallpaperaccess.com/full/645620.png",
    "IronHeard",
    "19.20",
  ),
  //8
  Item(
    "https://images.wallpaperscraft.com/image/single/astronaut_spacesuit_reflection_144426_1280x720.jpg",
    "Astronot",
    "20.00",
  ),
  //9
  Item(
    "https://images.wallpaperscraft.com/image/single/deer_art_vector_134088_1280x720.jpg",
    "Deer",
    "14.55",
  ),
  //10
  Item(
    "https://images.wallpaperscraft.com/image/single/minimalism_sky_clouds_sun_mountains_lake_landscape_95458_1280x720.jpg",
    "Kilimanjaro",
    "12.00",
  ),
  //11
  Item(
    "https://images.wallpaperscraft.com/image/single/lion_art_vector_122213_1280x720.jpg",
    "The Lion King",
    "16.19",
  ),
  //12
  Item(
    "https://images.wallpaperscraft.com/image/single/minimalism_origami_japan_rising_sun_wave_74405_1280x720.jpg",
    "Japanese",
    "15.11",
  ),
  //13
  Item(
    "https://images.wallpaperscraft.com/image/single/landscape_mountains_art_140515_1280x720.jpg",
    "Lavender",
    "21.20",
  ),
  //14
  Item(
    "https://images.wallpaperscraft.com/image/single/spruce_art_forest_131371_1280x720.jpg",
    "Night Nature",
    "16.07",
  ),
  //15
  Item(
    "https://images.wallpaperscraft.com/image/single/forest_trees_mountains_146485_1280x720.jpg",
    "Forest 2",
    "17.18",
  ),
  //16
  Item(
    "https://images.wallpaperscraft.com/image/single/phoenix_bird_art_140086_1280x720.jpg",
    "Phoenix",
    "10.00",
  ),
  //17
  Item(
    "https://images.wallpaperscraft.com/image/single/mountains_river_sun_143529_1280x720.jpg",
    "River",
    "10.11",
  ),
  //18
  Item(
    "https://images.wallpaperscraft.com/image/single/silhouette_moon_art_138485_1280x720.jpg",
    "Moon Art",
    "16.19",
  ),
  //19
  Item(
    "https://images.wallpaperscraft.com/image/single/graphics_low_poly_digital_art_minimalism_102027_1280x720.jpg",
    "Poligon Art",
    "23.59",
  ),
  //20
  Item(
    "https://images.wallpaperscraft.com/image/single/mountains_sunset_landscape_147439_1280x720.jpg",
    "Sunset",
    "16.10",
  ),
];
