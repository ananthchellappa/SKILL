procedure(CCSkey()
    wins=hiGetWindowList()
    win=setof(y wins y~>hiForm && rexMatchp("awviPrintWindowForm" y~>hiForm))
    hiSetCurrentWindow(car(win))
)

