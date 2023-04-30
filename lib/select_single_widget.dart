import 'package:flutter/material.dart';
import 'package:selection_item/model/box_decoration.dart';

class SingleSelection<T> extends StatefulWidget {
  String title;
  String hint;
  T? selectedItem;
  SelectionBoxDecoration ?boxDecoration;
  String Function(T item)? showItemSelection;
  List<T> items;
  Widget Function(T item) itemBuilder;
  Function(T itemSelected) selectCallBack;

  SingleSelection({
    Key? key,
    this.selectedItem,
    this.boxDecoration,
    this.showItemSelection,
    required this.title,
    required this.hint,
    required this.itemBuilder,
    required this.selectCallBack,
    required this.items,
  }) : super(key: key);

  @override
  State<SingleSelection<T>> createState() =>
      _SingleSelectionState<T>();
}

class _SingleSelectionState<T> extends State<SingleSelection<T>> {
  ScrollController scrollController = ScrollController();
  T? _selectedItem;

  @override
  void initState() {
    super.initState();
    widget.boxDecoration=widget.boxDecoration??SelectionBoxDecoration();
    _selectedItem = widget.selectedItem;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        showModalBottomSheet<dynamic>(
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
          ),
          builder: (context) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.remove,
                  size: 20,
                  color: Colors.black87,
                ),
                Text(
                  widget.title.replaceAll('*', ''),
                  style: widget.boxDecoration!.titleStyle,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 25),
                  child: Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * .5,
                      minWidth: MediaQuery.of(context).size.width * .8),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: RawScrollbar(
                        controller: scrollController,
                        thumbColor: Colors.grey,
                        radius: const Radius.circular(20),
                        thickness: 5,
                        thumbVisibility: true,
                        child: SingleChildScrollView(
                          controller: scrollController,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              for (var item in widget.items)
                                GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () {
                                      _selectedItem = item;
                                      widget.selectCallBack(item);
                                      setState(() {});
                                      Navigator.of(context).pop();
                                    },
                                    child: widget.itemBuilder(item)),
                              const SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            );
          },
          backgroundColor: Colors.white,
          elevation: 2,
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
        decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(
          color: Colors.black12,
          width: 1,
        ))),
        child: Row(
          children: [
            Text(
              widget.title,
              style:widget.boxDecoration!.titleStyle,
            ),
            const Spacer(),
            Text(
              (widget.showItemSelection != null && _selectedItem != null)
                  ? widget.showItemSelection!(_selectedItem as T)
                  : widget.hint,
              style:widget.boxDecoration!.hintStyle,
            ),
          ],
        ),
      ),
    );
  }
}
