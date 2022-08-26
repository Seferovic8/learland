import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:learland/_all.dart';

class LoadAddModal extends StatefulWidget {
  const LoadAddModal({super.key});

  @override
  State<LoadAddModal> createState() => _LoadAddModalState();
}

class _LoadAddModalState extends State<LoadAddModal> {
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SizedBox(
        height: 200,
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            TextField(
              controller: textController,
              style: const TextStyle(fontFamily: "Roboto"),
              decoration: InputDecoration(
                labelText: "Naziv Staklenika",
                labelStyle: const TextStyle(fontFamily: "Roboto", color: ColorStyling.defaultColor),
                fillColor: ColorStyling.defaultColor,
                focusColor: ColorStyling.defaultColor,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: ColorStyling.defaultColor, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: ColorStyling.defaultColor, width: 1.5),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: ColorStyling.defaultColor, width: 5),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              width: 200,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(32, 148, 238, 1)),

                  //textStyle: MaterialStateProperty.all(TextStyle(color: Colors.white,)),
                ),
                onPressed: () {
                  context.read<SnapshotBloc>().add(AddInstanceEvent(uid: context.read<AuthBloc>().state.user!.user!.uid, name: textController.text));
                  context.read<LoadBloc>().add(LoadGetNamesEvent(uid: context.read<AuthBloc>().state.user!.user!.uid));
                },
                child: const Text(
                  "Sačuvaj",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
