import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:xiaomian/assets_code/xm_color.dart';
import 'package:xiaomian/model/audio_item.dart';

class CoverListTile extends StatefulWidget {
  const CoverListTile({
    super.key,
    required this.data,
    this.onTap, 
    this.editEnable,
    this.editSelected,
  });


  final AudioItem data;
  final void Function(AudioItem data)? onTap;
  final bool? editEnable;
  final void Function(bool selected)? editSelected;

  @override
  State<CoverListTile> createState() => _CoverListTileState();
}

class _CoverListTileState extends State<CoverListTile> {
  final ValueNotifier<bool> _edit = ValueNotifier(false);
  final ValueNotifier<bool> _selected = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
  }

   @override
  void didUpdateWidget(covariant CoverListTile oldWidget) {
    if (widget.editEnable == null || widget.editEnable == false ) {
      _selected.value = false;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.editEnable != null) {
      _edit.value = widget.editEnable!;
    }
    return GestureDetector(
        onTap: widget.onTap == null ? null : () => widget.onTap!(widget.data),
        child: InkWell(
          child: SizedBox(
            height: 120,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Gap(8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                          placeholder: (context, url) => Container(), 
                          errorWidget: (context, url, error) => Container(color: Colors.white,),
                          imageUrl: widget.data.cover ?? "", 
                          height: 90,
                          width: 90,
                          fit: BoxFit.cover,
                        ),
                ),
                Gap(16),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: Text(widget.data.title ?? "", maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w900),)),
                          ConstrainedBox(constraints: const BoxConstraints(maxWidth: 120),
                          child: Text(widget.data.author?.name ?? "", overflow: TextOverflow.ellipsis, style: TextStyle(color: XMColor.xmGrey, fontSize: 12, fontWeight: FontWeight.w600),))
                        ],
                      ),
                      Gap(5),
                      Text(widget.data.desc ?? "", maxLines: 2, softWrap: true, overflow: TextOverflow.ellipsis, style: TextStyle(color: XMColor.xmGrey, fontSize: 12, fontWeight: FontWeight.w600),),
                    ],
                  ),
                ),
                ValueListenableBuilder(valueListenable: _edit, builder: (context, value, child) {
                  return value ? Gap(3) : Gap(0);
                }),
                ValueListenableBuilder(valueListenable: _edit, builder: (context, value, child) {
                  return value ? IconButton(onPressed: () {
                      _selected.value = !_selected.value;
                      widget.editSelected?.call(_selected.value);
                    }, icon: ValueListenableBuilder(
                      builder: (context, value, child) {
                        return value ? Icon(Icons.check_circle_outline_rounded, color: XMColor.xmRed,) : const Icon(Icons.radio_button_off_rounded, color: Colors.white,);
                      }, valueListenable: _selected,
                    )) : Gap(0);
                },),
                ValueListenableBuilder(valueListenable: _edit, builder: (context, value, child) {
                  return value ? Gap(0) : Gap(16);
                }),
              ],
            ),
          ),
        ),
      );
  }
}