# KiCAD init project folder structure 

![Placeholder for missing photographs](./images/placeholder-for-missing-photographs.png)

[Placeholder for missing photographs](./images/placeholder-for-missing-photographs.png)

The `kicad-init` script creates directories for a new project. The shell script initiates the disk folder structure in a consistent manner.
Files and directories are named identical except for the KiCad-project name.

There are four zero bytes files that acts as placeholders for missing files (like the above image), and these should be replaced with real files.

## Install the script

Download or clone this repository, and then copy the shell script into your $PATH

        cd bin
        sudo cp ./kicad-init.sh /usr/local/bin/kicad-init

## Run script

Run the script in the root of the new KiCad project, with the new project name as argument.

        mkdir ~/KICAD-2021
        cd KICAD-2021
        bash kicad-init "new-project-name"

Note that the directory root `new-project-name` is setup as potential github repository, do `git init` to get started.

The script creates following directory structure for the new KiCad project:

        ~/KICAD-2021/new-project-name$ tree -a
        .
        ├── fabrication
        │   ├── gerbers
        │   │   └── placeholder-for-missing-zip-archive
        │   └── placeholder-for-missing-bom-file
        │
        ├── images
        │   └── placeholder-for-missing-photographs.png
        │
        ├── kicad      
        │   ├── placeholder-for-missing-schematic-pdf
        │   ├── new-project-name-footprints.pretty
        │   └── new-project-name-symbols
        │
        ├── libs-downloaded
        │   ├── footprints.pretty
        │   ├── 3d-models
        │   └── symbols
        │    
        ├── .gitignore
        ├── LICENSE.md
        └── README.md

Now, start KiCad in the `new-project-name/kicad` directory, create the new project (`File->New->Project`), and name the new project `new-project-name`. KiCad will create the directory, and populate it with the standard KiCad project-files.

## Directory contents

* **/new-project-name/kicad/new-project-name** - KiCad project, schema and board design files
* **/new-project-name/libs_downloaded** - schema symbols, footprints, and 3D models downloaded from e.g [SnapEDA](https://www.snapeda.com/home/), [UltraLibrarian](https://www.ultralibrarian.com), [Componentsearch](https://componentsearchengine.com), and [grabcad](https://grabcad.com).
* **/new-project-name/kicad/new-project-name-symbols** - schematic symbols drawn by yourself
* **/new-project-name/kicad/new-project-name-footprints.pretty** - footprints drawn by yourself
* **/new-project-name/fabrication** - fabrication output files, bom, gerbers
* **/new-project-name/images** - photographs of the created design

## License Information
-------------------

This creation is _**open source**_! 

Please review the [LICENCE](LICENSE.md) file for license information. 

Distributed as-is; no warranty is given.

- Greetings from the Debinix Team.
