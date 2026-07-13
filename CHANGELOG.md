# Changelog

## 1.0.0 — 2026-06-01

Initial release.

- `RecipeLite` Resource — id, title, icon, inputs, outputs (arrays of `{item, count}`).
- `CraftingLite` Node — `add_recipe`, `can_craft`, `block_reason`, `craft`.
- Duck-typed inventory binding (`has_item / remove_item / add_item`).
- Signals: `recipes_changed`, `crafted`, `craft_failed`.
- Demo: 3 recipes (stick, iron pickaxe, iron sword), material refill buttons, live recipe panel with availability state.
