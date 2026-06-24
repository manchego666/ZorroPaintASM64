# 🦊 ZorroPaintASM64  
### Retro Pixel Editor & UI Builder for MASM (320×200 VGA Mode)  
**© 2026 ZorroDev – All Rights Reserved**

ZorroPaintASM64 is a complete retro graphics suite written entirely in MASM.  
It allows you to draw sprites, UI elements, dialog balloons, tiles, effects, HUD components, and export everything as pure MASM code ready to be used in your own ASM games and systems.

This tool is part of the **ZorroDev Engine 2026**, a full ecosystem for building retro‑style games and graphical applications in real‑mode assembly.

---

## ✨ Features

- 🎨 **64×64 Sprite Editor**  
  Characters, enemies, NPCs, items, icons, tiles, effects.

- 🗨️ **Dialog Balloon Designer**  
  Draw speech bubbles with text rendered pixel‑by‑pixel.

- 🧩 **UI Element Creator**  
  Buttons, panels, HUD bars, windows, cursors, icons.

- 🧱 **Tile & Map Asset Builder**  
  16×16, 32×32, 64×64 tiles for retro maps.

- 💾 **MASM Code Export**  
  Every pixel you draw becomes valid MASM `db` data.

- 🖱️ **Mouse‑Driven Interface**  
  Hover effects, color palette, tools, and clean UI.

- 🦊 **ZorroDev Branding**  
  Retro ASCII fox mascot included in the main menu.

---

## 📐 Technical Specs

- **Resolution:** 320×200 (VGA Mode 13h)  
- **Color Palette:** 32 colors (00h–1Fh)  
- **Language:** MASM (x86 real mode)  
- **Output:** Pure MASM sprite data (`db` rows)  
- **Platform:** DOS / DOSBox / real hardware  

---

## 📁 Project Structure

ZorroPaintASM64/
│
├── src/
│   ├── main.asm
│   ├── video.asm
│   ├── mouse.asm
│   ├── ui_menu.asm
│   ├── ui_editor.asm
│   ├── ui_balloon.asm
│   ├── draw.asm
│   ├── export.asm
│   ├── palette.asm
│   └── font8x8.asm
│
├── include/
│   ├── macros.inc
│   ├── constants.inc
│   ├── font8x8.inc
│   └── sprites.inc
│
├── build/
│   └── ZorroPaintASM64.exe
│
├── projects/
│   ├── RPG2026/
│   ├── Shooter2026/
│   ├── Sandbox2026/
│   └── Demo/
│
└── docs/
├── design_notes.txt
├── roadmap.txt
└── export_format.txt

Código

---

## 🦊 ASCII Mascot (ZorroDev)

/\_/\
( o.o )   ZORRODEV

^ <

Código

---

## 🚀 Roadmap

- [ ] Sprite editor core  
- [ ] UI buttons & hover  
- [ ] Palette selector (00h–1Fh)  
- [ ] Balloon text renderer  
- [ ] MASM export engine  
- [ ] Project gallery system  
- [ ] UI builder (buttons, panels, HUD)  
- [ ] Tile editor (16×16, 32×32, 64×64)  
- [ ] Map builder  
- [ ] PNG export (external tool)  

---

## 📜 License

**© 2026 ZorroDev – All Rights Reserved**  
This project is proprietary.  
No redistribution, modification, or commercial use without explicit permission.

---

## ❤️ About

ZorroPaintASM64 is part of the **ZorroDev Suite**, a personal retro‑engine ecosystem built with love, pixels, and pure assembly.
