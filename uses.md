# Go Language Features Usage Table

This table details key Go language features, their specific use cases, and important considerations when working in environments like CGO, TinyGo, and WebAssembly (WASM). Use this guide to evaluate package compatibility with specific functionalities, especially in resource-constrained systems (microcontrollers) or WASM applications running in browsers.

## Core Features

| Feature | Description | CGO | TinyGo | WASM | Specific Use Case | Used in Package |
|---|---|---|---|---|---|---|
| **Goroutines** | Lightweight threads managed by Go's runtime | ✅ Full | ⚠️ Limited | ⚠️ Cooperative | **CGO**: Concurrency with C libraries (careful with callbacks). **TinyGo**: Limited by memory, ideal for sensor tasks. **WASM**: Cooperative scheduling, not preemptive. | ☐ |
| **Channels** | Typed conduits for communication between goroutines | ✅ Full | ⚠️ Restricted | ⚠️ Restricted | **CGO**: Coordinate with C code. **TinyGo**: Use sparingly due to limited memory. **WASM**: Coordinate UI events and DOM updates. | ☐ |
| **Interfaces** | Define behavior through method signatures | ✅ Full | ✅ Full | ✅ Full | **CGO**: Abstract C libraries. **TinyGo**: Abstract device drivers. **WASM**: Plugin systems and polymorphism. | ☐ |
| **Defer** | Schedule function execution upon return | ✅ Full | ✅ Full | ✅ Full | **CGO**: Release C resources. **TinyGo**: Cleanup embedded resources. **WASM**: Cleanup DOM listeners. | ☐ |
| **Panic/Recover** | Runtime error handling mechanism | ✅ Full | ⚠️ Limited | ❌ Unsafe | **CGO**: Handle C library errors. **TinyGo**: Use with caution. **WASM**: Panic can terminate execution. | ☐ |
| **Slices** | Dynamic and flexible views of arrays | ✅ Full | ✅ Full | ✅ Full | **CGO**: Interoperate with C arrays. **TinyGo**: Process sensor data (watch memory). **WASM**: Process JSON and dynamic data. | ☐ |
| **Context** | Manage timeouts, cancellation, and values | ✅ Full | ⚠️ Partial | ✅ Full | **CGO**: Timeouts in C operations. **TinyGo**: Simple task cancellation. **WASM**: HTTP timeouts and event cancellation. | ☐ |
| **Struct Tags** | Metadata for structure fields | ✅ Full | ✅ Full | ✅ Full | **CGO**: Map C structures. **TinyGo**: Encode sensor data. **WASM**: JSON serialization for APIs. | ☐ |
| **Select** | Multiplex operations over multiple channels | ✅ Full | ⚠️ Limited | ⚠️ Limited | **CGO**: Coordinate with C operations. **TinyGo**: Multiplex simple signals. **WASM**: Wait for multiple async events. | ☐ |
| **Go Modules** | Dependency management system | ✅ Full | ⚠️ Restricted | ⚠️ Restricted | **CGO**: Manage C libraries. **TinyGo**: Only compatible modules. **WASM**: Verify browser compatibility. | ☐ |
| **Maps** | Key-value data structure | ✅ Full | ⚠️ Limited | ✅ Full | **CGO**: Cache C data. **TinyGo**: Avoid large maps due to memory. **WASM**: Configuration storage and caching. | ☐ |
| **Syscalls** | Low-level system call interface | ✅ Full | ⚠️ Platform-specific | ❌ Not available | **CGO**: Full access via C. **TinyGo**: Only platform-specific syscalls. **WASM**: Not available, use browser APIs. | ☐ |
| **Network** | Network support (TCP/UDP/HTTP) | ✅ Full | ⚠️ Limited | ⚠️ HTTP/WS only | **CGO**: Full networking with C libraries. **TinyGo**: TCP/UDP on compatible platforms. **WASM**: HTTP and WebSocket via browser APIs. | ☐ |
| **Reflection** | Runtime type inspection | ✅ Full | ❌ Not available | ⚠️ Limited | **CGO**: C type introspection. **TinyGo**: Not available to reduce size. **WASM**: Limited, may increase bundle size. | ☐ |
| **CGO** | Interoperability with C code | ✅ Native | ❌ Not available | ❌ Not available | **CGO**: Use existing C libraries. **TinyGo**: Not supported. **WASM**: Not available in browsers. | ☐ |
| **File I/O** | File input/output operations | ✅ Full | ⚠️ Limited | ❌ Not available | **CGO**: Full access via syscalls. **TinyGo**: Only on platforms with filesystem. **WASM**: Use browser File API. | ☐ |
| **Time/Timers** | Time handling and timers | ✅ Full | ⚠️ Basic | ✅ Full | **CGO**: Precise timers with C. **TinyGo**: Basic time functionality. **WASM**: Full timers via JavaScript. | ☐ |

## Compatibility Legend

- ✅ **Full**: Complete functionality available
- ⚠️ **Limited/Restricted**: Partial functionality or with restrictions
- ❌ **Not available**: Functionality not supported
