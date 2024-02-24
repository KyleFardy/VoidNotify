# Void Notify

[Demo Of Notify](https://codepen.io/KyleFardy/pen/RwdzBmR)

[Demo Of Toast](https://codepen.io/KyleFardy/pen/vYPqaPG)

[Join The Discord](https://discord.void-dev.co)

## Client side
Client Side Usage
```lua
Optional : theme, position, sound
exports['VoidNotify']:NOTIFY(toast, title, message, type, time, theme, position, sound)

Example
exports['VoidNotify']:NOTIFY("false", "Test Title", "Test Message", "success", 5000)
```

## Server side
Server Side Usage
```lua
Optional : theme, position, sound
TriggerClientEvent('VoidNotify:NOTIFY', source, toast, title, message, type, time, theme, position, sound)

Example
TriggerClientEvent('VoidNotify:NOTIFY', source, "false", "Test Title", "Test Message", "success", 5000)
```


### Toast
>Set To `"true"` To Show A Toast, Set To `"false"` To Show The Notify

### Title
>Wont Be Shown If Toast

### Message
>The Message Shown

### Types 
| Type      | Colour/Image  |
| --------- | --------- |
| success   | Green     |
| info      | Blue      |
| warning   | Yellow    |
| error     | Red       |
| question  | Grey      |
| Image URL | Any Image |

### Time 
>Length In Milliseconds

### Theme 
>default Or dark

### Position
| Code         | Position      |
| ------------ | ------------- |
| top-start    | Top Left      |
| top          | Top Center    |
| top-right    | Top Right     |
| bottom-start | Bottom Left   |
| bottom       | Bottom Center |
| bottom-right | Bottom Right  |
| center-start | Middle Left   |
| center       | Middle Center |
| center-right | Middle Right  |