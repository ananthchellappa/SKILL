## Ananth's SKILL helper compilation - Welcome!

The 5-10 minutes you spend on this README is well worth it.

### What is the SKILL repository?
It is a collection of **utilities and settings** that boost productivity when using Cadence tools like the Virtuoso schematic editor. Mostly, the code has been created using the command logs that show up in the CIW (if not filtered) or the CDS.log. The gems - the difficult ones - depended heavily on help from Cadence AEs - thanks Sameer G, Praveena V, Vikas, Bhupendra, Lalit, Amit Sanadhya, Parul, Sudip, Pragati, Subrata, Ankush, Likesh and others I missed.. The utilities are accessed through keyboard shortcuts (bindkeys in Cadence parlance). The settings are mostly the key-bindings (utilities to key-combo) and other useful things like disabling the blinding (IC6) default grid (i.e., make it similar to IC5) and **(MUST) disabling the Menu-Access restrictions on the ALT and CTRL key** (else, you couldn't use ALT-x for what **you** want but for what Cadence **thinks** you should want :) (`ui enableMenuShortcuts boolean nil`)

### What does it contain?
- **CCS/**  # code obtained from Cadence AEs through support requests
- **dotfiles/** # the `.cdsenv` and `.cdsinit` files with the important settings. View and comment out the ones you don't plan on using. The comments in the files should help. The `load bindkeys.il` in the `.cdsinit` is what loads the bindkey utilities
- **guide.PDF** # cheat sheet (WIP)
- **guide.xlsx** # source for the cheat-sheet so you can customize
- **images/** # some demos captured using Justin Frankel's LICEcap (WIP)
- **utils** # the various utilities (`.il` files) 
- **`bindkeys.il`** the loader

### How do I use it?
1. Find out how your in-house setup loads the user's custom settings. Usually it's through a .cdsinit file in the user's home directory. Sometimes, it's the .cdsinit-user. Sometimes, it's neither of those, but a certain file in the launch directory (in which case, you put a `load "~/.cdsinit"` in **that** file :)
2. Download the repo (extract if necessary) and move it to your unix home directory
3. Replace `/home/USERNAME` with `/home/<YOUR USERNAME>` in the `bindkeys.il` and .cdsinit and .cdsenv
4. "Install" the utilities by using the .cdsinit and .cdsenv as is (or the useful lines from them) -- importantly, loading the bindkeys.il file in the SKILL directory
5. Look at the "Value" column in the cheat-sheet for the high-value bindkeys that can boost your productivity immediately :)


## Demos of the high-value shortcuts (TBD)

- wire thickness on-the-fly editing with ALT+scrollwheel
- label bussing with ALT+scrollwheel
- bus transposing with ALT+SHIFT+scrollwheel
- pin spacing with CTRL+NumKeyPad+/-
- pin name size with CTRL+Arrow
- text size with SHIFT+Arrow
- view name capture with CTRL+SHIFT+s
- path capture with CTRL+ALT+D (unless text selected, in which case you go-to-path indicated by text)
- grid toggle with CTRL+F10
- edit multiple with ALT+SHIFT+Q **very useful**
