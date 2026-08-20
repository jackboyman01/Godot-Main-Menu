# Godot 4 Main Menu Template

A clean indie main-menu template for **Godot 4.6**, useful for prototypes and game jams.

## Features

- Start menu with **Start**, **Options**, **Credits**, and **Exit**
- Soft centered panel UI over your background art
- Fade transitions and UI click sounds
- Options:
  - **Master**, **Music**, and **Sound Effects** volume
  - **Fullscreen** toggle
  - Settings saved to `user://`
- Placeholder game scene with music swap

## Requirements

- Godot **4.6** (or compatible 4.x)

## Quick start

1. Open the project in Godot 4.6
2. Run the main scene (`Menu/MainMenu.tscn`)
3. Replace branding:
   - `Menu/Logo.png` - title logo
   - `Menu/background.png` - full-screen backdrop
4. Point **Start** at your game scene in `Menu/MainMenu.gd` (`scene_path_to_load`)

## Customizing look

Shared UI theme lives in `Menu/MainMenu.tres` (buttons, labels, sliders, panel).

Typography uses **[Manrope](https://github.com/sharanda/manrope)** (`Menu/fonts/`), licensed under the SIL Open Font License. See `Menu/fonts/OFL.txt`.

## Credits

Original template by [jackboyman01](https://github.com/jackboyman01/Godot-Main-Menu). Font: Manrope (OFL).
