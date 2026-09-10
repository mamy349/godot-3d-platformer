# Godot 3D Platformer

A first-person 3D platformer game built with Godot 4, featuring:

## Features
- **First-Person Controller**: WASD movement with mouse look
- **Jump Mechanic**: Press SPACE to jump
- **Shift-Lock**: Press SHIFT to toggle shift-lock mode (camera offset)
- **Coin Collection**: Collectible coins that add to your score
- **Checkpoint System**: Set checkpoints to respawn at those locations
- **Gravity & Physics**: Realistic gravity and movement physics

## Controls

| Action | Key |
|--------|-----|
| Move Forward | W |
| Move Back | S |
| Move Left | A |
| Move Right | D |
| Jump | SPACE |
| Shift-Lock Toggle | SHIFT |
| Mouse Look | Mouse Movement |

## Input Map Setup

Make sure to configure these input actions in **Project Settings > Input Map**:

1. `move_forward` → W
2. `move_back` → S
3. `move_left` → A
4. `move_right` → D
5. `jump` → SPACE
6. `shift_lock` → SHIFT

## File Structure

- `player.gd` - Main player controller script
- `coin.gd` - Coin collectible script
- `checkpoint.gd` - Checkpoint trigger script
- `input_map.gd` - Input configuration reference

## How to Use

1. Create a new Godot 4 project
2. Add these scripts to your scene nodes
3. Configure the input map as described above
4. Set up your 3D scene with:
   - A CharacterBody3D node for the player (attach `player.gd`)
   - Area3D nodes for coins (attach `coin.gd`)
   - Area3D nodes for checkpoints (attach `checkpoint.gd`)
   - A Camera3D as a child of a pivot node under the player

## Game Mechanics

- **Coins**: Walk over coins to collect them and increase your score
- **Checkpoints**: Walk over checkpoints to set your respawn point
- **Respawning**: If you fall below y = -20, you respawn at your last checkpoint or at the starting position
