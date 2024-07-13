import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wallpaper_app/models/photo_model.dart';
import 'package:wallpaper_app/services/api_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PhotoModel? photos;
  ApiServices apiServices = ApiServices();
  @override
  void initState() {
    super.initState();
    fetchPhotos();
  }

  fetchPhotos() async {
    photos = await apiServices.getPhotos();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: (photos?.photos.isEmpty ?? true)
  ? const Center(
      child: CircularProgressIndicator(
        color: Colors.orange,
      ),
    )
  : ListView.builder(
      itemCount: (photos!.photos.length / 2).ceil(),
      itemBuilder: (context, index) {
        int firstIndex = index * 2;
        int secondIndex = index * 2 + 1;
        bool validIndices = firstIndex < photos!.photos.length &&
                           secondIndex < photos!.photos.length;

        return Row(
          children: [
            Expanded(
              child: validIndices ? GridItem(
                imageUrl: photos!.photos[firstIndex].src.medium ,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ImageViewScreen(
                      photo: photos!.photos[firstIndex]
                    )
                  )
                )
              ) : const SizedBox(),
            ),
            Expanded(
              child: validIndices ? GridItem(
                imageUrl: photos!.photos[secondIndex].src.medium ,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ImageViewScreen(
                      photo: photos!.photos[secondIndex]
                    )
                  )
                )
              ) : const SizedBox(),
            ),
          ],
        );
      },
    )
);
  }
}

class GridItem extends StatelessWidget {
  const GridItem({
    super.key,
    required this.imageUrl,
    required this.onTap,
  });

  final String imageUrl;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          fixedSize: const Size(double.infinity, double.infinity),
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        ),
        onPressed: onTap,
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          height: 300,
        ));
  }
}

class ImageViewScreen extends StatefulWidget {
  const ImageViewScreen({super.key, required this.photo});
  final Photo photo;

  @override
  State<ImageViewScreen> createState() => _ImageViewScreenState();
}

class _ImageViewScreenState extends State<ImageViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light),
      ),
      body: InteractiveViewer(
          child: Image.network(
        widget.photo.src.large,
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
      )),
    );
  }
}
