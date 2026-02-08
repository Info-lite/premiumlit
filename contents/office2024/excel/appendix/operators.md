---
layout: appendix
title: 演算子についての補足
date: 2015-03-23 16:47:27 +0900
---


関係演算子
----------

関係演算子には以下のようなものがあります。

<table>
<thead>
<tr>
<th>記号</th><th>処理内容</th>
</tr>
</thead>
<tbody>
<tr>
<td>=</td><td>等しい</td>
</tr><tr>
<td>&gt;</td><td>大なり</td>
</tr><tr>
<td>&gt;=</td><td>以上</td>
</tr><tr>
<td>&lt;</td><td>小なり</td>
</tr><tr>
<td>&lt;=</td><td>以下</td>
</tr><tr>
<td>&lt;&gt;</td><td>不等号</td>
</tr>
</tbody>
</table>

関係演算子は2つの値の関係を表わし、結果は `TRUE` (真) か `FALSE` (偽) で表示されます。

たとえば "A1" に `10`、"B1" に `20` があったとします。"C1" を選び `=A1 > B1`、あるいは `=A1 <> B1` と入力しましょう。
すると結果は以下のようです。

{% screenshot no9excelformula4.png "成り立たない場合" %}

{% screenshot no9excelformula5.png "成り立つ場合" %}


文字に対する演算
----------------

文字に対しても演算が行える場合があります。
`&` は、文字列同士を連結する演算子です。
"A2" に `太郎`、"A3" に `花子` があったとします。
"B3" を選んで `=A2 & "と" & A3` と入力すると "B3" は `太郎と花子` となります。
式の中では、必ず `"` （半角引用符）で文字列をくくります。

{% screenshot no9excelformula2.png "入力する式" %}

{% screenshot no9excelformula3.png "演算結果" %}

