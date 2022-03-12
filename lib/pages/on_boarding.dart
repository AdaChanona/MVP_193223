import 'package:flutter/material.dart';
import 'package:mvp_all/styles/colors/colors_views.dart';
import 'login.dart';

int page =0;

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  List<Map<String,String>> boardingData =[
    {
      "image": "assets/image/B1.png",
      "title": "Esparcimiento",
      "Text": "Nullam ac condimentum dui. Nunc sed lectus quis turpis pretium tempus sit amet ac mauris."
    },
    {
      "image": "assets/image/B2.png",
      "title": "Adopción",
      "Text": "Nullam ac condimentum dui. Nunc sed lectus quis turpis pretium tempus sit amet ac mauris."
    },
    {
      "image": "assets/image/B3.png",
      "title": "Hospitalidad",
      "Text": "Nullam ac condimentum dui. Nunc sed lectus quis turpis pretium tempus sit amet ac mauris."
    },
    {
      "image": "assets/image/B4.png",
      "title": "Veterinaria",
      "Text": "Nullam ac condimentum dui. Nunc sed lectus quis turpis pretium tempus sit amet ac mauris."
    },
    {
      "image": "assets/image/B5.png",
      "title": "Tienda",
      "Text": "Nullam ac condimentum dui. Nunc sed lectus quis turpis pretium tempus sit amet ac mauris."
    }

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:SafeArea(
          child: Container(
            color: Colors.white,
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 3,
                    child: PageView.builder(
                      onPageChanged: (value) =>{
                        setState((){
                          page=value;
                        })
                      },
                      itemBuilder: (context, index) => ContainerBoarding(
                        image: boardingData[index]["image"]!,
                        title: boardingData[index]["title"]!,
                        text: boardingData[index]["Text"]!,
                      ),
                      itemCount: boardingData.length,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: <Widget> [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                                boardingData.length,
                                    (index) => _animatedContainer(index:index)
                            ),
                          ),
                          if (page==4) ...[
                            _botonCambio(
                              ColorsViews.bottomGreen,
                              ColorsViews.bottomGreen,
                              Colors.white, "Continuar",
                              1
                            ),
                          ] else ...[
                            _botonCambio(
                                Colors.white,
                                ColorsViews.colorBarraContinua,
                                ColorsViews.colorBarraContinua,
                                "Siguiente",
                                0
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
  Container _botonCambio (botonColor, borderColor, textColor, text, pageRoute){
    return Container(
      height: 40,
      width: 300,
      margin: const EdgeInsets.only(top: 60, left: 20, right: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: botonColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
          ),
          side: BorderSide(color: borderColor),
        ),
        child: Text(text, style: TextStyle(color: textColor, fontSize: 15),),
        onPressed: () {
          if (pageRoute==1){
            Route route = MaterialPageRoute(builder: (bc) => const Login());
            Navigator.of(context).push(route);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Continuar Scroll"),
              ),
            );
          }

        },
      ),
    );
  }
}

AnimatedContainer _animatedContainer({required int index}){
  return AnimatedContainer(
    duration: kThemeAnimationDuration,
    height: 4,
    width: page == index ? 30 : 12,
    margin: const EdgeInsets.only(left: 8,),
    decoration: BoxDecoration(
      color:  page == index
          ? ColorsViews.colorBarra
          : ColorsViews.textSubtitle
    ),
  );

}

class ContainerBoarding extends StatelessWidget {
  final String image;
  final String title;
  final String text;
  const ContainerBoarding({
    Key? key,
    required this.image,
    required this.title,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 250,
              height: 250,
              child: Image.asset(image),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text(
                    title,
                    style: const TextStyle(
                        color: ColorsViews.textHeader,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 15, right: 50, left: 50),
                child: Text(
                  text,
                  style: const TextStyle(
                      color: ColorsViews.colorBarraContinua,
                      fontSize: 15,
                  ),
              ),
            ),
          ],
        ),
    );

  }
}
