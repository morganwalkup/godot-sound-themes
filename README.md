# Sound Themes

A plugin for playing ui sound effects defined through ui themes.

**Note**: Depends on the `SoundManager` plugin.

### How to use

This process is funky, but stick with me.

1. Open your project's ui theme file, `my_theme.tres`. (If you don't have one, look at `example_theme.tres`)
1. Navigate to the ui element type that you want to add sounds to. (`Button` for this example)
1. Navigate to the `Styleboxes` tab for `Button`
1. Override the `Stylebox` that you want to add sounds to. (`Sound Themes` only supports `focus` and `pressed` for now)
1. Add a metadata property to the `Stylebox`. Call it `sound` and give it a type of `Resource`.
1. Drag and drop your sound effect file into the `sound` metadata property.
1. Done!

### How it works

The plugin creates an autoload singleton called `SoundThemePlayer`.
1. `SoundThemePlayer` listens for ui events like focus changed, ui_accept, and ui_cancel.
1. When a ui event happens, `SoundThemePlayer` gets the focused node's active `Stylebox` from the `Theme`.
1. If `SoundThemePlayer` finds a metadata property called `sound` it plays it using the `SoundManager` plugin
1. That's it!

### Why metadata properties?

It's hacky, but it's the only way to add custom `Resources` to a ui theme.

Using `Resources` allows Godot to handle all of the file references for you. So you're free to rename sound files or move them around in your project without breaking anything.

Adding the resource as a metadata property on the `Stylebox` gives you the added bonus of tying sounds to already-existing ui states like `focus` and `pressed`.

### I want one of my buttons to stop making sounds, or make a different sound

Add a theme override to that button with a new `Stylebox` and change the sound or delete it completely.

If you need to make the change often enough, you can define a new `Variation` within the theme and reuse it throughout your project.