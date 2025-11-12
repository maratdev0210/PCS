# Практическое занятие №4 Способы компоновки элементов и контейнеры. Обработка событий. Управление состоянием. Обновление состояния виджетов при нажатии кнопок или других событиях.
# ЭФБО-09-23. Мусагитов Марат

## 1.Скриншот работающего приложения с кнопками и счётчиком.
<img width="961" height="1001" alt="image" src="https://github.com/user-attachments/assets/5ed29c34-9c86-45a6-8c49-f1be982a5038" />

## 2. Скриншот при значении счётчика > 10.
<img width="857" height="1003" alt="image" src="https://github.com/user-attachments/assets/b547d536-7a5d-4a89-acc4-9d22f81e29d6" />

## 3. Скриншот после сброса.
<img width="831" height="1006" alt="image" src="https://github.com/user-attachments/assets/8cc471e9-a415-40a4-b97e-d01c8fd3caa2" />

## Отчёт

При выполнении практической работы были использованы виджеты MaterialApp, Scaffold, AppBar, Center, Column, Text, Container, TextButton, Padding, и SizedBox. 
Реализация состояния осуществляется через StatefulWidget (`CounterPage`). Переменной состояния является `counter` с изначальным значением равным нулю. 
Для обновления значения использовался метод `setState()`, который перерисовывает экран при изменении переменной `counter`. 
```
setState(() {
  counter++; // counter => counter + 1
});
```

```
setState(() {
  counter += 10; // counter => counter + 10
});
```
```
setState(() {
  counter = 0; // counter => counter = 0
});
```



