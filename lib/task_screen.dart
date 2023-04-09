import 'package:dotted_border/dotted_border.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

/* глобальные функции очень так себе идея */
MaterialStateProperty<Color> getColor(Color color, Color colorPressed) {
  getColor(Set<MaterialState> states) {
    if (states.contains(MaterialState.pressed)) {
      return colorPressed;
    } else {
      return color;
    }
  }

  return MaterialStateProperty.resolveWith(getColor);
}

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                // должно было быть appbar'ом и закрепленно вверху экрана при скролле
                // проверь в прототипе как это должно быть
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                        onTap: () {},
                        child: const Icon(FluentIcons.arrow_left_20_regular)),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Задача'),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Чат'),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {},
                      child: const Icon(
                        FluentIcons.more_horizontal_16_regular,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: OutlinedButton(
                  // OutlinedButton.styleFrom(
                  /// позволяет не иметь глобальную функцию getColor и передавать тип [Color]
                  /* 
                  OutlinedButton.styleFrom(
                    minimumSize: const Size.fromHeight(35),
                    side: const BorderSide(color: Colors.blue),
                    foregroundColor: Colors.blue,
                    backgroundColor: Colors.white,
                  ),
                   */
                  style: ButtonStyle(
                    minimumSize:
                        const MaterialStatePropertyAll(Size.fromHeight(35)),
                    side: const MaterialStatePropertyAll(
                        BorderSide(color: Colors.blue)),
                    foregroundColor: getColor(Colors.blue, Colors.white),
                    backgroundColor: getColor(Colors.white, Colors.blue),
                  ),
                  onPressed: () {},
                  child: const Text('Завершить'),
                ),
              ),
              const Divider(),
              Padding(
                // могло быть константой и все другие такие же
                padding: EdgeInsets.only(
                  left: 12.0,
                  right: 12,
                ),
                child: Row(
                  children: [
                    Expanded(child: Text('Какой-то текст')),
                    InkWell(
                      onTap: () {},
                      customBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      // что-то типо такого
                      child: Container(
                        height: 32,
                        width: 32,
                        alignment: AlignmentDirectional.center,
                        child: const Icon(
                          FluentIcons.edit_20_regular,
                          color: Colors.grey,
                          size: 20,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                  left: 12.0,
                  right: 12,
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(3),
                  onTap: () {},
                  child: DottedBorder(
                    dashPattern: const [3, 3],
                    color: Colors.grey,
                    radius: const Radius.circular(3),
                    borderType: BorderType.RRect,
                    child: const SizedBox(
                      height: 20,
                      width: 30,
                      child: Icon(
                        (FluentIcons.add_20_regular),
                        color: Colors.grey,
                        size: 14,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 12,
                  left: 12.0,
                  right: 12,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: const Icon(
                        FluentIcons.person_16_regular,
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(bottom: 1.0),
                        child: Icon(
                          FluentIcons.calendar_ltr_20_regular,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: EdgeInsets.only(
                  left: 12.0,
                  right: 12,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Описание'),
                    InkWell(
                      onTap: () {},
                      child: Icon(FluentIcons.edit_20_regular,
                          color: Colors.grey, size: 18),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 12.0, right: 12, top: 8),
                child: Text('Не заполнено'),
              ),
              const Divider(),
              const Padding(
                padding: EdgeInsets.only(left: 12.0, right: 12, bottom: 8),
                child: Text('вложения'),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 12.0,
                  right: 12,
                ),
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(10),
                  child: DottedBorder(
                    dashPattern: const [3, 3],
                    color: Colors.grey,
                    radius: const Radius.circular(10),
                    borderType: BorderType.RRect,
                    child: const SizedBox(
                      height: 60,
                      width: 60,
                      child: Icon(
                        (FluentIcons.add_20_regular),
                        color: Colors.grey,
                        size: 14,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
