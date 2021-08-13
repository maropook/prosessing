class Text
{
  int mode;
  int txt_mode;
  String txt;
  String string;

  Text(int a, String b)
  {
    mode = 0;
    txt_mode = a;
    txt = b;
    string = "";
  }

  void delete()
  {
    if (string == "")
    {
      if (txt.length() >= 1) {
        txt = txt.substring(0, txt.length() - 1);
      }
    } else
    {
      string = "";
    }
  }

  void change(int a)
  {
    mode = a;
  }

  String mode()
  {
    String a = "";
    switch(mode)
    {
    case 0:
      a = "English";
      break;

    case 1:
      a = "ひらがな";
      break;

    case 2:
      a = "カタカナ";
      break;
    }
    return(a);
  }

  String update()
  {
    return(txt + string);
  }

  void press(String a)
  {
    String k = a;
    if (mode == 0)
    {
      txt += k;
    } else if (mode == 1)
    {
      switch(k)
      {
      case "a":
        switch(string)
        {
        case "k":
          txt += "か";
          break;

        case "s":
          txt += "さ";
          break;

        case "t":
          txt += "た";
          break;

        case "n":
          txt += "な";
          break;

        case "h":
          txt += "は";
          break;

        case "m":
          txt += "ま";
          break;

        case "y":
          txt += "や";
          break;

        case "r":
          txt += "ら";
          break;

        case "w":
          txt += "わ";
          break;

        case "g":
          txt += "が";
          break;

        case "z":
          txt += "ざ";
          break;

        case "d":
          txt += "だ";
          break;

        case "b":
          txt += "ば";
          break;

        case "p":
          txt += "ぱ";
          break;

        case "x":
          txt += "ぁ";
          break;

        case "xy":
          txt += "ゃ";
          break;

        default:
          txt += "あ";
          break;
        }
        string = "";
        break;  

      case "i":
        switch(string)
        {
        case "k":
          txt += "き";
          break;

        case "s":
          txt += "し";
          break;

        case "t":
          txt += "ち";
          break;

        case "n":
          txt += "に";
          break;

        case "h":
          txt += "ひ";
          break;

        case "m":
          txt += "み";
          break;

        case "y":
          txt += "い";
          break;

        case "r":
          txt += "り";
          break;

        case "w":
          txt += "ゐ";
          break;

        case "g":
          txt += "ぎ";
          break;

        case "z":
          txt += "じ";
          break;

        case "d":
          txt += "ぢ";
          break;

        case "b":
          txt += "び";
          break;

        case "p":
          txt += "ぴ";
          break;

        case "x":
          txt += "ぃ";
          break;

        case "xy":
          txt += "ぃ";
          break;

        default:
          txt += "い";
          break;
        }
        string = "";
        break; 

      case "u":
        switch(string)
        {
        case "k":
          txt += "く";
          break;

        case "s":
          txt += "す";
          break;

        case "t":
          txt += "つ";
          break;

        case "n":
          txt += "ぬ";
          break;

        case "h":
          txt += "ふ";
          break;

        case "m":
          txt += "む";
          break;

        case "y":
          txt += "ゆ";
          break;

        case "r":
          txt += "る";
          break;

        case "w":
          txt += "う";
          break;

        case "g":
          txt += "ぐ";
          break;

        case "z":
          txt += "ず";
          break;

        case "d":
          txt += "づ";
          break;

        case "b":
          txt += "ぶ";
          break;

        case "p":
          txt += "ぷ";
          break;

        case "x":
          txt += "ぅ";
          break;

        case "xy":
          txt += "ゅ";
          break;

        case "xt":
          txt += "っ";
          break;

        default:
          txt += "う";
          break;
        }
        string = "";
        break; 

      case "e":
        switch(string)
        {
        case "k":
          txt += "け";
          break;

        case "s":
          txt += "せ";
          break;

        case "t":
          txt += "て";
          break;

        case "n":
          txt += "ね";
          break;

        case "h":
          txt += "へ";
          break;

        case "m":
          txt += "め";
          break;

        case "y":
          txt += "いぇ";
          break;

        case "r":
          txt += "れ";
          break;

        case "w":
          txt += "ゑ";
          break;

        case "g":
          txt += "げ";
          break;

        case "z":
          txt += "ぜ";
          break;

        case "d":
          txt += "で";
          break;

        case "b":
          txt += "べ";
          break;

        case "p":
          txt += "ぺ";
          break;

        case "x":
          txt += "ぇ";
          break;

        case "xy":
          txt += "ぇ";
          break;

        default:
          txt += "え";
          break;
        }
        string = "";
        break; 

      case "o":
        switch(string)
        {
        case "k":
          txt += "こ";
          break;

        case "s":
          txt += "そ";
          break;

        case "t":
          txt += "と";
          break;

        case "n":
          txt += "の";
          break;

        case "h":
          txt += "ほ";
          break;

        case "m":
          txt += "も";
          break;

        case "y":
          txt += "よ";
          break;

        case "r":
          txt += "ろ";
          break;

        case "w":
          txt += "を";
          break;

        case "g":
          txt += "ご";
          break;

        case "z":
          txt += "ぞ";
          break;

        case "d":
          txt += "ど";
          break;

        case "b":
          txt += "ぼ";
          break;

        case "p":
          txt += "ぽ";
          break;

        case "x":
          txt += "ぉ";
          break;

        case "xy":
          txt += "ょ";
          break;

        default:
          txt += "お";
          break;
        }
        string = "";
        break;

      case "n":
        if (string == "n")
        {
          txt += "ん";
          string = "";
        } else 
        {
          string = "n";
        }
        break;

      case "y":
        switch (string)
        {
        case "x":
          string = "xy";
          break;

        default:
          string = "y";
          break;
        }
        break;

      case "t":
        switch (string)
        {
        case "x":
          string = "xt";
          break;

        default:
          string = "t";
          break;
        }
        break;

      case "-":
        txt += "ー";
        break;

      case ",":
        txt += "，";
        break;

      case ".":
        txt += "。";
        break;

      default:
        string = a;
        break;
      }
    } else if (mode == 2)
    {
      switch(k)
      {
      case "a":
        switch(string)
        {
        case "k":
          txt += "カ";
          break;

        case "s":
          txt += "サ";
          break;

        case "t":
          txt += "タ";
          break;

        case "n":
          txt += "ナ";
          break;

        case "h":
          txt += "ハ";
          break;

        case "m":
          txt += "マ";
          break;

        case "y":
          txt += "ヤ";
          break;

        case "r":
          txt += "ラ";
          break;

        case "w":
          txt += "ワ";
          break;

        case "g":
          txt += "ガ";
          break;

        case "z":
          txt += "ザ";
          break;

        case "d":
          txt += "ダ";
          break;

        case "b":
          txt += "バ";
          break;

        case "p":
          txt += "パ";
          break;

        case "x":
          txt += "ァ";
          break;

        case "xy":
          txt += "ャ";
          break;

        default:
          txt += "ア";
          break;
        }
        string = "";
        break;  

      case "i":
        switch(string)
        {
        case "k":
          txt += "キ";
          break;

        case "s":
          txt += "シ";
          break;

        case "t":
          txt += "チ";
          break;

        case "n":
          txt += "二";
          break;

        case "h":
          txt += "ヒ";
          break;

        case "m":
          txt += "ミ";
          break;

        case "y":
          txt += "イ";
          break;

        case "r":
          txt += "リ";
          break;

        case "w":
          txt += "ヰ";
          break;

        case "g":
          txt += "ギ";
          break;

        case "z":
          txt += "ジ";
          break;

        case "d":
          txt += "ヂ";
          break;

        case "b":
          txt += "ビ";
          break;

        case "p":
          txt += "ピ";
          break;

        case "x":
          txt += "ィ";
          break;

        case "xy":
          txt += "ィ";
          break;

        default:
          txt += "イ";
          break;
        }
        string = "";
        break; 

      case "u":
        switch(string)
        {
        case "k":
          txt += "ク";
          break;

        case "s":
          txt += "ス";
          break;

        case "t":
          txt += "ツ";
          break;

        case "n":
          txt += "ヌ";
          break;

        case "h":
          txt += "フ";
          break;

        case "m":
          txt += "ム";
          break;

        case "y":
          txt += "ユ";
          break;

        case "r":
          txt += "ル";
          break;

        case "w":
          txt += "ウ";
          break;

        case "g":
          txt += "グ";
          break;

        case "z":
          txt += "ズ";
          break;

        case "d":
          txt += "ヅ";
          break;

        case "b":
          txt += "ブ";
          break;

        case "p":
          txt += "プ";
          break;

        case "x":
          txt += "ゥ";
          break;

        case "xy":
          txt += "ュ";
          break;

        case "xt":
          txt += "ッ";
          break;

        default:
          txt += "ウ";
          break;
        }
        string = "";
        break; 

      case "e":
        switch(string)
        {
        case "k":
          txt += "ケ";
          break;

        case "s":
          txt += "セ";
          break;

        case "t":
          txt += "テ";
          break;

        case "n":
          txt += "ネ";
          break;

        case "h":
          txt += "ヘ";
          break;

        case "m":
          txt += "メ";
          break;

        case "y":
          txt += "イェ";
          break;

        case "r":
          txt += "レ";
          break;

        case "w":
          txt += "ヱ";
          break;

        case "g":
          txt += "ゲ";
          break;

        case "z":
          txt += "ゼ";
          break;

        case "d":
          txt += "デ";
          break;

        case "b":
          txt += "ベ";
          break;

        case "p":
          txt += "ペ";
          break;

        case "x":
          txt += "ェ";
          break;

        case "xy":
          txt += "ェ";
          break;

        default:
          txt += "エ";
          break;
        }
        string = "";
        break; 

      case "o":
        switch(string)
        {
        case "k":
          txt += "コ";
          break;

        case "s":
          txt += "ソ";
          break;

        case "t":
          txt += "ト";
          break;

        case "n":
          txt += "ノ";
          break;

        case "h":
          txt += "ホ";
          break;

        case "m":
          txt += "モ";
          break;

        case "y":
          txt += "ヨ";
          break;

        case "r":
          txt += "ロ";
          break;

        case "w":
          txt += "ヲ";
          break;

        case "g":
          txt += "ゴ";
          break;

        case "z":
          txt += "ゾ";
          break;

        case "d":
          txt += "ド";
          break;

        case "b":
          txt += "ボ";
          break;

        case "p":
          txt += "ポ";
          break;

        case "x":
          txt += "ォ";
          break;

        case "xy":
          txt += "ョ";
          break;

        default:
          txt += "オ";
          break;
        }
        string = "";
        break;

      case "n":
        if (string == "n")
        {
          txt += "ン";
          string = "";
        } else 
        {
          string = "n";
        }
        break;

      case "y":
        switch (string)
        {
        case "x":
          string = "xy";
          break;

        default:
          string = "y";
          break;
        }
        break;

      case "t":
        switch (string)
        {
        case "x":
          string = "xt";
          break;

        default:
          string = "t";
          break;
        }
        break;

      case "-":
        txt += "ー";
        break;

      default:
        string = a;
        break;
      }
    } else if (mode == 4)
    {
      switch(k)
      {
      case "0":
        txt += "0";
        break;

      case "1":
        txt += "1";
        break;

      case "2":
        txt += "2";
        break;

      case "3":
        txt += "3";
        break;

      case "4":
        txt += "4";
        break;

      case "5":
        txt += "5";
        break;

      case "6":
        txt += "6";
        break;

      case "7":
        txt += "7";
        break;

      case "8":
        txt += "8";
        break;

      case "9":
        txt += "9";
        break;
      }
    }
  }
}
