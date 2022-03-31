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
  int page =0;
  final PageController _pageController = PageController(initialPage: 0);

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
                    flex: 2,
                    child: PageView.builder(
                      controller :_pageController,
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
                          Padding(
                            padding: const EdgeInsets.only(top: 80, bottom:20),
                            child: _botonCambio(),
                          ),
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
  SizedBox _botonCambio() {
    return SizedBox(
      width: 270,
      height: 40,
      child: OutlinedButton(
        onPressed: () {

          if (page < (boardingData.length - 1)) {
            page += 1;
            print(boardingData.length);
            print(page);
            setState(() {
              ContainerBoarding(
                image: boardingData[page]['image']!,
                title: boardingData[page]['title']!,
                text: boardingData[page]['Text']!,
              );
            });
            _pageController.animateToPage(page, duration: const Duration(milliseconds: 450), curve: Curves.decelerate);
          }
          else {
            Navigator.pushNamed(context, '/login');
          }
        },
        child: Text(
            page == (boardingData.length - 1)
                ? 'Continuar'
                : 'Siguiente',
            style: page == (boardingData.length - 1)
                ? TextStyle(color: Colors.white)
                : TextStyle(color: ColorsViews.textSubtitle)),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (page == (boardingData.length - 1)) {
              return ColorsViews.bottomGreen;
            }
            return Colors.transparent;
          }),
          overlayColor: MaterialStateProperty.resolveWith<Color>(
                (states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.grey;
              }
              return Colors.transparent;
            },
          ),
          shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                (_) {
              return RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16));
            },
          ),
        ),
      ),
    );
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
