---
layout: appendix
title: Microsoft Excelで使える関数
date: 2015-03-23 16:47:41 +0900
---


Microsoft Excelには非常に多くの関数が用意されています。


関数の書式
----------

演算子の項でも触れましたが、数式は `=` （半角イコール）から始まります。

例えば、関数 `SUM` について考えてみましょう。

{% screenshot no9excelfunction1.png "単一区間で表現する場合" %}

ここでは、"A1" から "A10" までの区間（`a1:a10` と表現）の総和を、関数 `SUM()` で求めています。
以下の計算でも同じ結果となります。

{% screenshot no9excelfunction2.png "複数区間の総和として表現する場合" %}

その他のよく使う関数としては、平均値 `AVERAGE()` 、最高値 `MAX()` 、最低値 `MIN()` 等があります。


その他の関数
------------

{% screenshot no9excelfunction3.png "関数の挿入" %}

空白セルを選択し、数式バーの左にある ![関数の挿入ボタン](pic/fx.png) をクリックすると、以下のような一覧ダイアログが表示されます。
ここから必要な関数を探すと良いでしょう。

{% screenshot no9excelfunction4.png "関数の挿入ダイアログ" %}

