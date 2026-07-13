# Upgrade to Crafting (Pro)

## What Pro adds

- **Shaped (grid) recipes.** Author NxN patterns; the bench matches the player's grid arrangement.
- **Timed crafting + queue.** Per-recipe `craft_time`, multi-slot queue with live progress bars.
- **Recipe unlocks.** Unlock by id (`recipe_unlocked` event), or via skill-tree nodes from the Stats / Skill Trees addon.
- **Level requirement.** Per-recipe min level read from your stats system.
- **Station id gating.** Recipes only craftable at the matching station (forge vs. cookpot vs. alchemy bench).
- **`CraftingUI` recipe browser.** Drop-in Control with per-row Craft buttons, progress bars, queue indicator.
- **`GridCraftingUI` shaped bench.** NxN grid accepting drag-drop from Inventory; preview slot shows the matched recipe.
- **Save-contract auto-join.** Queue state, unlock state, XP all persist.
- **Shared `Events` autoload.** `craft_started`, `craft_completed`, `craft_failed`, `recipe_unlocked` flow to Quests for "craft N of X" objectives.

## Migration from Lite

`RecipeLite.inputs` / `outputs` use the same `{item, count}` shape. `CraftingLite.craft(recipe)` carries over. The shaped grid is a superset of the shapeless model — your Lite recipes work as-is in Pro.

## Where to buy

The full version is on itch.io — **https://selodev.itch.io**. Both tiers share the
same field names and method signatures, so upgrading is a class-name swap.

## License

MIT.
