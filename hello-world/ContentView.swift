import Foundation

let arrows = ["<", "v", "^", ">"]
var score = 0
var hp = 100
var isPlaying = true

// --- СЦЕНКА ПЕРЕД БОЕМ ---
print("Boyfriend: Beep Boop?")
Thread.sleep(forTimeInterval: 1.0)
print("Daddy Dearest: Ха! Попробуй повтори это в консоли!")
Thread.sleep(forTimeInterval: 1.5)
print("\n3... 2... 1... GO!")
Thread.sleep(forTimeInterval: 1.0)

// --- БЕСКОНЕЧНЫЙ ЦИКЛ ---
while isPlaying {
	if hp <= 0 {
		print("\n💀 ТЫ ПРОИГРАЛ! Твой финальный счет: \(score)")
		isPlaying = false
		break
	}

	let currentArrow = arrows.randomElement()!

	// Рисуем статус
	let hpBar = String(repeating: "❤️", count: hp / 20)
	print("\n--------------------------")
	print("HP: \(hpBar) | SCORE: \(score)")
	print("НАЖМИ: [ \(currentArrow) ]")
	print("--------------------------")

	let startTime = Date()

	if let input = readLine() {
		let timeTaken = Date().timeIntervalSince(startTime)

		if input == currentArrow && timeTaken < 2.0 {
			print("✨ В ТОЧКУ! (-0.2 сек)")
			score += 100
			hp = min(100, hp + 5)  // Немного лечимся
		} else {
			print("❌ МИМО ИЛИ МЕДЛЕННО!")
			hp -= 25  // Отнимаем четверть здоровья
		}
	}

	// Небольшая пауза между стрелками
	Thread.sleep(forTimeInterval: 0.2)
}
