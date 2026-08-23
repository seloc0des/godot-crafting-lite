# Changelog

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
