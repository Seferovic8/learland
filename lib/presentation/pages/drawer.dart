import 'package:learland/_all.dart';

enum Pages {
  homePage,
  loadPage,
  workPage,
}

class AppDrawer extends StatelessWidget {
  Pages page;
  int? workIndex;
  bool getActive(Pages checkPage) {
    return checkPage == page;
  }

  AppDrawer({super.key, required this.page, this.workIndex});
  @override
  Widget build(BuildContext context) {
    if (page == Pages.workPage && workIndex == null) {
      throw Exception();
    }
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.6,
      child: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _NavButton(callback: () => Navigator.of(context).pushNamed(HomePage.routeName), icon: Icons.home, title: 'Početna', isActive: getActive(Pages.homePage)),
            _NavButton(callback: () => Navigator.of(context).pushNamed(LoadPage.routeName), icon: Icons.share, title: 'Staklenici', isActive: getActive(Pages.loadPage)),
          ],
        ),
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  final VoidCallback callback;
  final String title;
  final bool isActive;
  final IconData icon;
  const _NavButton({
    Key? key,
    required this.callback,
    required this.title,
    required this.isActive,
    required this.icon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Color backColor = ColorStyling.defaultColor;
    Color contentColor = Colors.white;
    if (isActive) {
      contentColor = ColorStyling.defaultColor;
      backColor = Colors.white;
    }
    return InkWell(
      onTap: callback,
      child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: ColorStyling.defaultColor, width: 2),
            color: backColor,
          ),
          // padding: const EdgeInsets.all(4),
          height: 48,
          margin: const EdgeInsets.only(top: 20),
          child: Row(
            children: [
              Container(
                width: 5,
                height: 48,
                color: const Color.fromRGBO(104, 190, 12, 1),
              ),
              const Spacer(),
              Icon(
                icon,
                color: contentColor,
                size: 32,
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
              ),
              const Spacer(),
              Text(
                title,
                style: TextStyle(fontSize: 25, color: contentColor),
              ),
              const Spacer(),
            ],
          )),
    );
  }
}
