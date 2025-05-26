# Dave's Neovim configuration
### credits to Vhyrro

This is a permanent copy of my neovim set up.  I have been watching Vhyrro's Youtube playlist for Neovim to create it.

I may have slight differences between mine and his, but it does work, or did when I put it here.

On Linux, clone it into .config folder.  On Windows, clone it into c:\users\your-username\appdata\local\

Use at your own risk.

### maven project generation

I added a new feature.  It is `create-maven-project`.  It harnesses Maven's archetype:generate feature to start up a new Java project in a folder of your choice.  It will also produce an executable `jar` file out of the box.  Just build with `mvn clean compile assembly:single`.

### kotlin project generation

I was going to do this with maven, but I don't understand kotlin/maven well yet.  This works much simpler.  It uses `kotlinc` with switches to build to a `jar` file in the `target` folder.  It is `create-kotlin-project`.  Copy it to your `/home/username/bin` folder and make sure that is on your path.

There is a build script `KotlinCompile` in the project root folder that will compile and build the `jar` file.


### may be maintained from time to time, but maybe not.
