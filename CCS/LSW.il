; from Parshant of CCS #45654811
procedure(saveFile1()
pteOpenForm("Save LSW Info")
pteSaveLSWInfo("./ac_lsw_file1"))

procedure(saveFile2()
pteOpenForm("Save LSW Info")
pteSaveLSWInfo("./ac_lsw_file2"))

procedure(saveFile3()
pteOpenForm("Save LSW Info")
pteSaveLSWInfo("./ac_lsw_file3"))

procedure(loadFile1()
pteOpenForm("Load LSW Info")
pteLoadLSWInfo("./ac_lsw_file1"))

procedure(loadFile2()
pteOpenForm("Load LSW Info")
pteLoadLSWInfo("./ac_lsw_file2"))

procedure(loadFile3()
pteOpenForm("Load LSW Info")
pteLoadLSWInfo("./ac_lsw_file3"))


hiSetBindKey("Palette" "Ctrl Shift<Key>1" "saveFile1()")
hiSetBindKey("Palette" "Ctrl Shift<Key>2" "saveFile2()")
hiSetBindKey("Palette" "Ctrl Shift<Key>3" "saveFile3()")
hiSetBindKey("Palette" "Ctrl Alt<Key>1" "loadFile1()")
hiSetBindKey("Palette" "Ctrl Alt<Key>2" "loadFile2()")
hiSetBindKey("Palette" "Ctrl Alt<Key>3" "loadFile3()")

hiSetBindKey("Layout" "Ctrl Shift<Key>1" "saveFile1()")
hiSetBindKey("Layout" "Ctrl Shift<Key>2" "saveFile2()")
hiSetBindKey("Layout" "Ctrl Shift<Key>3" "saveFile3()")
hiSetBindKey("Layout" "Ctrl Alt<Key>1" "loadFile1()")
hiSetBindKey("Layout" "Ctrl Alt<Key>2" "loadFile2()")
hiSetBindKey("Layout" "Ctrl Alt<Key>3" "loadFile3()")

