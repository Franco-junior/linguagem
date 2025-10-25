# Compilador e flags
CC = gcc
CFLAGS = -Wall -g

# Arquivos
LEX = scanner.l
YACC = parser.y
MAIN = main.c
TARGET = labubu_compiler
ASM = saida.asm
SRC = exemplo.labubu

# Caminho da MicrowaveVM
MICROWAVE_DIR = ../MicrowaveVM   # ajuste conforme sua pasta
MICROWAVE = python3 main.py

# Regras
all: $(TARGET)

$(TARGET): parser.tab.c lex.yy.c $(MAIN)
	$(CC) $(CFLAGS) parser.tab.c lex.yy.c $(MAIN) -o $(TARGET)

parser.tab.c parser.tab.h: $(YACC)
	bison -d $(YACC)

lex.yy.c: $(LEX) parser.tab.h
	flex $(LEX)

run: $(TARGET) $(SRC)
	./$(TARGET) $(SRC) $(ASM)
	$(MICROWAVE) $(ASM)

clean:
	rm -f $(TARGET) parser.tab.* lex.yy.c $(ASM)
