import 'package:learland/_all.dart';

class LoadItem extends StatelessWidget {
  final String name;
  const LoadItem({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(WorkPage.routeName, arguments: {'title': name});
        },
        // decoration: BoxDecoration(color: ColorStyling.defaultColor,borderRadius: BorderRadius.circular(24)),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(24), color: const Color.fromRGBO(162, 191, 132, 1), border: Border.all(strokeAlign: StrokeAlign.inside, color: ColorStyling.defaultColor, width: 2)),
          alignment: Alignment.center,
          child: Text(
            name,
            style: const TextStyle(fontSize: 20, color: Colors.white, fontFamily: 'MontSerrat'),
          ),
        ),
      ),
    );
  }
}
