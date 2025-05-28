# Tabla de Uso de Características de Go

Esta tabla detalla características clave del lenguaje Go, sus casos de uso específicos y consideraciones importantes al trabajar en entornos como CGO, TinyGo y WebAssembly (WASM). Utiliza esta guía para evaluar la compatibilidad de paquetes con funcionalidades específicas, especialmente en sistemas con recursos limitados (microcontroladores) o aplicaciones WASM que se ejecutan en navegadores.

## Características Principales

| Característica | Descripción | CGO | TinyGo | WASM | Caso de Uso Específico | Usado en Paquete |
|---|---|---|---|---|---|---|
| **Goroutines** | Hilos ligeros gestionados por el runtime de Go | ✅ Completo | ⚠️ Limitado | ⚠️ Cooperativo | **CGO**: Concurrencia con bibliotecas C (cuidado con callbacks). **TinyGo**: Limitadas por memoria, ideales para tareas de sensores. **WASM**: Planificación cooperativa, no preemptiva. | ☐ |
| **Canales (Channels)** | Conductos tipados para comunicación entre goroutines | ✅ Completo | ⚠️ Restringido | ⚠️ Restringido | **CGO**: Coordinar con código C. **TinyGo**: Usar con moderación por memoria limitada. **WASM**: Coordinar eventos UI y actualizaciones DOM. | ☐ |
| **Interfaces** | Definen comportamiento mediante firmas de métodos | ✅ Completo | ✅ Completo | ✅ Completo | **CGO**: Abstraer bibliotecas C. **TinyGo**: Abstraer drivers de dispositivos. **WASM**: Sistemas de plugins y polimorfismo. | ☐ |
| **Defer** | Programa ejecución de función al retornar | ✅ Completo | ✅ Completo | ✅ Completo | **CGO**: Liberar recursos C. **TinyGo**: Limpieza de recursos embebidos. **WASM**: Limpieza de listeners DOM. | ☐ |
| **Panic/Recover** | Manejo de errores en tiempo de ejecución | ✅ Completo | ⚠️ Limitado | ❌ No seguro | **CGO**: Manejar errores de bibliotecas C. **TinyGo**: Usar con precaución. **WASM**: Panic puede terminar la ejecución. | ☐ |
| **Slices** | Vistas dinámicas y flexibles de arrays | ✅ Completo | ✅ Completo | ✅ Completo | **CGO**: Interoperar con arrays C. **TinyGo**: Procesar datos de sensores (vigilar memoria). **WASM**: Procesar JSON y datos dinámicos. | ☐ |
| **Context** | Gestión de timeouts, cancelación y valores | ✅ Completo | ⚠️ Parcial | ✅ Completo | **CGO**: Timeouts en operaciones C. **TinyGo**: Cancelación simple de tareas. **WASM**: Timeouts HTTP y cancelación de eventos. | ☐ |
| **Struct Tags** | Metadatos para campos de estructuras | ✅ Completo | ✅ Completo | ✅ Completo | **CGO**: Mapear estructuras C. **TinyGo**: Codificar datos de sensores. **WASM**: Serialización JSON para APIs. | ☐ |
| **Select** | Multiplexa operaciones sobre múltiples canales | ✅ Completo | ⚠️ Limitado | ⚠️ Limitado | **CGO**: Coordinar con operaciones C. **TinyGo**: Multiplexar señales simples. **WASM**: Esperar múltiples eventos asíncronos. | ☐ |
| **Go Modules** | Sistema de gestión de dependencias | ✅ Completo | ⚠️ Restringido | ⚠️ Restringido | **CGO**: Gestionar bibliotecas C. **TinyGo**: Solo módulos compatibles. **WASM**: Verificar compatibilidad del navegador. | ☐ |
| **Maps** | Estructura de datos clave-valor | ✅ Completo | ⚠️ Limitado | ✅ Completo | **CGO**: Caché de datos C. **TinyGo**: Evitar mapas grandes por memoria. **WASM**: Almacenamiento de configuración y caché. | ☐ |
| **Syscalls** | Interfaz para llamadas al sistema | ✅ Completo | ⚠️ Específico | ❌ No disponible | **CGO**: Acceso completo vía C. **TinyGo**: Solo syscalls específicas de plataforma. **WASM**: No disponible, usar APIs del navegador. | ☐ |
| **Network** | Soporte de red (TCP/UDP/HTTP) | ✅ Completo | ⚠️ Limitado | ⚠️ Solo HTTP/WS | **CGO**: Redes completas con bibliotecas C. **TinyGo**: TCP/UDP en plataformas compatibles. **WASM**: HTTP y WebSocket vía APIs del navegador. | ☐ |
| **Reflection** | Inspección de tipos en tiempo de ejecución | ✅ Completo | ❌ No disponible | ⚠️ Limitado | **CGO**: Introspección de tipos C. **TinyGo**: No disponible para reducir tamaño. **WASM**: Limitado, puede aumentar bundle size. | ☐ |
| **CGO** | Interoperabilidad con código C | ✅ Nativo | ❌ No disponible | ❌ No disponible | **CGO**: Usar bibliotecas C existentes. **TinyGo**: No soportado. **WASM**: No disponible en navegadores. | ☐ |
| **File I/O** | Operaciones de entrada/salida de archivos | ✅ Completo | ⚠️ Limitado | ❌ No disponible | **CGO**: Acceso completo vía syscalls. **TinyGo**: Solo en plataformas con filesystem. **WASM**: Usar File API del navegador. | ☐ |
| **Time/Timers** | Manejo de tiempo y temporizadores | ✅ Completo | ⚠️ Básico | ✅ Completo | **CGO**: Timers precisos con C. **TinyGo**: Funcionalidad básica de tiempo. **WASM**: Timers completos vía JavaScript. | ☐ |

## Leyenda de Compatibilidad

- ✅ **Completo**: Funcionalidad completa disponible
- ⚠️ **Limitado/Restringido**: Funcionalidad parcial o con restricciones
- ❌ **No disponible**: Funcionalidad no soportada

