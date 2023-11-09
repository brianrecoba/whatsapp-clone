import 'package:flutter/material.dart';
import 'dart:io';

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const WhatsAppClone());
}

class WhatsAppClone extends StatelessWidget {
  const WhatsAppClone({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp Clone',
      home: AppBarPrimary(),
    );
  }
}

class AppBarPrimary extends StatelessWidget {
  const AppBarPrimary({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green[900],
            title: Text("Whatsapp", textAlign: TextAlign.start),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.search,
                    ),
                    Icon(Icons.more_vert)
                  ],
                ),
              ),
            ],
            bottom: TabBar(
              labelColor: Colors.white,
              indicatorColor: Colors.white,
              tabs: [
                Tab(icon: Icon(Icons.camera_alt)),
                Tab(
                  text: "CHATS",
                ),
                Tab(
                  text: "STATUS",
                ),
                Tab(
                  text: "CALLS",
                )
              ],
            ),
          ),
          floatingActionButton: Container(
              alignment: Alignment.center,
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  color: Colors.green[600],
                  borderRadius: BorderRadius.circular(100)),
              child: Icon(
                Icons.message,
                size: 30,
                color: Colors.white,
              )),
          body: ListView(
            children: [
              Message("Leandrinha ", "Aralhooo",
                  "https://agoraequesaoelas.blogfolha.uol.com.br/files/2018/09/Captura-de-Tela-2018-09-05-a%CC%80s-4.16.21-PM.png", "11:23 AM", 1),
              Message("Faustinho", "Oloco, bicho",
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTa-rV0-j8nnx5mZlj3xYWQBKxWP1eW0eRPg&usqp=CAU", "11:23 AM", 1),
              Message("Travolta", "???",
                  "https://rollingstone.uol.com.br/media/_versions/pulp_fiction_reproducao_video_1_widelg.png", "11:23 AM", 3),
              Message("CJzada", "ah shit, here we go again",
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcAmmzx5mfrBI4Xu5K3iezfkvKrV8gGYZ5iQ&usqp=CAU", "11:23 AM", 3),
              Message("Sherek", "Não convida o burro...",
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQI9gaC_kgyGIAeaq4qJ7EH5BpSUDqHXQMm737anB04JMAwAZ6xfXudDfq-1X1ZG5SArN4&usqp=CAU", "11:23 AM", 3),
              Message("R Marquinhos", "KATCHAAAU",
                  "https://i1.sndcdn.com/artworks-aLoynizs9v21qy3F-z7Bs0A-t500x500.jpg", "11:23 AM", 2),
              Message(
                  "Sikera",
                  "Você vai morrer em...",
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSp2NT8jAT_KAZ-IQAcu9US6obsQsOz0AIjIw&usqp=CAU",
                  "01:12 PM",
                  3),
              Message(
                  "Fulano",
                  "Olá Flutter",
                  "https://imgs.search.brave.com/CbsOrhsAuZMg4MdTqO-80bBrFAuelNiI4sahY17Vo6E/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9pbWcu/ZnJlZXBpay5jb20v/Zm90b3MtZ3JhdGlz/L2pvdmVtLWxpbmRh/LWFuZGEtcGVsYS1j/aWRhZGUtbmEtZXVy/b3BhLWZvdG8tZGUt/cnVhLW11bGhlci1w/b3NhbmRvLW5vLWNl/bnRyby1kYS1jaWRh/ZGVfMTMyMS00MzUy/LmpwZz9zaXplPTYy/NiZleHQ9anBn",
                  "01:12 PM",
                  4),
              Message(
                  "Ciclano",
                  "Este é o clone do WhatsApp",
                  "https://imgs.search.brave.com/fwiJzuuWkSCZycgVapS0ExCi80NkLVf7vziOL3CMzdc/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9pbWcu/ZnJlZXBpay5jb20v/Zm90b3MtZ3JhdGlz/L2VtcHJlc2FyaW8t/cHJvc3Blcm8tbWFu/dGVtLWFzLW1hb3Mt/Y3J1emFkYXMtdGVt/LWV4cHJlc3Nhby1z/YXRpc2ZlaXRhXzI3/MzYwOS0xNjcxMS5q/cGc_c2l6ZT02MjYm/ZXh0PWpwZw",
                  "3:02 PM",
                  1),
            ],
          )),
    );
  }
}

class Message extends StatelessWidget {
  final String name;
  final String message;
  final String urlImage;
  final String timeMessage;
  final int numberOfMessage;

  const Message(this.name, this.message, this.urlImage, this.timeMessage,
      this.numberOfMessage,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, top: 6),
      child: Container(
        margin: EdgeInsets.all(4),
        width: 400,
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image(
                  width: 70,
                  height: 70,
                  image: NetworkImage(urlImage),
                  fit: BoxFit.cover,
                )),
            Container(
              width: 230,
              padding: EdgeInsets.only(left: 8),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                    Container(
                      margin: EdgeInsets.only(top: 4),
                      child: Text(
                        message,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 12),
                      ),
                    )
                  ]),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.only(right: 8),
                  child: Text(
                    timeMessage,
                    style: TextStyle(fontSize: 15, color: Colors.green),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 8, top: 2),
                  alignment: Alignment.center,
                  width: 16,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.green),
                  child: Text(numberOfMessage.toString(),
                      style: TextStyle(color: Colors.white)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

