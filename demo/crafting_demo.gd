extends Node

const DemoBag := preload("res://addons/crafting_lite/_demo_bag.gd")
const CraftingLiteScript := preload("res://addons/crafting_lite/crafting_lite.gd")
const RecipeLiteScript := preload("res://addons/crafting_lite/recipe.gd")

# A trivial in-script item type so this demo runs without other Lite addons installed.
class _Item extends Resource:
	var id: String = ""
	var name: String = ""

var _bag: Node
var _crafting: CraftingLite
var _items: Dictionary = {}
var _recipes: Array = []
var _bag_label: Label
var _recipe_panel: VBoxContainer


func _ready() -> void:
	var bg := ColorRect.new()
	bg.color = Color(0.10, 0.12, 0.16)
	bg.anchor_right = 1; bg.anchor_bottom = 1
	add_child(bg)

	# Items.
	_items["wood"]   = _make_item("wood", "Wood")
	_items["stone"]  = _make_item("stone", "Stone")
	_items["iron"]   = _make_item("iron", "Iron Ingot")
	_items["stick"]  = _make_item("stick", "Stick")
	_items["pickaxe"] = _make_item("pickaxe", "Iron Pickaxe")
	_items["sword"]  = _make_item("sword", "Iron Sword")

	# Bag.
	_bag = DemoBag.new()
	add_child(_bag)
	_bag.contents_changed.connect(_refresh)

	# Crafting.
	_crafting = CraftingLiteScript.new()
	add_child(_crafting)
	_crafting.bind_inventory(_bag)

	# Recipes.
	_recipes = [
		_recipe("stick_recipe", "Stick",
			[{"item": _items["wood"], "count": 1}],
			[{"item": _items["stick"], "count": 2}]),
		_recipe("pickaxe_recipe", "Iron Pickaxe",
			[{"item": _items["iron"], "count": 3}, {"item": _items["stick"], "count": 2}],
			[{"item": _items["pickaxe"], "count": 1}]),
		_recipe("sword_recipe", "Iron Sword",
			[{"item": _items["iron"], "count": 2}, {"item": _items["stick"], "count": 1}],
			[{"item": _items["sword"], "count": 1}]),
	]
	for r in _recipes:
		_crafting.add_recipe(r)

	_build_ui()
	_refresh()


func _make_item(id_: String, name_: String) -> Resource:
	var it := _Item.new()
	it.id = id_; it.name = name_
	return it


func _recipe(id_: String, title: String, ins: Array, outs: Array) -> RecipeLite:
	var r := RecipeLiteScript.new()
	r.id = id_; r.title = title
	r.inputs = ins; r.outputs = outs
	return r


func _build_ui() -> void:
	var layer := CanvasLayer.new()
	add_child(layer)

	var title := Label.new()
	title.text = "Crafting — Lite — Demo"
	title.position = Vector2(16, 12)
	title.add_theme_font_size_override("font_size", 16)
	layer.add_child(title)

	# Material refill buttons (left).
	var mats := VBoxContainer.new()
	mats.position = Vector2(16, 48)
	mats.add_theme_constant_override("separation", 4)
	layer.add_child(mats)
	for mat_key in ["wood", "stone", "iron", "stick"]:
		var b := Button.new()
		b.text = "+5 %s" % String(_items[mat_key].name)
		b.pressed.connect(_bag.add_item.bind(_items[mat_key], 5))
		mats.add_child(b)

	# Bag label.
	_bag_label = Label.new()
	_bag_label.position = Vector2(16, 240)
	_bag_label.add_theme_font_size_override("font_size", 13)
	layer.add_child(_bag_label)

	# Recipe panel (right).
	var panel := PanelContainer.new()
	panel.position = Vector2(360, 48)
	panel.custom_minimum_size = Vector2(520, 420)
	var sb := StyleBoxFlat.new()
	sb.bg_color = Color(0.04, 0.05, 0.07)
	sb.border_color = Color(0.20, 0.22, 0.28)
	sb.set_border_width_all(1); sb.set_corner_radius_all(4)
	sb.content_margin_left = 12; sb.content_margin_right = 12
	sb.content_margin_top = 12; sb.content_margin_bottom = 12
	panel.add_theme_stylebox_override("panel", sb)
	layer.add_child(panel)
	_recipe_panel = VBoxContainer.new()
	_recipe_panel.add_theme_constant_override("separation", 6)
	panel.add_child(_recipe_panel)


func _refresh() -> void:
	# Bag display.
	var lines: Array = ["Bag:"]
	for s in _bag.snapshot():
		lines.append("  • %s ×%d" % [String(s.item.name), int(s.count)])
	if _bag.snapshot().is_empty():
		lines.append("  (empty)")
	_bag_label.text = "\n".join(lines)

	# Recipe panel.
	for c in _recipe_panel.get_children():
		c.queue_free()
	var hdr := Label.new()
	hdr.text = "Recipes"
	hdr.add_theme_font_size_override("font_size", 15)
	_recipe_panel.add_child(hdr)
	for r in _recipes:
		var row := HBoxContainer.new()
		row.add_theme_constant_override("separation", 12)
		_recipe_panel.add_child(row)
		var name_label := Label.new()
		var ins_text: Array = []
		for inp in r.inputs:
			ins_text.append("%dx %s" % [int(inp.count), String(inp.item.name)])
		var outs_text: Array = []
		for outp in r.outputs:
			outs_text.append("%dx %s" % [int(outp.count), String(outp.item.name)])
		name_label.text = "%s — %s → %s" % [String(r.title), ", ".join(ins_text), ", ".join(outs_text)]
		name_label.add_theme_font_size_override("font_size", 12)
		name_label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		row.add_child(name_label)
		var btn := Button.new()
		btn.text = "Craft"
		btn.disabled = not _crafting.can_craft(r)
		btn.pressed.connect(_crafting.craft.bind(r))
		row.add_child(btn)
