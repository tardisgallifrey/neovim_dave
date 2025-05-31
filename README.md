# Dave's Neovim configuration
## with some project generators
### credits to Vhyrro

This is a permanent copy of my neovim set up.  I have been watching Vhyrro's Youtube playlist for Neovim to create it.

I may have slight differences between mine and his, but it does work, or did when I put it here.

On Linux, clone it into `.config` folder.  On Windows, clone it into `c:\users\your-username\appdata\local\`

To use the project generators, you should copy them into a `/home/user/bin` folder and ensure that folder is on your `$PATH`.

Use at your own risk.

### maven project generation

I added a new feature.  It is `create-maven-project`.  It harnesses Maven's archetype:generate feature to start up a new Java project in a folder of your choice.  It will also produce an executable `jar` file out of the box.  Just build with `mvn clean compile assembly:single`.

### kotlin project generation

I was going to do this with maven, but I don't understand kotlin/maven well yet.  This works much simpler.  It uses `kotlinc` with switches to build to a `jar` file in the `target` folder.  It is `create-kotlin-project`.  Copy it to your `/home/username/bin` folder and make sure that is on your path.

There is a build script `KotlinCompile` in the project root folder that will compile and build the `jar` file.

### C and CPP project generation
I prefer to use `cmake` with my C and C++ projects.  `create-CXX-project` will create a C project in a folder of your choosing.  Yes, it only does C, but editing to to a `.cpp` project is pretty easy; much easier than a second script.  In addition, a `clean` script to empty the `build` folder and a `compile` script to build the Cmake project are also included.  Normal execution would be `./clean && ./compile` to clean and build the project.

By the way, all of these project generators above require, at minimum, a project name and a destination folder for the project. The results are a folder in the chosen location with your proejct files.

For Example: `create-CXX-project projectName projectLocationFolder`

The maven project location requires three things, I think.  All generators will nominally upchuck if you don't have enough arguments.

### may be maintained from time to time, but maybe not.
