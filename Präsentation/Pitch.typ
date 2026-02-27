#import "@preview/polylux:0.4.0": *
#import "@preview/rivet:0.3.0" : schema
#import "@preview/sns-polylux-template:0.2.0": *
#import "@preview/commute:0.3.0": node, arr, commutative-diagram

/*
  ACHTUNG: You should seriously consider downloading
  the recommended fonts for this package.
  Make sure to install the static versions, because
  Typst does not support variable fonts yet.
  You can find the fonts here:
    https://fonts.google.com/share?selection.family=Roboto+Condensed
    https://fonts.google.com/share?selection.family=Raleway
  You can find the installation guide here:
    https://typst.app/docs/reference/text/text/#parameters-font
*/

#set text(lang: "en")
#show: sns-polylux-template.with(
  aspect-ratio    : "16-9",
  title           : [RISC-V CPU Emulator],
  //subtitle        : [Subtitle],
  event           : [Jugendforum Informatik],
  short-title     : [RISCV],
  short-event     : [Jugendforum Informatik],
  authors         : (
    {
      set text(top-edge: 10pt, bottom-edge: 0pt)
      grid(gutter: 2em, columns: (1fr, 1.8fr),
        align(right,[Christian Krause]),
        align(left,[#link("christian.krause@stud.uni-heidelberg.de")])
      )
    },{
    }
  )
)

#show raw: set text(font: "JetBrains Mono")
#title-slide()
#show raw.where(block: true): set text(0.8em)
#show raw.where(block: true): set par(leading: 0.2em)


#slide(title: [#text(25pt)[Was passiert, bevor ein Programm ausgeführt wird?]])[
  #columns(2)[
  + C-Programm (`hello_world.c`)
  + Assembly Datei (`hello_world.s`) 
  + *Ausführbare Datei* (".exe" auf Windows) (`hello_world`) \
    \
\

    #colbreak()

    ```yasm
    addi    s0,sp,32
    li  a5,3
    sw  a5,-20(s0)
    li  a5,37
    sw  a5,-24(s0)
    lw  a5,-20(s0)
    mv  a4,a5
    lw  a5,-24(s0)
    addw    a5,a4,a5
    sw  a5,-28(s0)
    lw  a5,-28(s0)
    addiw   a5,a5,2
    sw  a5,-28(s0)
    lw  a5,-28(s0)
    mv  a1,a5
    ```
  ]
]

#slide(title: [#text(size: 25pt)[Was passiert, während ein Programm ausgeführt wird?]])[
  - ( Beispiel: *sl*)
  + Program wird in den Arbeitsspeicher geladen
  + CPU läd eine *Instruction* (z.B. addieren, speichern etc.) aus dem RAM
  + CPU führt die Instruction aus \*
  + Wird wiederholt bis das Programm abgeschlossen ist 

  #uncover(2)[
    Was hat *RISC-V* damit zu tun?
  ]
  #uncover(1)[\* Eigentlich passiert da noch ein bisschen mehr]
]


#slide(title: [Werbung])[
  Wir werden
  - Verstehen wie ELF/Assembly Dateien aufgebaut sind
  - Eine virtuelle CPU-Architektur implementieren
  - Programme auf unserer CPU ausführen
  - optional: (Linux ausführen, Doom cross-compilen, (halbes) Betriebssystem implementieren)
  (+ danach könnt ihr Assembly)
]

