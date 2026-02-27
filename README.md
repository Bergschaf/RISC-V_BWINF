# Nützliche Links
- RISCV-Manual: [riscv-unprivileged](https://docs.riscv.org/reference/isa/_attachments/riscv-unprivileged.pdf)
    - 43: 32-Bit Instructions
    - 62: 64-Bit Instructions
    - 629: Übersicht
(Seitenangaben im PDF)

- RISCV-Instruction encoder und decoder [https://luplab.gitlab.io/rvcodecjs/](https://luplab.gitlab.io/rvcodecjs/) 
- ELF-Format: [Wikipedia](https://en.wikipedia.org/wiki/Executable_and_Linkable_Format)
- Ecall tabelle: 


# Nächste Schritte
- Den Programmteil jedes Program-headers (ab p_offset mit der länge p_filesz) an der stelle p_vaddr in den Arbeitsspeicher laden
- 32 Register implementieren
- Einen Programcounter (PC) implementieren (am Anfang gleich e_entry)
- Die Instruction am Program Counter aus dem Arbeitsspeiher laden (4 Bytes) 
- Die Instruction decodieren
  - Dafür die Tabellen in der [riscv-unprivileged](https://docs.riscv.org/reference/isa/_attachments/riscv-unprivileged.pdf) specification anschauen (siehe Seitenzahlen oben)
  - Tipp: Als erstes den Opcode anschauen um Instruction rauszufinden
      - Zwei Möglichkeiten:
        + Instruction direkt ausführen
        + Instruction zuerst Laden (z.B. Instruction Klasse/Struct, ggf. auch verschieden für R-Type, I-Type etc.)
  - Tipp 2: Debug ausgaben um zu sehen welche Instruction mit welchen Parametern ihr gerade decodiert
    -> Ihr könnt euren Output `hello_world.dump` datei aus dem Github repo vergleichen (am besten nochmal runterladen/clonen, dann sind auch alle dateien gleich)
- Program Counter +4
- Wiederholen 

# Debugging
+ Instructions mit der `hello_world.dump` Datei vergleichen
+ Sobald ihr System Calls implementiert habt:
     -  Die Tests zu den Instructions im Order `tests` ausführen (wir schauen dann gemeinsam was da für syscalls kommen, um zu sehen ob die tests failen oder passen)
  

# VM

## Windows

- `cloudflared` executable runterladen
- Absoluten Pfad von Cloudflare executable kopieren
- ggf Ordner `.ssh` erstellen
- `.ssh/config` editieren:
```
Host bwinf.francloud.org
ProxyCommand ABSOLUTER_PFAD/cloudflared.exe access ssh --hostname %h
```
- `ssh bwinf@bwinf.francloud.org`

## Linux
- `cloudflared` und `ssh` installieren
- `.ssh/config` editieren:
```
Host bwinf.francloud.org
ProxyCommand /usr/local/bin/cloudflared access ssh --hostname %h
```
- `ssh bwinf@bwinf.francloud.org`

## Dateien hoch/runterladen
` scp <source> destination`
Dateien auf dem Server: `bwinf@bwinf.francloud.org:/home/bwinf/test.txt`

# Beachten
- Unterschied der Shift instructions zwischen 32 und 64 bit
- Stack pointer!!!

## Doom 
- Wenn komische writes passieren die nirgendwo im RAM sind, dann ggf UART
- und irgendwann wird der Heap extended? (wie?)

