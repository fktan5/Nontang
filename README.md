# nontang is

Lovelive easy Web API.

Using:

 * [Pebbles-Lovelive](https://github.com/STAR-ZERO/pebbles-lovelive)
 * [Sinatra](http://www.sinatrarb.com)

# Usage

## Members Info

Example:

http://nontang.herokuapp.com/member?name=nozomi

```
$ curl -s http://nontang.herokuapp.com/member\?name\=nozomi | jq .
{
  "name": "東條希",
  "cv": "楠田亜衣奈",
  "birth": "6月9日",
  "birth_zodiac": "双子座",
  "blood": "O",
  "three_size": "B90・W60・H82",
  "favorite_food": "焼き肉",
  "dislike_food": "キャラメル",
  "profile": "17歳。高校3年生。生徒会副会長。絵里とは対照的にマイペースな性格で、関西弁混じりの独特の口調で話す。クールな雰囲気の絵里とはいいコンビ。大らかさがあり、全メンバー中、実は精神年齢は一番上と思わせる所も。のほほんとしているけれど、意外と策士？"
}
```
## Story

Example:

http://nontang.herokuapp.com/story?season=1&num=13

```
$ curl -s http://nontang.herokuapp.com/story\?season\=1\&num\=13 | jq .
{
  "season": 1,
  "number": 13,
  "title": "μ’s ミュージックスタート！",
  "desc": "ことりの悩みに気付けなかった自分を責め、スクールアイドル引退を決意した穂乃果。それを受けてμ'sは活動を休止し、目的を失った穂乃果は海未ともすれ違ってしまう。そんな中、スクールアイドルを続けようと練習に励むにこに素っ気無いながらも励まされ、絵里からは思いもよらぬ告白をされた穂乃果はある決心をする。翌朝、呼び出しに応じて講堂にやってきた海未に、穂乃果は素直な思いを伝える。それを聞いた海未は――。"
}
```
