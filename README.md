# LabubuLang

**LabubuLang** é uma linguagem de programação minimalista, temática e inspirada em memes da internet como *Labubu*, *Bobbie Goods*, *Morango do Amor* e *Sorvete de Pistache*.
Desenvolvida como um projeto educacional, ela é compilada via **Flex** e **Bison** e gera código de baixo nível compatível com a **MicrowaveVM**, uma máquina virtual minimalista baseada em dois registradores (`TIME` e `POWER`).

A linguagem combina humor e propósito pedagógico: cada palavra meme representa uma operação lógica ou aritmética que pode ser traduzida em instruções reais da MicrowaveVM.

---

## Características

* Sintaxe minimalista e simbólica, inspirada em linguagens como *Brainfuck* e *MeowLang*
* Compilação automática para o assembly da **MicrowaveVM**
* Suporte a:

  * Incremento e decremento de registradores
  * Loops e controle de fluxo
  * Entrada e saída
  * Uso de pilha (push/pop simulados)

---

## EBNF da Linguagem

```ebnf
program       = *(instruction)

instruction   = increment
              / decrement
              / move_right
              / move_left
              / output
              / input
              / loop_start
              / loop_end
              / whitespace
              / comment

increment     = "Labubu"
decrement     = "Bobbie Goods"
move_right    = "Bebe Reborn"
move_left     = "Sorvete de pistache"
output        = "Dame un grr"
input         = "chat qual e a minha bencao"
loop_start    = "Morango("
loop_end      = ")do amor"

whitespace    = 1*(%x20 / %x09 / %x0A / %x0D)   ; espaço, tab, newline
comment       = "#" *(%x00-0x7E)                ; ignora até o fim da linha
```

---

## Exemplo de Programa

### Código `countdown.labubu`

```labubu
# Conta regressivamente de 5 até 1
Labubu
Labubu
Labubu
Labubu
Labubu

Morango(
    Dame un grr
    Bobbie Goods
)do amor
```

### Código gerado (`saida.asm`)

```asm
SET TIME 0
INC TIME
INC TIME
INC TIME
INC TIME
INC TIME

LOOP_START_0:
DECJZ TIME LOOP_END_0
PRINT
DECJZ TIME CONT_0
CONT_0:
GOTO LOOP_START_0
LOOP_END_0:
HALT
```

### Saída esperada (MicrowaveVM)

```
TIME: 5
TIME: 4
TIME: 3
TIME: 2
TIME: 1
BEEEEEEP!
```

---

## Como Compilar e Executar

### Compilar o compilador

```bash
make
```

### Executar um programa LabubuLang

```bash
make run SRC=programa.labubu
```

### Limpar arquivos gerados

```bash
make clean
```
