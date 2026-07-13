# Quick Start

## Define recipes

```gdscript
var stick_recipe := RecipeLite.new()
stick_recipe.id = "stick"
stick_recipe.title = "Stick"
stick_recipe.inputs  = [{"item": wood, "count": 1}]
stick_recipe.outputs = [{"item": stick, "count": 2}]
```

## Bind to an inventory

```gdscript
@onready var crafting: CraftingLite = $CraftingLite
@onready var bag: Node = $InventoryLite  # any node with has_item/remove_item/add_item

func _ready() -> void:
    crafting.bind_inventory(bag)
    crafting.add_recipe(stick_recipe)
```

## Craft

```gdscript
if crafting.can_craft(stick_recipe):
    crafting.craft(stick_recipe)

# Or react to specific failures:
match crafting.block_reason(stick_recipe):
    "":                    crafting.craft(stick_recipe)
    "missing_inputs":      ui.flash("Not enough materials")
    "no_inventory_bound":  push_error("Bind an inventory before crafting")
```

## Listen

```gdscript
crafting.crafted.connect(func(recipe, outputs):
    print("Crafted: ", recipe.title, " — outputs: ", outputs))

crafting.craft_failed.connect(func(recipe, reason):
    push_warning("Failed: %s (%s)" % [recipe.title, reason]))
```
