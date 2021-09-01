# Create a footprint for a component

Here we will briefly describe how to add your own footprints-libraries to KiCad.
In the main KiCad project manager menu select, or click the `IC-circuit` symbol.

        Tools->Edit PCB Footprints


## Footprint Editor

Note that your footprint library may contains many footprints. In the filesystem, the library is the folder that ends with `<library-name>.pretty`.
Here we will create a generic library for a number of Bosch BME680 environment sensor break-out boards. Since we already created this directory beforehand and decides to use this location, go direct to add the directory. If using another location, use `File->New Library` which essentially creates the pretty-folder.

In the `Footprint Editor` menu, do:

        File->Add Library

Save the library in the `/new-project-name/kicad/new-project-name-symbols/` folder, i.e. your own created footprint folder. Alternatively save the new library in the project folder itself (KiCad default location). After this, the new library should appear in the left pane of loaded libraries as `new-project-name-footprints`, if we used the location we have created with the script. 

The Next dialog that follows will ask for the library scope, Global or Project, select `Project`. This automatically adds this new library to the list
in under project libraries.

        Preferences->Manage Symbol Libraries

Go to `Preferences->Manage Footprints Libraries`. In the Project tab for Libraries use the `MY-FOOTPRINTS` as `Nick name`. I put `MY` as prefix and use all capital letters so it's stands out in KiCad menus and lists.

## Workflow difference with footprints vs schema symbol creation

The major difference when drawing new footprints is that you don't typical create more than the initial project specific `<library-name>.pretty`, which is 
already created by the `kicad-init` script. Thus you use `File->New Footprint` and keep adding footprint to the `<library-name>.pretty`. 
Compared this to when creating new schema symbols, one may keep opt to either adding symbols in an existing library (*.lib), or just create an entirely new library-file.

## New footprint

Create a new footprint with

        File->New Footprint

Name the new footprint `BME680-SPARKFUN`.  
Now draw your symbol. Note that the left pane shows the status, and that it is not yet saved.
Save the new symbol (Ctrl-S), or

        File->Save

You may have to specify in which directory to save the new footprint, thus scroll down in the list and select the newly created above.

## Draw another footprint and add it to the library.

Name the new footprint `BME680-PIMORONI`. Save it once done. 

Continue like so with all footprints you wish to put in the library.

## Exit back to KiCad schema/KiCad Manager

Select

        File->Quit

To go back and continue with the design project.

## Tips

* Grid: Use inch, and set a user-grid (View->Grid Settings) to `0.05`, since pads-separation is `0.10`.
* Top fabrication layer: Outline of part, use 4 mil line thickness
* Front silk screen layer: Indicate parts placement, do not draw on pads. Use 8 mil line thickness. Indicate pin `1` with a dot. 
* Front CrtYrd line: To set keep out, from surrounding area around the part. Use 2 mil line thickness.
* Put parts `REF**` above the footprint, and the name below. 
* The header-pin hole diameter, set to typically 40 mil (ie 1.02 mm), and the pin mask opening to 74 mil.
* Use the `tab` key to zero dx, and dy and then move cursor to measure distance, or use the caliper tool.
* The `anchor` symbol set the center of the footprint if reposition is required.
* Add some text on the Front Silk screen to identify the part.

