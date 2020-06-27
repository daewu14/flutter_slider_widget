import 'package:daewu/slider/slider_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        height: MediaQuery.of(context).size.width / 1.5,
        child: SliderWidget(
          widgets: items(),
          indicatorSize: 20,
          withIndicator: true,
          autoSlide: true,
          indicatorColorSelected: Colors.orange,
          indicatorColorUnselected: Colors.grey[300],
          onTap: (index){
            debugPrint("CLICKED INDEX : ${index}");
          },
        ),
      ),
    );
  }

  // YOU CAN WRITE ALL WIDGET YOU WANT !!!
  // THIS IS JUST EXAMPLE
  // YOUR DATA
  List<Widget> items (){
    List<String> urlImages = [
      "https://s.studiobinder.com/wp-content/uploads/2019/11/jbareham_190421_0890_mcu_ranked_final.0.jpg",
      "https://mmc.tirto.id/image/otf/500x0/2019/03/07/poster-captain-marvel-imdb_ratio-16x9.jpg",
      "https://www.biem.co/wp-content/uploads/2019/05/marvel-cinematic-universe.jpg",
      "https://s.studiobinder.com/wp-content/uploads/2019/11/jbareham_190421_0890_mcu_ranked_final.0.jpg",
      "https://mmc.tirto.id/image/otf/500x0/2019/03/07/poster-captain-marvel-imdb_ratio-16x9.jpg",
      "https://www.biem.co/wp-content/uploads/2019/05/marvel-cinematic-universe.jpg",
      "https://s.studiobinder.com/wp-content/uploads/2019/11/jbareham_190421_0890_mcu_ranked_final.0.jpg",
      "https://mmc.tirto.id/image/otf/500x0/2019/03/07/poster-captain-marvel-imdb_ratio-16x9.jpg",
      "https://www.biem.co/wp-content/uploads/2019/05/marvel-cinematic-universe.jpg",
      "https://s.studiobinder.com/wp-content/uploads/2019/11/jbareham_190421_0890_mcu_ranked_final.0.jpg",
      "https://mmc.tirto.id/image/otf/500x0/2019/03/07/poster-captain-marvel-imdb_ratio-16x9.jpg",
      "https://www.biem.co/wp-content/uploads/2019/05/marvel-cinematic-universe.jpg",
    ];
    return List.generate(urlImages.length, (index){
      return yourCustomizeWidget(index: index, urlImages: urlImages);
    });
  }

  // YOUR CUSTOMIZE WIDGET
  // YOU CAN WRITE ALL WIDGET YOU WANT !!!
  // THIS IS JUST EXAMPLE
  yourCustomizeWidget({int index, List<String> urlImages}) {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          child: Image.network("${urlImages[index]}",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

}
