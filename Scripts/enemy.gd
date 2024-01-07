class_name Enemy extends Area2D

signal killed(points)
signal hit

@export  var speed = 150
@export var hp = 2
@export var points = 100

func _physics_process(delta):
	global_position.y += speed * delta



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func die():
	queue_free()


func _on_body_entered(body):
	if body is Player:
		body.die()
		die()


func take_damage(ammount):
	hp -= ammount
	hit.emit()
	if hp<=0:
		killed.emit(points)
		die()


