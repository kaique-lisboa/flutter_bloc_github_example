import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_app/model/repo_model.dart';
import 'package:flutter_bloc_app/ui/ios/shared/components/card.dart';
import 'package:intl/intl.dart';

class RepoDetailsPage extends StatelessWidget {
  final RepoModel _repo;

  const RepoDetailsPage(this._repo);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(this._repo.name),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Hero(
              tag: 'expandRepo${_repo.id}',
              child: CCard(
                radius: 0,
                shadow: 0,
                child: Row(
                  children: [
                    Flexible(
                      child: Container(
                        padding: new EdgeInsets.only(right: 13.0),
                        child: Text(
                          _repo.name,
                          overflow: TextOverflow.fade,
                          style: TextStyle(fontSize: 32.0),
                          softWrap: false,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Material(color: Colors.transparent, child: Divider(
                  thickness: 0.5,
                )),
                _repo.description != null
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SelectableText(
                          _repo.description,
                          style: TextStyle(color: Colors.black54),
                        ),
                      )
                    : SizedBox.shrink(),
                InformacaoRow(
                  leftInfoLabel: 'criado em',
                  leftInfoValue: DateFormat('dd/MM/yyyy')
                      .format(DateTime.parse(_repo.createdAt)),
                  rightInfoLabel: 'estrelas',
                  rightInfoValue: _repo.stargazersCount.toString(),
                ),
                InformacaoRow(
                  leftInfoLabel: 'url',
                  leftInfoValue: _repo.cloneUrl,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class InformacaoRow extends StatelessWidget {
  final String leftInfoLabel;
  final String leftInfoValue;
  final String rightInfoLabel;
  final String rightInfoValue;

  const InformacaoRow(
      {Key key,
      this.leftInfoLabel,
      this.leftInfoValue,
      this.rightInfoLabel,
      this.rightInfoValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          LabelItem(
            label: leftInfoLabel,
            value: leftInfoValue,
          ),
          (rightInfoValue != null && rightInfoLabel != null)
              ? LabelItem(
                  label: rightInfoLabel,
                  value: rightInfoValue,
                )
              : SizedBox.shrink()
        ],
      ),
    );
  }
}

class LabelItem extends StatelessWidget {
  final String label;
  final String value;

  const LabelItem({Key key, this.label, this.value}) : super(key: key);

  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SelectableText(label, style: TextStyle(color: Colors.black54),),
          SelectableText(value, style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
