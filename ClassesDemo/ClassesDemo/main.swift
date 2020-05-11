
let skeleton1 = Enemy(health: 100, attackStrength: 10)
let skeleton2 = skeleton1

skeleton1.takeDamage(amount: 10)

print(skeleton2.health)
