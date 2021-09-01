# Drawing a symbol for schema

Here we will briefly describe how to add your own symbol-libraries to KiCad.
In the main KiCad project manager menu select, or click the `OP-amplifier symbol`.

        Tools->Edit Schematic Symbols


## Symbol Editor

Note that one library file may contain more than one schema symbol.
So when naming the new library keep this in mind, if it only contain one specific part or not.
Here we will create a generic library for many Bosch BME680 environment sensor break-out boards. In the `Symbol Editor` menu, do:

        File->New Library

Name the library `MY-BME680-BOARDS.lib`, put MY as prefix and use all capital letters so it's stands out in KiCad menus and lists. 
Save the library in the `/new-project-name/kicad/new-project-name-symbols/` folder, i.e. your own drawn symbol folder. 
Alternatively save the new library in the project folder itself (KiCad default location).

## Scope

The Next dialog will ask for the library scope, Global or Project, select `Project`. This automatically adds it to the list
in menu.

        Preferences->Manage Symbol Libraries

The new library should now appear in the list of loaded libraries in the left pane as `MY-BME680-BOARDS`. If not
select from the menu.

        File->Add Library

Select the library file just created.

## Draw a new electrical symbol

Begin to create a the new symbol, let's start with Sparkfun's board. In the menu select, or click the `OP-amplifier symbol`.

        File->New Symbol

In the first a dialog window, decide which library to use for the new symbol, select our `MY-BME680-BOARDS`.
This open up a second properties dialog window, here name the part `Sparkfun-BME680`, and press `Enter`.
Now draw your symbol. Note that the left pane shows the status, and that it is not yet saved.
Once finished, save the new symbol (Ctrl-S), or

        File->Save

## Draw another symbol and add it to the library.

Name the new symbol `CJMCU-680`, which is a common unbranded chinese part in six pins configuration.
Save it once done. 

Continue like so with all symbols you wish to put in the library.

## Exit back to KiCad schema/KiCad Manager

Select

        File->Quit

To go back and continue with the design project.

## Tips

In case you need an active low signal, use the `~` before the name like so

        ~CS

This will produce a bar above the name to indicate its active low signal.
Another tips is to use the anchor symbol to center it in the middle of your drawn symbol.
