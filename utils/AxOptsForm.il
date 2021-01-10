procedure(AxOptsForm()
    wins=hiGetWindowList()
    win=setof(y wins y~>hiForm && rexMatchp("awviAxesOptionForm" y~>hiForm))
    hiSetCurrentWindow(car(win))
)

