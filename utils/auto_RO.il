; ---- knobs ----
setq( AutoRO_pollSeconds 300 )     ; check every 5 minutes
setq( AutoRO_idleSeconds  300 )    ; idle threshold 5 minutes
(setq AutoRO_enabled t)
(setq AutoRO_timerRunning nil)

; ---- globals ----
setq( AutoRO_lastDirtyTime (makeTable 'AutoRO_lastDirtyTime nil) )

procedure( AutoRO_makeWindowCurrent(win)
  when(win
    hiSetCurrentWindow(win)
  )
)

procedure( AutoRO_isSchematicCv(cv)
  cv &&
  cv->cellViewType &&
  member(cv->cellViewType '("schematic" "schematicSymbol"))
)

procedure( AutoRO_winCv(win)
  when(win win->cellView)
)

procedure( AutoRO_checkOnce()
  let( (now wins win cv mode lastT idleExceeded)
    now  = getCurrentTime()
    wins = hiGetWindowList()

    foreach(win wins
      cv = AutoRO_winCv(win)
      when( AutoRO_isSchematicCv(cv)
        mode = cv->mode

        when( mode && mode != "r"
          unless(AutoRO_lastDirtyTime[cv]
            AutoRO_lastDirtyTime[cv] = now
          )

          when( cv->modified
            AutoRO_lastDirtyTime[cv] = now
          )

          lastT = AutoRO_lastDirtyTime[cv]
          idleExceeded = (compareTime(now lastT) >= AutoRO_idleSeconds)

          when(idleExceeded
            when( cv->modified
              dbSave(cv)
            )
            AutoRO_makeWindowCurrent(win)
            geChangeEditMode("r")
            printf("Changed %s to Read-Only mode" cv~>cellName)

          )
        )
      )
    )
  )
)

procedure( AutoRO_tick()
  unless(AutoRO_enabled
    return()
  )

  errset(AutoRO_checkOnce() t)

  when(AutoRO_enabled
    hiRegTimer("AutoRO_tick()" AutoRO_pollSeconds*10)
  )
)

procedure( AutoRO_start()
  unless(AutoRO_timerRunning
    (setq AutoRO_enabled t)
    (setq AutoRO_timerRunning t)
    AutoRO_tick()
    printf("AutoRO: started (poll=%d sec)\n" AutoRO_pollSeconds)
  )
)

procedure( AutoRO_stop()
  (setq AutoRO_enabled nil)
  (setq AutoRO_timerRunning nil)
  printf("AutoRO: stopped\n")
)

; If you want it always on when Virtuoso starts:
AutoRO_start()
