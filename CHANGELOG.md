# Changelog

## 1.4.3 (2026-10-12)

The tabs show their names on Godot 4.5.

- **The Crafting · Setup and Recipes (Lite) tabs were blank on Godot 4.5.** Their tabs beside the
  Inspector had no title, so "open the Crafting · Setup tab" pointed at nothing. They are named when
  the pack switches on now. Godot 4.7 was not affected.

## 1.4.2 (2026-09-28)

Lists that stay readable at any editor scale.

- **The Recipes (Lite) list always shows about five rows**, at any editor scale. At 125% it came out
  a few rows tall. The divider under it still drags.
- **A file the tab makes is registered with Godot as soon as it's written**, so pressing Play
  straight away can't warn "invalid UID".

## 1.4.1 (2026-09-27)

Both tabs fit a default dock.

- **The Setup and authoring tabs fit a default dock.** A tab taller than the dock scrolls, and lists
  show what you just made the next time they open.

## 1.4.0 (2026-09-27)

Crafting you can use without writing code.

- **A crafting panel with no code.** A bench opens a panel when the player walks up: each recipe
  with what it needs and a Craft button. Walking away or Close shuts it. "Player crafts anywhere"
  opens it with B.
- **Recipes are edited as rows** in the Recipes (Lite) tab: what it needs and what it makes, each an
  item picked from a list with a count.
- **The Recipes (Lite) tab shows its fields in the editor.** It was empty there, because a recipe
  loads as a placeholder in the editor.
- **New in the tab names the recipe** ("New Recipe", new_recipe) and opens it in the Inspector, and
  Inspector edits survive the tab's Save. Save used to wipe ingredients added in the Inspector.
- **Apply hands the component every recipe in `res://recipes`.** Recipes you added by hand from
  other folders stay, and ones you delete from `res://recipes` drop out.
- **Each node you Apply it to gets its own crafting.** Applying to a parent (a Town, or the scene
  root) used to take over the crafting on one of its children.
- **"Player crafts anywhere" marks the node as the player**, and pressing Apply twice in a row keeps
  that mark on the player.
- Six example items in the demo.
- **Pressing Play right after Apply includes what it added.** The Setup tab never marked the scene
  as changed, so Play ran the saved version without it.
- **The crafting node is added the way a node you add by hand is**, so its game code doesn't run in
  the editor.
- **Nodes the Setup tab adds get readable names.** A second one under the same parent is
  called something like `UILayer2`, instead of a generated name full of `@` signs.
- **Long status messages in the authoring tab wrap** instead of running off the edge of the dock.

## 1.3.0 (2026-08-22)

- Engine floor moves to Godot 4.5. The project and the plugin description both
  said 4.3 before, which no longer matched the code.
- The addon and its docs now say selodev throughout. The old CindieForge name
  was still in the README and the upgrade notes after the rebrand.

## 1.2.0 — 2026-07-24

One-click no-code setup.

- New **Crafting · Setup** panel (the first dock tab): pick the outcome you want → **Apply** → the Lite component is added to your scene, baked in and re-editable.
- Pro unlocks the full no-code wiring — gameplay triggers, bound UI, and cross-system hooks.

## 1.1.0 — 2026-07-24

No-code authoring dock.

- New editor dock: author `RecipeLite` recipes through a UI panel — create, edit, duplicate, delete, no `.tres` hand-editing. (The Pro tier adds every field, one-click scene wiring, and the `EventTrigger` node.)

## 1.0.0 — 2026-06-01

Initial release.

- `RecipeLite` Resource — id, title, icon, inputs, outputs (arrays of `{item, count}`).
- `CraftingLite` Node — `add_recipe`, `can_craft`, `block_reason`, `craft`.
- Duck-typed inventory binding (`has_item / remove_item / add_item`).
- Signals: `recipes_changed`, `crafted`, `craft_failed`.
- Demo: 3 recipes (stick, iron pickaxe, iron sword), material refill buttons, live recipe panel with availability state.
