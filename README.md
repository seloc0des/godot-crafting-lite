# Crafting (Lite)

**FREE.** Shapeless instant-craft recipes for Godot 4.5+. Pure GDScript. MIT.

The working core of the [selodev Crafting addon](docs/upgrade.md). Define recipes with inputs and outputs, put crafting on a bench or on the player, and craft from a plain `CraftPanelLite` window.

> **No-code dock.** Enable the plugin and a **Recipes (Lite)** authoring panel appears: create, edit, duplicate and delete your recipes in a UI, with rows for what each one needs and makes. (The Pro tier adds shaped grids, craft times, unlocks and the `EventTrigger` node.)

## One-click setup (no code)

Enable the plugin and a **Crafting · Setup** tab appears in the editor. Pick an outcome, choose where it goes and press **Apply**. What it adds is baked into your scene and stays editable. Apply also hands the crafting every recipe in `res://recipes` (author them in the **Recipes (Lite)** tab), so Apply again after adding recipes.

- **A crafting bench** adds a `CraftingLite` to the selected node, a `CraftArea` around it and a hidden `CraftPanel` on a UI layer. On Play the panel opens at the top centre of the screen when the player walks up, and closes when they walk away or press **Close**. If the node is already an area with a collision shape, the panel opens from that area instead.
- **Player crafts anywhere** adds a `CraftingLite` to your player, marks that node as the player, and adds a hidden `CraftPanel` that the **B** key opens and closes. The tab adds the `crafting` input action on B for you.

The panel lists each recipe with what it needs, how many of each the player has, and what it makes. **Craft** lights up when the player's bag holds everything. It crafts from the player's bag, found on Play through the "player" group, so there's nothing to link by hand.

The status line under **Apply** says what's still missing. If nothing is marked as the player yet, select your player and press **Make the selected node the player**.

The player needs a bag to craft from. The **Inventory · Setup** tab of Inventory (Lite) adds one (**Player inventory**). Any node with `add_item`, `remove_item` and `count_item` works.

## 5-minute install

1. Copy `addons/crafting_lite/` into your project's `addons/` folder.
2. Project → Project Settings → Plugins → enable **Crafting (Lite)**.
3. In the **Recipes (Lite)** tab press **New**. It starts as "New Recipe" (`new_recipe.tres`): type its title, then under **Needs** and **Makes** press **Add row**, pick the item and set the **Count**. **New item** makes an item in `res://items` if you have none yet. Press **Save**.
4. Select your bench, pick **A crafting bench** in the **Crafting · Setup** tab and press **Apply**. For crafting on the go, select your player and pick **Player crafts anywhere** instead.
5. Make sure your player has a bag, save, and press Play.

### From code (optional)

```gdscript
var recipe := RecipeLite.new()
recipe.id = "iron_sword"
recipe.title = "Iron Sword"
recipe.inputs  = [{"item": iron_ingot, "count": 2}, {"item": stick, "count": 1}]
recipe.outputs = [{"item": iron_sword, "count": 1}]

crafting.add_recipe(recipe)
crafting.can_craft(recipe)        # bool
crafting.craft(recipe)            # returns bool, true on success
crafting.block_reason(recipe)     # "" or "missing_inputs" / "no_inventory_bound"
```

Bind a bag with `bind_inventory` (or Inventory Path in the Inspector), or call `crafting.link_player()` to use the one on the "player" group's node. The panel calls it for you when it opens.

## What's missing (and why)

| Feature | Tier |
|---|---|
| Shaped (grid) recipes | Pro |
| Per-recipe craft time + queue | Pro |
| Recipe unlock progression | Pro |
| Level requirement gating | Pro |
| Station id gating (forge vs. cookpot) | Pro |
| Styled `CraftingUI` with icons and progress bars, plus the `GridCraftingUI` bench | Pro |
| Save-contract auto-join | Pro |
| Shared `Events` autoload | Pro |

See [docs/upgrade.md](docs/upgrade.md).

## License

MIT.


## Part of a family

This is one free tier from the selodev catalog of no-code Godot 4 systems. They share an item contract and a save contract, so they plug into each other, and each one also works fully on its own.

Free systems:

- [Inventory Lite](https://github.com/seloc0des/godot-inventory-lite)
- [Equipment Lite](https://github.com/seloc0des/godot-equipment-lite)
- [Loot Lite](https://github.com/seloc0des/godot-loot-lite)
- [Crafting Lite](https://github.com/seloc0des/godot-crafting-lite)
- [Vendor Lite](https://github.com/seloc0des/godot-vendor-lite)
- [Quests Lite](https://github.com/seloc0des/godot-quests-lite)
- [Stats / Skills Lite](https://github.com/seloc0des/godot-stats-skills-lite)
- [Save / Load Lite](https://github.com/seloc0des/godot-save-load-lite)
- [Dialogue Lite](https://github.com/seloc0des/godot-dialogue-lite)
- [Combat Lite](https://github.com/seloc0des/godot-combat-lite)
- [Controller Lite](https://github.com/seloc0des/godot-controller-lite)
- [Enemy AI Lite](https://github.com/seloc0des/godot-enemy-ai-lite)
- [Scene Flow Lite](https://github.com/seloc0des/godot-scene-flow-lite)
- [Audio Lite](https://github.com/seloc0des/godot-audio-lite)
- [Level Builder Lite](https://github.com/seloc0des/godot-level-builder-lite)
- [Weather System Lite](https://github.com/seloc0des/godot-weather-lite)
- [Settings + Menus](https://github.com/seloc0des/godot-settings-menus) (complete and free, no paid tier)

Free VFX: [Magic Cast](https://github.com/seloc0des/godot-magic-cast-vfx-lite), [Elemental Impact](https://github.com/seloc0des/godot-elemental-impact-vfx-lite), [Explosion](https://github.com/seloc0des/godot-explosion-vfx-lite), [Pickup, Buff & Heal](https://github.com/seloc0des/godot-pickup-buff-vfx-lite).

Free starter projects: [Free Starter](https://github.com/seloc0des/free-starter-godot), [Dungeon](https://github.com/seloc0des/godot-dungeon-starter), [Survival](https://github.com/seloc0des/godot-survival-starter), [RPG](https://github.com/seloc0des/godot-rpg-starter).

The full versions add drop-in UI, editor docks and the cross-system wiring. They're on itch.io: **https://selodev.itch.io**
