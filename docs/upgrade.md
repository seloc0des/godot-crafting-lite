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

## Moving from Lite

The full version installs next to the Lite, in its own folder, and both run in the same project, so you can move over one piece at a time. It isn't a drop-in replacement: the class names differ, and so do some method names.

`CraftingLite` becomes `CraftingComponent`. `can_craft` and `craft` keep their names. `add_recipe`, `bind_inventory` and `block_reason` don't exist in the full version. Your `RecipeLite.tres` files stay Lite resources, so re-create them as the full `Recipe`. `id`, `icon`, `inputs` and `outputs` have the same names, and the Lite's `title` is called `name`.

## Where to buy

The full version is on itch.io: **https://selodev.itch.io**.

## License

MIT.
