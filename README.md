# Void Notify

## Client side
Client Side Usage
```lua
exports['VoidNotify']:NOTIFY(toast, title, message, type, time)
```

## Server side
Server Side Usage
```lua
TriggerClientEvent('VoidNotify:NOTIFY', source, toast, title, message, type, time)
```


### Toast
>Set To `true` To Show A Toast, Set To `false` To Show The Notify

### Title
>Wont Be Shown If Toast

### Message
>The Message Shown

### Types 
| Code | Position |
| --------- | -------- |
| success | Green |
| info | Blue |
| warning | Yellow |
| error | Red |
| question | Grey |
| Image URL | Any Image |

### Time 
>Length In Milliseconds

### Theme 
>light Or dark

### Position
| Code | Position |
| --------- | ----------- |
| top-start | Top Left |
| top | Top Center |
| top-right | Top Right |
| bottom-start | Bottom Left |
| bottom | Bottom Center |
| bottom-right | Bottom Right |
| center-start | Middle Left |
| center | Middle Center |
| center-right | Middle Right |