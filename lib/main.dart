import 'package:flutter/material.dart';
import 'package:network_qayta/servic/http.dart';
import 'package:network_qayta/servic/model/post.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String data = "";

  void _apiPostlist() {
    Network.GET(Network.API_list, Network.paramsEmpty())
        .then((response) => {print(response), _showresponse(response!)});
  }

  void _apiCreatlist(Post post) {
    Network.POST(Network.API_create, Network.paramsCreate(post))
        .then((response) => {print(response), _showresponse(response!)});
  }

  void _apiUpdata(Post post) {
    Network.PUT(Network.API_update, Network.paramsUpdata(post))
        .then((response) => {print(response), _showresponse(response!)});
  }

  void _delpost(Post post) {
    Network.DEL(Network.API_del, Network.paramsEmpty())
        .then((response) => {print(response), _showresponse(response!)});
  }

  void _showresponse(String response) {
    setState(() {
      data = response;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var post = Post(id: 1, title: 'pdp', body: 'online', userId: 1);
    _apiPostlist();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(data != null ? data : "No data"),
      ),
    );
  }
}
