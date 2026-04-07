# deadfish-repl ![C](https://img.shields.io/badge/Мова-C-blue?style=flat-square) ![Статус](https://img.shields.io/badge/Статус-Реліз-green?style=flat-square) ![Ліцензія](https://img.shields.io/badge/Ліцензія-CC0-green?style=flat-square) ![Парадигма](https://img.shields.io/badge/Парадигма-Езотерична-red?style=flat-square) ![Архітектури](https://img.shields.io/badge/Архітектури-14%20Підтримується%20(Майже%2015)-blueviolet?style=flat-square)
Deadfish REPL написаний в C. \
\
([English (US)](README.md))
| Архітектура | Статус |
| :--- | :--- |
| **x86_64** | ![Пройдено](https://img.shields.io/badge/-Пройдено-green?style=flat-square) |
| **x86** | ![Пройдено](https://img.shields.io/badge/-Пройдено-green?style=flat-square) |
| **ARM64** | ![Пройдено](https://img.shields.io/badge/-Пройдено-green?style=flat-square) |
| **ARM32** | ![Пройдено](https://img.shields.io/badge/-Пройдено-green?style=flat-square) |
| **x86_64 Windows** | ![Пройдено](https://img.shields.io/badge/-Пройдено-green?style=flat-square) |
| **x86 Windows** | ![Пройдено](https://img.shields.io/badge/-Пройдено-green?style=flat-square) |
| **WASM32** | ![Пройдено](https://img.shields.io/badge/-Пройдено-green?style=flat-square) |
| **MIPS** | ![Пройдено](https://img.shields.io/badge/-Пройдено-green?style=flat-square) |
| **MIPSEL** | ![Пройдено](https://img.shields.io/badge/-Пройдено-green?style=flat-square) |
| **PowerPC x32 MSB** | ![Пройдено](https://img.shields.io/badge/-Пройдено-green?style=flat-square) |
| **RISC-V64** | ![Пройдено](https://img.shields.io/badge/-Пройдено-green?style=flat-square) |
| **RISC-V32** | ![Пройдено](https://img.shields.io/badge/-Пройдено-green?style=flat-square) |
| **SPARC** | ![Незавершено](https://img.shields.io/badge/-Незавершено-orange?style=flat-square) |
| **LoongArch 64** | ![Пройдено](https://img.shields.io/badge/-Пройдено-green?style=flat-square) |
| **S390X** | ![Пройдено](https://img.shields.io/badge/-Пройдено-green?style=flat-square) |
## Що це таке?
Маленька C программа, яка може виконувати программу написанну в езотеричної программної мови під назвою Deadfish. ([езолангс  вікі](https://esolangs.org/wiki/Deadfish))

Ця программа працює як інтерпретер, тобто ця программа виконує конкретний Deadfish код, в залежності від інструкції яку користувач надав.

Оскільки ця программа дуже проста, ви можете портнути її на майже всюди (на більшість архітектур ви користуєтесь)

## Як це працює?
Ця программа питає користувача вхідні дані, 
- після цього порівняе якщо вхідний символ це сивлой нової лінії/eof, якщо так, пропускає, \
- якщо інструкція це I, воно збільшує акумулятор на один, \
- якщо це D, віднімає від аккумулятора один, \
- S підносить акумулятор до квадрата, \
- O виводить на дісплей значення акумулятора **як число**, \
- H зупиняє, \
- та після кожної інструкції перевірює якщо значення акумулятора дорівнює -1 ч 256. Якщо так, змінює значення акумулятора на нуль.
  
> [!IMPORTANT]
> Оскільки існують варіації Deadfish, подивиться [цю сторінку](https://esolangs.org/wiki/Deadfish#Commands), або перегляньте цей список

| Варіація | Збільшити | Зменшити | Піднести до квадрата | Вивести | Зупинити (не обов'язково) |
| :--- | :---: | :---: | :---: | :---: | :---: |
| **Звичайний Deadfish** | `i` | `d` | `s` | `o` | `h` |
| **XKCD варіація** | `x` | `d` | `k` | `c` | |
| **f() варіація** | `f` | `f()` | `f ()` | `f(())` | |
| **F!-- варіація** | `F!` | `U!` | `C!` | `K!` | |
| **嘭！哐！叮！呲！咣！ варіація** | `嘭！` | `哐！` | `叮！` | `呲！` | |
| **Sakana варіація** | `増` | `減` | `乗` | `出` | `停` |
| **ΙΧΘΥΣ варіація** | `ι` | `χ` | `θ` | `υ` | |
| **Pește mort варіація** | `c` | `s` | `p` | `i` | `o` |
| **Нумерована варіація** | `1` | `2` | `3` | `4` | `5` |

> [!NOTE]
> Використовує getchar/fgets/getwchr щоб отримати інструкції, printf щоб виводити.

## Можу я перенести цю програму?

Так, ви можете. Наспавді, якщо тут немає вашої архітектури, портуйте цю программу або використовуючи zig, або специфічни версії gcc щоби перенести.

## Warning

> [!WARNING]
> Все в цій гілкі - бета, основна вітка отримає бета-код, якщо бета-код працює.
