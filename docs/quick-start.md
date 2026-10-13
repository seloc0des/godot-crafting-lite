# Quick Start

## With the Setup tab (no code)

1. Enable **Crafting (Lite)** in Project → Project Settings → Plugins. The **Crafting · Setup** and **Recipes (Lite)** tabs appear.
2. Make a recipe in **Recipes (Lite)**. Press **New**: it makes `res://recipes/new_recipe.tres`, titled "New Recipe", and opens it in the Inspector too. Type a title. Under **Needs** press **Add row**, pick an item and set its **Count**, once per ingredient. Do the same under **Makes** for what it gives. The item lists show your own items from `res://items` first, then the demo's as examples, and **New item** makes one in `res://items` (name it and pick an icon in the Inspector). Press **Save**. Edits you make to the recipe in the Inspector are kept when you press Save.
3. Give your player a bag if it has none. The **Inventory · Setup** tab of Inventory (Lite) does it: select the player, pick **Player inventory**, press **Apply**.
4. Pick where crafting happens and press **Apply** in **Crafting · Setup**:
   - **A crafting bench**: select the bench first. It gets a `CraftingLite` and a `CraftArea`, and a hidden `CraftPanel` goes on a UI layer. On Play the panel opens at the top centre when the player walks up, and closes when they walk away or press **Close**.
   - **Player crafts anywhere**: select your player first. It gets a `CraftingLite` and is marked as the player, and a hidden `CraftPanel` opens and closes with **B**. The tab adds the `crafting` input action on B.
5. Save and press Play.

Apply hands the crafting every recipe in `res://recipes`, so press **Apply** again after you add recipes. The status line under **Apply** says what's still missing: nothing marked as the player yet (select your player and press **Make the selected node the player**), or no bag on the player.

In the panel each recipe lists what it needs, how many of each the player has, and what it makes. **Craft** lights up when the bag has everything, and a craft that can't happen says why. Only one crafting panel shows at a time.

To move the panel, select it under `UILayer` and drag it or change its anchors. Apply again won't move it back. To change the key, edit the `crafting` action in Project Settings → Input Map.

## From code (optional)

### Define recipes

```gdscript
var stick_recipe := RecipeLite.new()
stick_recipe.id = "stick"
stick_recipe.title = "Stick"
stick_recipe.inputs  = [{"item": wood, "count": 1}]
stick_recipe.outputs = [{"item": stick, "count": 2}]
```

### Bind to an inventory

```gdscript
@onready var crafting: CraftingLite = $CraftingLite
@onready var bag: Node = $InventoryLite  # any node with has_item/remove_item/add_item

func _ready() -> void:
    crafting.bind_inventory(bag)  # or crafting.link_player() for the "player" group's bag
    crafting.add_recipe(stick_recipe)
```

### Craft

```gdscript
if crafting.can_craft(stick_recipe):
    crafting.craft(stick_recipe)

# Or react to specific failures:
match crafting.block_reason(stick_recipe):
    "":                    crafting.craft(stick_recipe)
    "missing_inputs":      ui.flash("Not enough materials")
    "no_inventory_bound":  push_error("Bind an inventory before crafting")
```

### Listen

```gdscript
crafting.crafted.connect(func(recipe, outputs):
    print("Crafted: ", recipe.title, " (outputs: ", outputs, ")"))

crafting.craft_failed.connect(func(recipe, reason):
    push_warning("Failed: %s (%s)" % [recipe.title, reason]))
```
