# KiCAD init project folder structure 

![Placeholder for missing photographs](./images/placeholder-for-missing-photographs.png)

[Placeholder for missing photographs](./images/placeholder-for-missing-photographs.png)

The `kicad-init` script creates directories for a new project. The shell script initiates the disk folder structure in a consistent manner.
Files and directories are named identical except for the KiCad-project name.

There are some zero bytes files that acts as placeholders for missing files (like the above image), and these should be replaced with real files.

## Install the script

Download or clone this repository, and then copy the shell script into your $PATH

        cd bin
        sudo cp ./kicad-init.sh /usr/local/bin/kicad-init

## Run script

Run the script in the root of the new KiCad project, with the new project name as argument.

        mkdir ~/KICAD-2021
        cd KICAD-2021
        bash kicad-init "new-project-name"

Note that the directory root for `new-project-name` is setup as a potential github repository, do `git init` to get started.

The script creates following directory structure for the new KiCad project:

        ~/KICAD-2021/new-project-name$ tree -a
        ├── 3rd-parties-libraries
        │   ├── tmp        
        │   ├── 3D-models
        │   ├── footprints.pretty
        │   └── schematic-symbols
        ├── fabrication
        │   ├── assembly
        │   │   ├── place-holder-for-missing-bom-file
        │   │   └── place-holder-for-missing-footprint-position-file
        │   └── gerbers
        │       └── placeholder-for-missing-zip-archive
        ├── images
        │   └── placeholder-for-missing-photographs
        ├── datasheets
        │   └── placeholder-for-missing-datasheet-files
        ├── kicad6
        │   ├── new-project-name-3D-models
        │   ├── new-project-name-footprints.pretty
        │   └── new-project-name-schematic-symbols
        ├── LICENSE.md
        ├── README.md
        └── schematic-diagram
            └── placeholder-for-missing-schematic-pdf

## Start KiCad

Now, start KiCad in the `new-project-name/kicad6` directory, create the new project (`File->New->Project`), and name the new project `new-project-name`. KiCad will create this directory, and populate it with the standard KiCad project-files.

## Directory contents

* **/new-project-name/kicad6/new-project-name** - KiCad project, schema and board design files
* **/new-project-name/3rd-parties-libraries** - schematic symbols, footprints, and 3D models downloaded from e.g [SnapEDA](https://www.snapeda.com/home/), [UltraLibrarian](https://www.ultralibrarian.com), [Componentsearch](https://componentsearchengine.com), and [grabcad](https://grabcad.com).
* **/new-project-name/kicad6/new-project-name-schematic-symbols** - schematic symbols drawn by yourself
* **/new-project-name/kicad6/new-project-name-footprints.pretty** - footprints drawn by yourself
* **/new-project-name/kicad6/new-project-name-3D-models** - 3D-models created by yourself
* **/new-project-name/fabrication** - fabrication output files; eg bom, gerbers, assembly footprint position
* **/new-project-name/images** - photographs of the created design
* **/new-project-name/schematic-diagram** - schematic diagram for the created design
* **/new-project-name/datasheets** - important datasheets

## License Information
-------------------

This creation is _**open source**_! 

Please review the [LICENCE](LICENSE.md) file for license information. 

Distributed as-is; no warranty is given.

- Greetings from the Debinix Team.
