# Dotfiles

Archivos de configuración personalizados para mi entorno de desarrollo.

> [!WARNING]
> EN DESARROLLO, NO ESTÁ COMPLETO

> [!TIP]
> Usar solo de ejemplo, ya que las configuraciones están hechas para mi uso personal.

## Compatibilidad

**Distribuciones de Linux:**

- Arch Linux

**Shells soportados:**

- 🐚 **Fish** - Shell principal con configuración completa
- 🐚 **Bash** - Soporte completo con configuración equivalente
- 🐚 **Zsh** - Configuración básica disponible

## Estructura

```
dotfiles/
├── terminal/
│   ├── bash/          # Configuración para Bash
│   │   ├── .bashrc
│   │   ├── alias/
│   │   ├── funciones/
│   │   ├── dirs/
│   │   └── exports/
│   ├── fish/          # Configuración para Fish
│   │   ├── config.fish
│   │   ├── alias/
│   │   ├── functions/
│   │   ├── dirs/
│   │   └── exports/
│   ├── zsh/           # Configuración para Zsh
│   └── kitty/         # Terminal emulator
├── instalador/        # Scripts de instalación
└── README.md
```

## Características

- ✨ Prompts personalizados con información de Git
- 🎨 Aliases y funciones útiles compartidas entre shells
- 📦 Gestión de paquetes con scripts automatizados
- 🚀 Integración con `zoxide`, `eza`, y otras herramientas modernas
- 🎯 Configuración modular y fácil de mantener
