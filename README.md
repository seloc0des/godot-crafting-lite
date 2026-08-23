# Crafting (Lite)

**FREE.** Shapeless instant-craft recipes for Godot 4.5+. Pure GDScript. MIT.

The working core of the [selodev Crafting addon](docs/upgrade.md). Define recipes with inputs and outputs. Bind to an inventory. Call `craft(recipe)`.

> **New in v1.1 — no-code dock.** Enable the plugin and an authoring panel appears: create, edit, duplicate, and delete your resources in a UI, no Inspector or `.tres` editing. (The Pro tier adds every field, one-click scene wiring, and the `EventTrigger` node.)

## One-click setup (no code)

Enable the plugin and a **Crafting · Setup** tab appears in the editor. Pick the outcome you want and press **Apply** — the Lite component is added to your scene, baked in and editable. *(Pro unlocks the full no-code wiring — gameplay triggers, bound UI, cross-system hooks.)*

## 5-minute install

1. Copy `addons/crafting_lite/` into your project's `addons/` folder.
2. Project → Project Settings → Plugins → enable **Crafting (Lite)**.
3. Drop a `CraftingLite` Node. Bind it to a bag with `has_item / remove_item / add_item` (Inventory (Lite) or your own).
4. Create `RecipeLite` Resources. Each has `inputs` and `outputs` arrays of `{item, count}` dictionaries.
5. `crafting.craft(recipe)` — instant, no UI required.

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

## What's missing (and why)

| Feature | Tier |
|---|---|
| Shaped (grid) recipes | Pro |
| Per-recipe craft time + queue | Pro |
| Recipe unlock progression | Pro |
| Level requirement gating | Pro |
| Station id gating (forge vs. cookpot) | Pro |
| `CraftingUI` + `GridCraftingUI` drop-ins | Pro |
| Save-contract auto-join | Pro |
| Shared `Events` autoload | Pro |

See [docs/upgrade.md](docs/upgrade.md).

## License

MIT.

---

## Part of a family

The free Lite tier of one system in a set of Godot 4 RPG systems built to
interoperate (shared item + save contracts) — each also works fully standalone.

**Free tiers — try before you buy:**

- [Inventory Lite](https://github.com/seloc0des/godot-inventory-lite) — item slots, stack merging, capacity
- [Equipment Lite](https://github.com/seloc0des/godot-equipment-lite) — 4-slot gear manager
- [Save/Load Lite](https://github.com/seloc0des/godot-save-load-lite) — single-slot JSON persistence
- [Crafting Lite](https://github.com/seloc0des/godot-crafting-lite) — shapeless instant recipes
- [Quests Lite](https://github.com/seloc0des/godot-quests-lite) — COLLECT + KILL quests
- [Stats/Skills Lite](https://github.com/seloc0des/godot-stats-skills-lite) — stat aggregator
- [Vendor Lite](https://github.com/seloc0des/godot-vendor-lite) — single fixed-currency shop
- [Settings + Menu System](https://github.com/seloc0des/godot-settings-menus) — complete, free, no paid tier

**Full versions** — drop-in UI, weight/categories, timed crafting, restock & currencies,
save-aware cross-system integration, and more — are on itch.io:
**https://selodev.itch.io**
