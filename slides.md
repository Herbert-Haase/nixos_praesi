---
theme: default
contextMenu: false
title: UWB Concurrent Ranging und Ad-hoc-Netzwerke
aspectRatio: 16/9
colorSchema: light
mdc: true
transition: none
exportFilename: uwb-concurrent-ranging
fonts:
  sans: Franklin Gothic Book, Libre Franklin, Arial, sans-serif
  mono: monospace
  provider: none
---

# title heading

subheading

---

# DS-TWR

<div class="grid grid-cols-2">
<div>

<img src="/ds-twr-timing.webp" class="fig" />
<div class="src">Einzelne Kommunikation. Quelle: <Link to="6">[2]</Link></div>

</div>
<div>

<img src="/ds-twr-overview.png" class="fig" />
<div class="src">Alle Anker. Quelle: eigene Abbildung</div>

</div>
</div>

- 
- 
- 


---

# Concurrent Ranging: einzelne Kommunikation

<img src="/sstwr-vs-concurrent.jpg" class="fig" style="max-height:170px" />
<div class="src">(a) SS-TWR, (b) Concurrent Ranging. Quelle: <Link to="6">[1]</Link></div>

<div class="grid grid-cols-2" style="font-size:0.9rem">
<div>

**(a) SS-TWR**

- t<sub>1</sub>: Initiator sendet POLL
- t<sub>2</sub>: Responder empfängt POLL nach der Laufzeit τ
- t<sub>3</sub>: Responder sendet RESP nach T<sub>RESP</sub>
- t<sub>4</sub>: Initiator empfängt RESP, T<sub>RTT</sub> = 2τ + T<sub>RESP</sub>

</div>
<div>

**(b) Concurrent Ranging**

- t<sub>1</sub>: Initiator sendet ein POLL an alle Responder
- t<sub>2</sub>: Responder i empfängt es nach τ<sub>i</sub>
- t<sub>3</sub>: jeder Responder sendet RESP nach T<sub>RESP,i</sub>
- t<sub>4</sub>: Initiator empfängt die überlagerten RESP, T<sub>RTT,i</sub> = 2τ<sub>i</sub> + T<sub>RESP,i</sub>

</div>
</div>


---

# Concurrent Ranging: alle Kommunikationen

<div class="grid grid-cols-3">
<div>t<sub>1</sub>: Poll<img src="/concurrent-1.png" class="fig fig-sm" /></div>
<div>t<sub>3</sub>: Antwort<img src="/concurrent-2.png" class="fig fig-sm" /></div>
<div>t<sub>5</sub>: Final<img src="/concurrent-3.png" class="fig fig-sm" /></div>
</div>
<div class="src">Eigene Abbildungen</div>

- Multi-User-Detection auf der Channel Impulse Response trennt die Responder
- Skalierung: N+1 Nachrichten bei N Ankern
- Genauigkeit: Dezimeterbereich
- Stromverbrauch: gering <span class="ref"><Link to="6">[1]</Link></span>

---

# Ad-hoc-Netzwerk

- Ein neuer Anker belegt einen freien Antwort-Slot und erscheint als neuer Peak in der Channel Impulse Response
- Ein entfernter Anker antwortet nicht mehr, Tags entfernen ihn nach ausbleibenden Antworten
- Ein neuer Tag muss nur ein POLL senden um registriert zu werden


---

# Quellen

1. Concurrent Ranging: https://dl.acm.org/doi/fullHtml/10.1145/3409477
2. DS-TWR: https://www.researchgate.net/figure/Illustration-of-single-and-double-sided-Two-Way-Ranging-TWR-methods-C2018-IEEE_fig1_330813914
