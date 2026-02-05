# 🎮 Dodge Game - Juego de Esquivar

![Godot Engine](https://img.shields.io/badge/Godot-4.x-478cbf?logo=godot-engine&logoColor=white)
![Plataforma](https://img.shields.io/badge/Plataforma-Android-3DDC84?logo=android&logoColor=white)
![Licencia](https://img.shields.io/badge/Licencia-MIT-green)

Un adictivo juego de supervivencia donde debes esquivar enemigos el mayor tiempo posible. ¡La dificultad aumenta progresivamente!

---

## 📖 Descripción

**Dodge Game** es un juego de acción y reflejos desarrollado en Godot Engine. El objetivo es simple pero desafiante: **mueve tu personaje por la pantalla y evita que los enemigos te toquen**. 

Cada 10 segundos, los enemigos aumentan su velocidad, haciendo el juego progresivamente más difícil. ¿Cuánto tiempo podrás sobrevivir?

---

## ✨ Características

- 🎯 **Jugabilidad simple pero adictiva**: Fácil de aprender, difícil de dominar
- ⏱️ **Sistema de tiempo**: Contador en tiempo real de tu supervivencia
- 🏆 **Sistema de récords**: Guarda automáticamente tu mejor tiempo
- 📈 **Dificultad progresiva**: Los enemigos se vuelven más rápidos cada 10 segundos
- 👾 **Múltiples enemigos**: Enfrenta varios enemigos a la vez
- 🎵 **Música de fondo**: Ambiente sonoro inmersivo
- 📱 **Compatible con móvil**: Exportable a Android
- 💾 **Guardado automático**: Tu récord se guarda localmente

---

## 🎮 Cómo Jugar

### Controles (PC)
- **⬆️ Flecha Arriba**: Mover hacia arriba
- **⬇️ Flecha Abajo**: Mover hacia abajo
- **⬅️ Flecha Izquierda**: Mover hacia la izquierda
- **➡️ Flecha Derecha**: Mover hacia la derecha

### Controles (Móvil)
- 📱 *Nota: Los controles táctiles están en desarrollo*

### Objetivo
1. Presiona **START** para comenzar
2. Esquiva a todos los enemigos
3. Sobrevive el mayor tiempo posible
4. ¡Bate tu récord!

---

## 🛠️ Requisitos Técnicos

### Para Jugar
- **PC**: Windows 7+, macOS 10.12+, o Linux
- **Android**: Android 5.0 (API 21) o superior
- **Resolución**: 1280x720 (16:9)

### Para Desarrollar
- [Godot Engine 4.x](https://godotengine.org/download)
- Sistema operativo: Windows, macOS o Linux

### Para Exportar a Android
- [Android Studio](https://developer.android.com/studio) (opcional pero recomendado)
- Java JDK 17+
- Android SDK

---


## 💻 Desarrollo

### Clonar el Repositorio
```bash
git clone https://github.com/TuUsuario/dodge-game.git
cd dodge-game
```

### Abrir en Godot
1. Abre Godot Engine
2. Click en "Import"
3. Navega a la carpeta del proyecto
4. Selecciona el archivo `project.godot`
5. Click en "Import & Edit"

### Estructura del Proyecto
```
dodge-game/
├── Main.gd              # Script principal del juego
├── Jugador.gd           # Script del personaje jugador
├── Enemigo.gd           # Script de los enemigos
├── assets/              # Recursos (sprites, sonidos)
│   ├── sprites/
│   ├── sounds/
│   └── fonts/
├── scenes/              # Escenas de Godot
│   └── Main.tscn
└── project.godot        # Archivo de configuración del proyecto
```

---

## 🚀 Exportar el Juego

### Exportar para Windows/Linux/macOS
1. En Godot, ve a **Project → Export**
2. Selecciona la plataforma deseada
3. Click en **Export Project**
4. Elige la ubicación y guarda

### Exportar para Android
1. Instala las plantillas de exportación: **Project → Install Android Build Template**
2. Configura el Android SDK en **Editor → Editor Settings → Export → Android**
3. Ve a **Project → Export → Add → Android**
4. Click en **Export Project** y guarda el `.apk`

Para más detalles, consulta la [documentación de Godot](https://docs.godotengine.org/en/stable/tutorials/export/exporting_for_android.html).

---

## 🎨 Personalización

### Ajustar Dificultad
En `Main.gd`, función `_on_dificultad_timer_timeout()`:
```gdscript
enemigo_actual.speed += 20  # Cambia el valor para más/menos dificultad
```

### Cambiar Frecuencia de Aumento
En el nodo `DificultadTimer` (Inspector):
- **Wait Time**: `10` segundos (modifica este valor)

### Añadir Más Enemigos
1. En la escena `Main`, selecciona el nodo `Enemigo`
2. Click derecho → **Duplicate** (Ctrl+D)
3. Reposiciona el nuevo enemigo en una posición diferente

---

## 🐛 Problemas Conocidos

- [ ] Controles táctiles no implementados (solo funciona con teclado)
- [ ] La música de fondo puede no funcionar en algunas exportaciones de Android

---

## 🗺️ Roadmap

### Versión 1.1
- [ ] Implementar controles táctiles para móvil
- [ ] Añadir efectos de partículas en colisiones
- [ ] Sistema de puntuación basado en tiempo

### Versión 2.0
- [ ] Power-ups (escudo, ralentizar tiempo, etc.)
- [ ] Diferentes tipos de enemigos
- [ ] Niveles o modos de juego
- [ ] Tabla de clasificación online

---

## 🤝 Contribuir

¡Las contribuciones son bienvenidas! Si quieres mejorar el juego:

1. Haz un Fork del proyecto
2. Crea una rama para tu característica (`git checkout -b feature/NuevaCaracteristica`)
3. Haz commit de tus cambios (`git commit -m 'Añadir nueva característica'`)
4. Haz Push a la rama (`git push origin feature/NuevaCaracteristica`)
5. Abre un Pull Request

---

## 📄 Licencia

Este proyecto está bajo la Licencia MIT. Consulta el archivo [LICENSE](LICENSE) para más detalles.

---

## 👤 Autor

**Tu Nombre**
- GitHub: [@EstebanSM](https://github.com/EstebanSM85)
- Email: estebansm85@gmail.com

---

## 🙏 Agradecimientos

- [Godot Engine](https://godotengine.org/) - Por el increíble motor de juego
- Comunidad de Godot por los recursos y tutoriales

---

## 📸 Capturas de Pantalla

Pantalla de inicio
<img width="1225" height="680" alt="image" src="https://github.com/user-attachments/assets/738a435c-a935-46de-a8c4-3d68e69fa26b" />


Gameplay
<img width="1223" height="676" alt="Captura de pantalla 2026-02-05 180005" src="https://github.com/user-attachments/assets/e30ec30d-12c5-4ea8-9854-6fbae52e4faf" />


Pantalla record
<img width="1224" height="681" alt="image" src="https://github.com/user-attachments/assets/d67d3d8d-6afa-4ebf-b758-5d764b33e02e" />


---

## 🎮 ¡Diviértete Jugando!

Si te gusta el juego, no olvides darle una ⭐ al repositorio. ¡Gracias!

---

**Versión Actual**: 1.0.0  
**Última Actualización**: Febrero 2026
